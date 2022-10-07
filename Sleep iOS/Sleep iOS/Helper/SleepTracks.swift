//
//  SleepTracks.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/5/22.
//

import Foundation

struct SleepTracks: Hashable, Codable, Identifiable{
    var id: Int
    var bgImg: String
    var trackName: String
    var trackAudio: String
}

let rainData = SleepTracks(id: 0, bgImg: "rain", trackName: "Rain", trackAudio: "rain")

let forestData = SleepTracks(id: 1, bgImg: "forest", trackName: "Forest", trackAudio: "forest")

let oceanData = SleepTracks(id: 2, bgImg: "ocean", trackName: "Ocean", trackAudio: "ocean")

let sunsetData = SleepTracks(id: 3, bgImg: "sunset", trackName: "Sunset", trackAudio: "sunset")

let categories: [SleepTracks]
= [rainData, forestData, oceanData, sunsetData]
