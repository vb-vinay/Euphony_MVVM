//
//  PlayerUIView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 05/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import AVKit
import SwiftUI

class PlayerUIView: UIView{

    private let player: AVPlayer
    private let playerLayer = AVPlayerLayer()
    private let videoPos: Binding<Double>
    private let videoDuration: Binding<Double>
    private let seeking: Binding<Bool>
    private var durationObservation: NSKeyValueObservation?
    private var timeObservation: Any?
    
    init(player: AVPlayer, videoPos: Binding<Double>, videoDuration: Binding<Double>, seeking: Binding<Bool>) {
        self.player = player
        self.videoDuration = videoDuration
        self.videoPos = videoPos
        self.seeking = seeking
        
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
        durationObservation = player.currentItem?.observe(\.duration, changeHandler: { [weak self] item, change in
            guard let self = self else { return }
            self.videoDuration.wrappedValue = item.duration.seconds
        })
        
        timeObservation = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: nil) { [weak self] time in
            guard let self = self else { return }
            // If we're not seeking currently (don't want to override the slider
            // position if the user is interacting)
            guard !self.seeking.wrappedValue else {
                return
            }
        
            // update videoPos with the new video time (as a percentage)
            self.videoPos.wrappedValue = time.seconds / self.videoDuration.wrappedValue
        }
    }
    
    required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
      super.layoutSubviews()
      playerLayer.frame = bounds
    }
    func cleanUp() {
        // Remove observers we setup in init
        durationObservation?.invalidate()
        durationObservation = nil
        
        if let observation = timeObservation {
            player.removeTimeObserver(observation)
            timeObservation = nil
        }
    }

}
