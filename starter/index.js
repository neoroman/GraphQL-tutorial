import { GraphQLServer } from "graphql-yoga";
import resolvers from "./graphql/resolvers";

const config = require(__dirname + '/config/config.json');
const PORT = config.PORT;

const options = {
  port: PORT,
  endpoint: "/api",
  playground: "/play"
};

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

const app = server.express;

server.start(options, () => console.log("Graphql Server Running on localhost:%s", PORT));
