package com.shong.graphql_sample

import android.os.Bundle
import android.text.method.ScrollingMovementMethod
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.apollographql.apollo.ApolloClient
import com.apollographql.apollo.api.Response
import com.apollographql.apollo.api.toJson
import com.apollographql.apollo.coroutines.await
import com.google.gson.GsonBuilder
import com.shong.sample.UserInfoQuery
import kotlinx.coroutines.*


class MainActivity : AppCompatActivity() {
    var apolloClient = ApolloClient.builder()
        .serverUrl("http://10.254.110.16:4000/api")
        .build()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val txt = findViewById<TextView>(R.id.sampleText)
        txt.setMovementMethod(ScrollingMovementMethod())

        val btn = findViewById<Button>(R.id.getButton)

        var job: Job? = null
        btn.setOnClickListener {
            if(job == null){
                job = CoroutineScope(Dispatchers.Main).launch {
                    val data = queryUserInfo()?.data
                    val gson = GsonBuilder().setPrettyPrinting().create()
                    txt.text = gson.toJson(data) ?: "error"
                    job = null
                }
            }
        }

    }

    suspend fun queryUserInfo(): Response<UserInfoQuery.Data>? {
        var result: Response<UserInfoQuery.Data>? = null
        withContext(Dispatchers.IO) {
            val response = apolloClient.query(UserInfoQuery())?.await()
            result = response
        }
        return result
    }

}