# GraphQL-tutorial
Tutorial for GraphQL + Node  Express + MySQL, and sample for Android / iOS client

# Blog
- [NeoRoman's GraphQL-tutorial (Korean)](https://neoroman.github.io/GraphQL-tutorial/)


# Materials
- [Starter tutorial](https://github.com/neoroman/GraphQL-tutorial/tree/main/starter#graphql-tutorial-starter) at ${TOP_DIR}/[starter](https://github.com/neoroman/GraphQL-tutorial/tree/main/starter)/
- [Final tutorial](https://github.com/neoroman/GraphQL-tutorial/tree/main/final#graphql-tutorial-for-final) at ${TOP_DIR}/[final](https://github.com/neoroman/GraphQL-tutorial/tree/main/final)/
- Client sample projects for further study at ${TOP_DIR}/[clientSample](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample)/{[android](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample/android#android-sample-for-graphql-tutorial)|[ios](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample/ios#ios-sample-for-graphql-tutorial)}

# Prerequisite
* Install node (+ npm)
   ```
   curl "https://nodejs.org/dist/latest/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest-v14.x/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"
   ```
     or (node@14 recommended)
   ```
   brew install node@14
   ```
* Install sequelize-auto
   ```
   brew install sequelize-auto
   ```

# Requirements
- macOS or Windows PC
- node 11.0 or later (recommend node@14.17.2)
- npm 7.0 or later (recommend npm@7.19.1)
- (Optional) DBeaver.app 21.0 or later
- (Optional) pm2 5.0 or later
   ```
   brew install pm2
   ```
