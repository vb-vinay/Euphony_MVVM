//
//  PlayerControlsView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 05/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerControlsView: View {
    @Binding private(set) var videoPos: Double
    @Binding private(set) var videoDuration: Double
    @Binding private(set) var seeking: Bool
    
//    @State var seekPos = 0.0
    @State private var playerPaused = true
    
    let player: AVPlayer
    
    var body: some View {
        HStack {
            Button(action: togglePlayPause) {
                  Image(systemName: playerPaused ? "play" : "pause")
                    .padding(.trailing, 10)
            }
            Text("\(Utilities.formatSecondsToHMS(videoPos * videoDuration))")
            Slider(value: $videoPos, in: 0...1, onEditingChanged: sliderEditingChanged)
            Text("\(Utilities.formatSecondsToHMS(videoDuration))")
//            Slider(value: $seekPos, from: 0, through: 1, onEditingChanged: { _ in
//                guard let item = self.player.currentItem else{
//                    return
//                }
//                let targetTime = self.seekPos * item.duration.seconds
//                self.player.seek()
//            })
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
            
    }
        private func togglePlayPause() {
           pausePlayer(!playerPaused)
        }
       
       private func pausePlayer(_ pause: Bool) {
           playerPaused = pause
           if playerPaused {
               player.pause()
           }
           else {
               player.play()
           }
       }
        private func sliderEditingChanged(editingStarted: Bool) {
           if editingStarted {
               // Set a flag stating that we're seeking so the slider doesn't
               // get updated by the periodic time observer on the player
               seeking = true
               pausePlayer(true)
           }
           
           // Do the seek if we're finished
           if !editingStarted {
               let targetTime = CMTime(seconds: videoPos * videoDuration,
                                       preferredTimescale: 600)
               player.seek(to: targetTime) { _ in
                   // Now the seek is finished, resume normal operation
                   self.seeking = false
                   self.pausePlayer(false)
               }
           }
       }
}

//struct PlayerControlsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerControlsView(player: AVPlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!))
//    }
//}
