//
//  Sleep_iOSApp.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import SwiftUI

@main
struct Sleep_iOSApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
