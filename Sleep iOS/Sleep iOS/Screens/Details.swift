//
//  Details.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import SwiftUI
import AVKit

struct Details: View {
    @State private var value: Double = 0.0
    @Binding var isPlaying: Bool
    @Environment(\.dismiss) var dismiss
    
    var categoryItem: SleepTracks
    
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
                
                VStack(spacing: 5){
                    Slider(value: $value,
                           in: 0...60)
                    .accentColor(.white)
                    
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                HStack {
                    PlayBackControl(systemName: "play.circle.fill", fontSize: 44){}
                    
                    PlayBackControl(systemName: "stop.fill", fontSize: 44){}
                }
            }
            
            .padding(20)
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(isPlaying: .constant(false),
        categoryItem: categories[0])
    }
}
