//
//  Details.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import SwiftUI
import AVKit

struct Details: View {
    @EnvironmentObject var audioManager: AudioManager
    @State private var value: Double = 0.0
    var isPreview: Bool = false
    @Binding var isPlaying: Bool
    @State var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var categoryItem: SleepTracks
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            Image(categoryItem.bgImg)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                HStack{
                    Button{
                        audioManager.stop()
                        dismiss()
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                
                Text(categoryItem.trackName)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                if let player = audioManager.player{
                    VStack(spacing: 5){
                        Slider(value: $value,
                               in: 0...player.duration){
                            editing in
                            
                            isEditing = editing
                            
                            if !editing{
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    HStack {
                        PlayBackControl(systemName: audioManager.isPlaying ? "pause.circle.fill" :  "play.circle.fill", fontSize: 44){
                            audioManager.playPause()
                        }
                        
                        PlayBackControl(systemName: "stop.fill", fontSize: 44){
                            audioManager.stop()
                            dismiss()
                        }
                    }
                }
                
            }
            
            .padding(20)
        }
        .onAppear{
            audioManager.startPlayer(track: categoryItem.trackAudio, isPreview: isPreview)
        }
        .onReceive(timer){_ in
            guard let player = audioManager.player,
            !isEditing else{
                return
            }
            
            value = player.currentTime
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(isPreview: true, isPlaying: .constant(false),
        categoryItem: categories[0])
        .environmentObject(AudioManager())
    }
}
