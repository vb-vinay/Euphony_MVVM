//
//  TrackListViewM.swift
//  Euphony
//
//  Created by Vinay Bharwani on 10/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

class TrackListViewM: ObservableObject{
    
    @Published var tracks = [TrackViewM]()
    
    init(){
        getRecommendedTracks()
    }
    
    private func getRecommendedTracks(){
        
        let jsonUrlString = "\(NetworkUtils.Mains.baseURL)" + "\(String(describing: NetworkUtils.Endpoint.path(.recommendations)))" + "market=\(NetworkUtils.ParamValues.market)" + "&seed_artists=\(NetworkUtils.ParamValues.seedArtists)" + "&seed_tracks=\(NetworkUtils.ParamValues.seedTracks)" + "&min_energy=\(NetworkUtils.ParamValues.minEnergy)" + "&min_popularity=\(NetworkUtils.ParamValues.minPopularity)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        WebService().getMusic(url){ tracks in
            if let tracks = tracks {
                self.tracks = tracks.map(TrackViewM.init)
            }
        }
        
    }
}
class TrackViewM: Identifiable{
    
    let id = UUID()
    
    let track: Track
    
    init(track: Track){
        self.track = track
    }
    var name: String{
        return track.name
    }
    var trackUrl: String{
        if let preview = track.preview_url{
            return preview
        } else{
            return "https://p.scdn.co/mp3-preview/fd247b2ee0dd902941b6349759b93391014b97ec?cid=774b29d4f13844c495f206cafdad9c86"
        }
    }
    var albumName: String{
        return track.album.name
    }
    var artistName: String{
        return track.album.artists[0].name
    }
    var imageUrl: String{
        return track.album.images[0].url
    }
}

