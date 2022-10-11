package com.srivats.sleepandroid.data

import com.srivats.sleepandroid.R
import java.util.UUID

class SleepData(
    val id: Int,
    val bgImg: String,
    val trackName: String,
    val trackAudio: Int,
)

var nightData = SleepData(0,
    "https://images.unsplash.com/photo-1505322022379-7c3353ee6291?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "Night", R.raw.sunset)
var oceanData = SleepData(1,
    "https://images.unsplash.com/photo-1584794171574-fe3f84b43838?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "Ocean", R.raw.ocean)
var forestData = SleepData(2,
    "https://images.unsplash.com/photo-1640362625604-45b7938b4796?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "Forest", R.raw.forest)
var rainData = SleepData(3,
    "https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "Rain", R.raw.rain)

val categories: MutableList<SleepData> = mutableListOf(nightData, oceanData, forestData, rainData)
