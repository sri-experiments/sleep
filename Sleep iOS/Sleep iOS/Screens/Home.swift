//
//  Home.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack() {
                Text("Sleep")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Categories")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.leading)
                    .foregroundColor(.white)
                
                CategoryView()
                
            }
            .padding(50)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
