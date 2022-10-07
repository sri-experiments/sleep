package com.srivats.sleepandroid.ui.screen

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.srivats.sleepandroid.R

@Preview(name = "Home")
@Composable
fun Home(){
    val configuration = LocalConfiguration.current

    Box(modifier = Modifier.fillMaxSize()) {
        Image(
            painterResource(id = R.drawable.bg),
            contentDescription = "Background image",
            contentScale = ContentScale.FillBounds, // or some other scale
            modifier = Modifier.matchParentSize()
        )
        Column(
            verticalArrangement = Arrangement.Center,
            modifier = Modifier.padding(20.dp)
        ) {
            Box(modifier = Modifier.fillMaxWidth()){
                Text("Sleep",
                    fontSize = 45.sp,
                    fontWeight = FontWeight.Bold,
                    color = Color.White,
                textAlign = TextAlign.Center)
            }
            Spacer(modifier = Modifier.weight(1f))
            Box(modifier = Modifier.height(250.dp)
                .background(color = Color.White)) {
                Categories()
            }
        }
    }
}

@Composable
fun Categories(){
    val list = ((0..100).map { it.toString() })
    Text("Categories")
    LazyRow {
        items(items = list, itemContent = { item ->
            when (item) {
                else -> {
                    Text(text = item, style = TextStyle(fontSize = 80.sp))
                }
            }
        })
    }
}