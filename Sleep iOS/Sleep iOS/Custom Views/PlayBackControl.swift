//
//  PlayBackControl.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/6/22.
//

import SwiftUI

struct PlayBackControl: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlayBackControl_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackControl(action: {})
            .preferredColorScheme(.dark)
    }
}
