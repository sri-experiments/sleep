//
//  AudioManager.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    static let shared = AudioManager()
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false{
        didSet{}
    }
    
    func startPlayer(track: String, isPreview: Bool = false){
        let url = Bundle.main.url(forResource: track, withExtension: "mp3")
        
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            
            if isPreview{
                player?.prepareToPlay()
            }
            else{
                player?.play()
                isPlaying = true
            }
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
            isPlaying = false
        }
        else{
            player.play()
            isPlaying = true
        }
    }
    
    func stop(){
        guard let player = player else { return }
        
        if(player.isPlaying){
            player.stop()
            isPlaying = false
        }
    }
}
