//
//  SubHomeScreenView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 22/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct SubHomeScreenView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                Divider()
                Text("Recommended for You")
                    .bold()
                    .font(.title)
                    .padding(.top, 40)
                    .padding(.leading, 15)
                RecommendationRow()
                
                Text("Popular Playlists")
                    .bold()
                    .font(.title)
                    .padding(.top, 40)
                    .padding(.leading, 15)
                RecommendationRow()
                
                Text("Trending Now")
                    .bold()
                    .font(.title)
                    .padding(.top, 40)
                    .padding(.leading,15)
//                    .bold()
//                    .font(.title)
//                    .padding(.top, 40)
//                    .padding(.leading, 15)
                RecommendationRow()
            }
        }
        
            
    }
}

struct SubHomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SubHomeScreenView().environment(\.colorScheme, .dark)
    }
}
