//
//  AudioManager.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import Foundation
import AVKit

final class AudioManager{
    static let shared = AudioManager()
    var player: AVAudioPlayer?
    
    func startPlayer(track: String){
        let url = Bundle.main.url(forResource: track, withExtension: "mp3")
        
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            
            player?.play()
        }
        catch{
            print("Failed to initialize player", error)
        }
    }
    
    func playPause(){
        guard let player = player else{
            print("Audio player not found")
            return
        }
        
        if(player.isPlaying){
            player.pause()
        }
        else{
            player.play()
        }
    }
}
