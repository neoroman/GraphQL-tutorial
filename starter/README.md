# GraphQL-tutorial starter
Sample of GraphQL-Yoga + Express + JWT

# Install
1. Install mysql server
2. Restore mysql from `migrations/dump-sample_db_graphql.sql` file
3. npm install
4. npm start

# Authentication
1. Client call /secure with ID and Password
2. /secure response is JWT(JSON Web Token)
3. Client set header of request with token:<given token>
4. Check token validation with /secure/check
5. Client receive error unless JWT header for request
