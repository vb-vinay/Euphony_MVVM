//
//  PlayerContainerview.swift
//  Euphony
//
//  Created by Vinay Bharwani on 05/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerContainerview: View {
    @State private var videoPos: Double = 0
    // The duration of the video in seconds
    @State private var videoDuration: Double = 0
    // Whether we're currently interacting with the seek bar or doing a seek
    @State private var seeking = false
    
    private let player: AVPlayer
    
    init(url: URL){
        player = AVPlayer(url: url)
    }
    
    init(player: AVPlayer){
        self.player = player
    }
    
    var body: some View {
        VStack{
            PlayerView(videoPos: $videoPos, videoDuration: $videoDuration, seeking: $seeking, player: player)

            PlayerControlsView(videoPos: $videoPos, videoDuration: $videoDuration, seeking: $seeking, player: player)
        }
    }
}

struct PlayerContainerview_Previews: PreviewProvider {
    static var previews: some View {
//        PlayerContainerview(player: AVPlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!))
        PlayerContainerview(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "videoplayback", ofType: "mp4")!)))
    }
}
