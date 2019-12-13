//
//  PlayerView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 05/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//
//
import SwiftUI
import AVKit

struct PlayerView: UIViewRepresentable {
    @Binding private(set) var videoPos: Double
    @Binding private(set) var videoDuration: Double
    @Binding private(set) var seeking: Bool
    
    let player: AVPlayer
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    func makeUIView(context: UIViewRepresentableContext<PlayerView>) -> UIView {
        let uiView = PlayerUIView(player: player,
                                  videoPos: $videoPos,
                                  videoDuration: $videoDuration,
                                  seeking: $seeking)
        return uiView
    }
    static func dismantleUIView(_ uiView: UIView, coordinator: ()) {
        guard let playerUIView = uiView as? PlayerUIView else {
            return
        }
        
        playerUIView.cleanUp()
    }
}
