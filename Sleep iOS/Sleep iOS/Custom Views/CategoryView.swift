//
//  CategoryView.swift
//  Sleep iOS
//
//  Created by srivats venkataraman on 10/4/22.
//

import SwiftUI

struct CategoryView: View {
    @State private var showPlayer = false
    @State var categoryItem = categories[0]
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(categories) { index in
                    VStack{
                        Image(index.bgImg)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 155, height: 155)
                            .cornerRadius(5)
                        Text(index.trackName)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                    }
                    .onTapGesture {
                        showPlayer = true
                        categoryItem = index
                    }
                    .padding(15)
                }
            }
        }
        
        .fullScreenCover(isPresented: $showPlayer){
            Details(isPlaying: .constant(false), categoryItem: categoryItem)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
