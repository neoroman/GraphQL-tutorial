# GraphQL-tutorial starter
  * Sample of GraphQL-Yoga + Express + JWT

# Blog
- [NeoRoman's GraphQL-tutorial (Korean)](https://neoroman.github.io/GraphQL-tutorial/#GraphQL%20%EC%8B%9C%EC%9E%91)

---
## Install

1. Install mysql server
  * Intall `mysql` via [HomeBrew](https://brew.sh/index_ko)
  ```
  $ brew install mysql
  ```
  * Start `mysql` service as daemon
  ```
  $ brew services start mysql
  ```
  * Set root password of mysql database
  ```
  $ mysql -uroot
  mysql> USE mysql
  mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'qwer1234';
  mysql> FLUSH PRIVILEGES;
  mysql> quit
  ```
  * Create `sample_db_graphql` database
  ```
  $ mysql -uroot -p
  mysql> CREATE DATABASE sample_db_graphql;
  mysql> quit
  ```
  
2. Restore mysql from `seeders/dump-sample_db_graphql.sql` file.
  ```
  $ mysql -uroot -p sample_db_graphql < ./seeders/dump-sample_db_graphql.sql
  ```
  
3. npm install
  ```
  $ npm install
  ```
  - If `sh: nodemon: command not found` error occurred
    ```
    $ npm i -g nodemon
    ```

4. npm start
  ```
  $ npm start
  ```
  - Then you've met following messages:
    ```
    [nodemon] 2.0.7
    [nodemon] to restart at any time, enter `rs`
    [nodemon] watching path(s): *.*
    [nodemon] watching extensions: js,mjs,json
    [nodemon] starting `babel-node index.js`
    Graphql Server Running on localhost:4000
    ```
    > You can stop service with `Ctrl-C`.

<BR />

---
## Generate models for GraphQL

1. Paste and go following URL, 
  [http://localhost:4000/play](http://localhost:4000/play) in your favorite web browser (Google Chrome recommended)

2. Type query like followings:
    ``` graphql
      query {
          getUserInfo(id: "neoroman") {
            id
            name
          }
      }
    ```
  ![Playground.GIF](https://github.com/neoroman/GraphQL-tutorial/raw/main/screenshots/02_input_query_in_playground.gif)

3. Meet first error like followings:
    ```
    ...
    Error: Cannot return null for non-nullable field Query.getUserInfo.
    ...
    ```
    > Now you need models between GraphQL resolvers and MySQL.

4. Install `sequelize-auto` if you've not installed
    ```
    $ brew sequelize-auto
    ```

5. Running `sequelize-auto` for generating `GraphQL Schema` with MySQL datebase `root` password = `qwer1234`.
    > Warning: using a password on the command line interface can be insecure.
        
     ```
     $ sequelize-auto -c config/sequelize-auto.config.json -x qwer1234
     ```
      > Now you could find `{TABLE_NAME}.js` files in folder `./models` !
  

6. Open `graphql/resolvers.js`
   - Change codes commente No.1 and No.2 like followings:
     ``` javascript
     const resolvers = {
         Query: {
             getUserInfo: async (parent, args, context, info) => {
                 try { 
                     // 1
                     let userId = { id: args.id }
                     const items = await AdminUser.findAll({ where: userId });
                     return items; 
                 } 
                 catch(err) {console.log(err);} 
             }
         },
         Mutation: {
             putUserInfo: async (parent, args, context, info) => {
                 try {
                     // 2
                     const user = await AdminUser.findOne({ where: { id: args.id } });
                     if (user) {
                         if (args.password) {
                             user.set('password', args.password);
                             user.set('updateTime', (new Date()));
                         }
                         if (args.email) {
                             user.set('email', args.email);
                         }
                         return await user.save();
                     }
                     return new Error("putUserInfo: cannot find user:", args.id);
                 }
                 catch(err) {
                     console.log(err)
                     return new Error("putUserInfo", err);
                 };
             }
         }
     }
     ``` 
     1. Query to `AdminUser` table where userId == args.id
     2. Update `AdminUser` table where userId == args.id
 
7. Click `play` button again, you could see the success result, Violla!
![Playground Query Success](https://github.com/neoroman/GraphQL-tutorial/raw/main/screenshots/03_playground_result_success.png)
