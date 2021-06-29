# GraphQL-tutorial
Tutorial for GraphQL + Node  Express + MySQL, and sample for Android / iOS client

# Materials
- [Starter tutorial](https://github.com/neoroman/GraphQL-tutorial/tree/main/starter#graphql-tutorial-starter) at ${TOP_DIR}/[starter](https://github.com/neoroman/GraphQL-tutorial/tree/main/starter)/
- [Final tutorial](https://github.com/neoroman/GraphQL-tutorial/tree/main/final#graphql-tutorial-for-final) at ${TOP_DIR}/[final](https://github.com/neoroman/GraphQL-tutorial/tree/main/final)/
- Client sample projects for further study at ${TOP_DIR}/[clientSample](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample)/{[android](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample/android#android-sample-for-graphql-tutorial)|[ios](https://github.com/neoroman/GraphQL-tutorial/tree/main/clientSample/ios#ios-sample-for-graphql-tutorial)}

# Prerequisite
* Install node (+ npm)
```
curl "https://nodejs.org/dist/latest/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"
```
or
```
brew install node
```
* Install sequelize-auto
```
brew install sequelize-auto
```

# Requirements
- macOS or Windows PC
- node 11.0 or later
- npm 7.0 or later
- (Optional) DBeaver.app 21.0 or later
- (Optional) pm2 5.0 or later
   ```
   brew install pm2
   ```
