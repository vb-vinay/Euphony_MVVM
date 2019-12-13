//
//  DiscoverView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 10/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import URLImage

struct DiscoverView: View {
    struct Props {
        let movies: [Int]
        let posters: [Int: String]
        let currentMovie: Recommendation?
        let filter: DiscoverFilter?
        let genres: [Genres]
//        let dispatch: DispatchFunction
    }
    let music: [Track]
    var body: some View {
        VStack{
            URLImage(URL(string: music[0].album.images[0].url)!){ proxy in
                proxy.image
                    .resizable()
            }.frame(width: 250.0, height: 400.0)
                .padding(5)
            
            Text(music[0].album.artists[0].name)
                .font(.headline)
                .frame(width: 120.0, height: 20.0)
            
            Text(music[0].album.name)
                .font(.subheadline)
                .frame(width: 120.0, height: 30.0)
            
                
        }    }
}

//struct DiscoverView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverView(music : [recommendation.tracks[4]])
//    }
//}
