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
    var duration: TimeInterval
}

var nightData = SleepTracks(id: 0, bgImg: "night", trackName: "Night", trackAudio: "sunset", duration: 85.2)
var oceanData = SleepTracks(id: 1, bgImg: "ocean", trackName: "Ocean", trackAudio: "ocean", duration: 76.8)
var forestData = SleepTracks(id: 2, bgImg: "forest", trackName: "Forest", trackAudio: "forest", duration: 310)
var rainData = SleepTracks(id: 3, bgImg: "rain", trackName: "Rain", trackAudio: "rain", duration: 60)

let categories: [SleepTracks]
= [nightData, oceanData, forestData, rainData]
