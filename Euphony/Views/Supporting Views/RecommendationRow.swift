//
//  Recommendationrow.swift
//  Euphony
//
//  Created by Vinay Bharwani on 11/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct RecommendationRow: View {
    
    @ObservedObject var tracksModel = TrackListViewM()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                if !(tracksModel.tracks.isEmpty){
                    ForEach(0..<tracksModel.tracks.count){ trace in
                        SongTitle(trackDetails: self.tracksModel.tracks[trace].track)
                    }
                }
            }.padding(.horizontal, 15)
        }
    }
}

struct RecommendationRow_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationRow()
    }
}
