# Android Sample for GraphQL-tutorial


# Prerequisite
1. [Ktor and GraphQL of RayWenderlich](https://www.raywenderlich.com/18858740-ktor-and-graphql-getting-started)
2. Read [GraphQL-tutorial/final/README.md](https://github.com/neoroman/GraphQL-tutorial/tree/main/final#graphql-tutorial-for-final)
3. Check running GraphQL playground


# Requirements
- Kotlin 1.5.10
- Gradle 4.2.1
- Android min SDK 28
- Android target SDK 30
- etc


# Installation

1. Set Gradle(::app)(Used apollo version : 2.5.5)
```
plugins {
  id("com.apollographql.apollo").version("x.y.z")		
}
  
apollo {      
  generateKotlinModels.set(true)  //Use it if you want to use it in the kotlin style (Write it down in Android brackets)
}

dependencies {
  implementation "com.apollographql.apollo:apollo-runtime:x.y.z"
  implementation "com.apollographql.apollo:apollo-coroutines-support:x.y.z"
  implementation "org.jetbrains.kotlinx:kotlinx-coroutines-android:x.y.z"   //if you make with coroutine (Used coroutine version 1.4.2)
}
```
2. Get Schema (Used terminal) (Write in your Android project directory)
```
$ mkdir -p app/src/main/graphql/com/shong/angelnetandroid
$./gradlew :app:downloadApolloSchema \
--endpoint='https://boan.uangel.com:4000/api' \
--schema='app/src/main/graphql/com/shong/angelnetandroid/schema.json' \
```
3. Add Manifest
```
android:usesCleartextTraffic="true"   //For http call
  
<uses-permission android:name="android.permission.INTERNET"/> //Add internet permission
```  
# Author
Kwon, SoonHong <ksh7512@gmail.com>
