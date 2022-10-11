package com.srivats.sleepandroid.ui.screen

import android.media.MediaPlayer
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Pause
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.srivats.sleepandroid.R
import com.srivats.sleepandroid.data.SleepData
import com.srivats.sleepandroid.data.categories

@Preview(name = "Home")
@Composable
fun Home(navController: NavController? = null){
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
            Text("Categories",
            color = Color.White,
            fontSize = 18.sp,
            fontWeight = FontWeight.SemiBold)
            Categories()
        }
    }
}

@Composable
fun Categories(){
    val showPlayer = remember{ mutableStateOf(false) }
    val selectedIndex = remember {
        mutableStateOf(100)
    }

    LazyRow {
        itemsIndexed(items = categories) { index, item ->
            Box() {
                Card(modifier = Modifier
                    .background(color = Color.Transparent)
                    .padding(10.dp)
                    .clickable(onClick = {
                        showPlayer.value = true
                        selectedIndex.value = index
                    })
                ) {
                    AsyncImage(model = item.bgImg, contentDescription = "Item image")
                }
            }
        }
    }
    if(showPlayer.value){
        Player(selectedIndex.value)
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Player(index: Int? = null){
    val data: SleepData = categories[index!!]
    val mContext = LocalContext.current
    val mMediaPlayer = MediaPlayer.create(mContext, data.trackAudio)
    val isAudioPlaying = remember{mutableStateOf(false)}
    Card(modifier = Modifier
        .padding(8.dp)
        .clip(RoundedCornerShape(10.dp))
        .fillMaxWidth()) {
        ListItem(
            headlineText = { Text(data.trackName) },
            trailingContent = {
                IconButton(onClick = {
                    if (mMediaPlayer != null) {
                        if (mMediaPlayer.isPlaying) {
                            isAudioPlaying.value = false
                            mMediaPlayer.pause()
                        } else {
                            isAudioPlaying.value = true
                            mMediaPlayer.start()
                        }
                    }
                }) {
                    if (isAudioPlaying.value) {
                        Icon(Icons.Default.Pause,
                            contentDescription = "Pause",
                            modifier = Modifier.size(100.dp))
                    } else {
                        Icon(Icons.Default.PlayArrow,
                            contentDescription = "Play",
                            modifier = Modifier.fillMaxSize(1.0F)
                        )
                    }
                }
            }
        )
    }
}
