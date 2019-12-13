//
//  SongTitle.swift
//  Euphony
//
//  Created by Vinay Bharwani on 11/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

/// Dependency - Download Image from URL (link- https://github.com/dmytro-anokhin/url-image.git)
/// By using the above link swift package dependency is added to the project  File-> Swift Package -> Add Package Dependencies -> Link -> next -> finish
import AVKit
import URLImage
//  URLImage(URL(string: "https://i.scdn.co/image/ab67616d0000b27326f3b1353ed43494cdd4ef0e")!){ proxy in
//                proxy.image
//                  .resizable()
//    }
//


struct SongTitle: View {
    let trackDetails: Track//[TrackViewM]
    var body: some View {
        
        VStack{
            // self.trackDetails.imageUrl
//            if !trackDetails.isEmpty{
//                ForEach(0..<trackDetails.count){ track in
            
            URLImage(URL(string: self.trackDetails.album.images[0].url)!){ proxy in
                            proxy.image
                                .resizable()
            }.frame(width: 120.0, height: 120.0)
                .padding(5)
//
            Text(self.trackDetails.name)     //trackDetails[0].album.artists[0].name
                            .font(.headline)
                            .frame(width: 120.0, height: 20.0)
                        
            Text(self.trackDetails.album.name)          //self.trackDetails.albumName
                            .font(.subheadline)
                            .frame(width: 120.0, height: 30.0)
//                }
//            }
        }
    }
}

//struct SongTitle_Previews: PreviewProvider {
////    let trackDetails: [TrackViewM]
//    static var previews: some View {
//        SongTitle(trackDetails: TrackListViewM().tracks[0].track)
//    }
//}
