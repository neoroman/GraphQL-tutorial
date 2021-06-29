import { GraphQLServer } from "graphql-yoga";
import resolvers from "./graphql/resolvers";
import express from "express";
import session from "express-session";
import ms from "ms";
import * as jwt from "jsonwebtoken";
const db = require(__dirname + '/models').sequelize;
const fs = require("fs");

const config = require(__dirname + '/config/config.json');
const PORT = config.PORT;
const SECRET = config.SECRET;

const options = {
  port: PORT,
  endpoint: "/api",
  playground: "/play",
  cors: {
    credentials: true,
    origin: ["http://localhost:5000"] // your frontend url.
  }
};
if (fs.existsSync(__dirname + "/ssl")
  && process.env.NODE_ENV !== 'development') {
  const privateKey = fs.readFileSync(config.keyFile);
  const certificate = fs.readFileSync(config.certFile);
  options['https'] = {
    cert: certificate,
    key: privateKey
  }
}

// middleware of check jwt
function checkJwt(req, res, next) {
  if (req.headers && req.headers.token) {
    const token = req.headers.token;
    var currentSession;

    try {
      currentSession = jwt.verify(token, SECRET);
    }
    catch(err) { res.json(err); return; }

    try {
      if (!currentSession.user) {
        res.json({error: { message: 'You must be logged in... token is missing!' }});
        throw new Error('You must be logged in... token is missing!');
      }

      if (currentSession.user.id) {
        // TODO: do something more elegantly...!
        db.query("SELECT id, password FROM ADMIN_USER WHERE status = 'C0000001' AND id = '" + currentSession.user.id + "' limit 1;")
          .then(
            function(result) {
              const user = result[0][0];
              if ( !(user && user.id === currentSession.user.id 
                && user.password === currentSession.user.password) ) {
                  res.status(401).send("Unauthorized: wrong id or password");
                  throw new Error('Unauthorized: wrong id or password');
              }}
          );
      }

      req.user = currentSession.user;
    } catch(err) {
      throw new Error(`You must be logged in (${err})`);
    }
  } else {
    throw new Error(`You must be logged in ...`);
  }
  next(); 
}

const server = new GraphQLServer({ 
  typeDefs: __dirname + "/graphql/schema.graphql", 
  resolvers,
  context: (req) => {
    return {
      user: req.request.user,
      appVersion: req.request.appVersion
    };
  }
});

// session middleware
server.use(session({
  name: "GraphQL-tutorial API",
  secret: SECRET,
  resave: true,
  saveUninitialized: true,
  cookie: {
    secure: process.env.NODE_ENV === 'production',
    maxAge: ms('1d'),
  },
}));


const app = server.express;
const router = express.Router()
app.use(express.json()) // for parsing application/json
app.use('/', router)

// jwt credential 
// app.use(options.endpoint, checkJwt);
// app.use(options.endpoint, (err, req, res, next) => {
//     if (err) return res.status(401).send(err.message);
//     next();
//   }
// )

// Refer to https://stackoverflow.com/a/48476897
app.post('/secure', function(req, res) {
    const body = req.body;
    const token = jwt.sign({ user: { id: body.id, password: body.pwd } }, SECRET);

    console.log(token);
    res.json({ token: token });
});
app.post('/secure/check', function(req, res) {
    const token = req.headers.token;
    const x = jwt.verify(token, SECRET);

    console.log("Session of /secure/check => " + JSON.stringify(sess));

    if (x.hasOwnProperty("user") && x.user.hasOwnProperty("id") && x.user.id.length > 0) {
      res.json({ auth: true });
    } else {
      res.json({ auth: false });
    }
});

server.start(options, () => console.log("Graphql Server Running on localhost:%s", PORT));
