# GraphQL-tutorial for final
Sample of GraphQL-Yoga + Express + JWT

# Install
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
3. Restore mysql from `migrations/dump-sample_db_graphql.sql` file: [migrations/dump-sample_db_graphql.sql](https://raw.githubusercontent.com/neoroman/GraphQL-tutorial/main/final/migrations/dump-sample_db_graphql.sql)
   ```
   $ mysql -uroot -p sample_db_graphql < ./migrations/dump-sample_db_graphql.sql
   ```
   
5. npm install
   ```
   $ npm install
   ```

7. npm start
   ```
   $ npm start
   ```


# GraphQL playground
1. Open your favorite web browser (recommend Goolge Chrome)
2. Paste and go to http://localhost:4000/play
3. You could check like followings:
 - [![Screenshot](https://github.com/neoroman/GraphQL-tutorial/blob/main/screenshots/01_GraphQL-playground.png?raw=true)](http://localhost:4000/play)
4. Copy and paste [graphql/playgroundQuery.txt](https://raw.githubusercontent.com/neoroman/GraphQL-tutorial/main/final/graphql/playgroundQuery.txt) queries into left pane of GraphQL playground


# Authentication (Optional)
1. Client call /secure with ID and Password
2. /secure response is JWT(JSON Web Token)
3. Client set header of request with token:<given token>
4. Check token validation with /secure/check
5. Client receive error unless JWT header for request