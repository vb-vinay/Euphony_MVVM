//
//  CatPlaylists.swift
//  Euphony
//
//  Created by Vinay Bharwani on 03/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

struct CatPlaylists: Decodable{
    var playlists: Playlist
    
    struct Playlist: Decodable{
        var items: [Item]

        struct Item: Decodable{
            var description: String
            var external_urls: SpotifyUrl
            var images: [Image]
            var name: String
        }
        
        struct SpotifyUrl: Decodable{
            var spotify: String
        }
        struct Image: Decodable {
            var url: String
        }
    }
}
