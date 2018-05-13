//
//  ABVideo.swift
//  ABCollage
//
//  Created by Andreas Bagias on 03/05/2018.
//

import UIKit
import AVFoundation

protocol ABVideoDelegate {
    func videoFinishedPlaying(index: Int)
}

public class ABVideo: ABMedia {
    
    var videoUrl: URL!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var delegate: ABVideoDelegate?
    var index: Int = 0
    
    @objc func playerItemDidReachEnd() {
        delegate?.videoFinishedPlaying(index: index)
    }
    
    override init() {
        super.init()
    }
    
    public convenience init(videoUrl: URL) {
        self.init()
        
        self.videoUrl = videoUrl
        self.player = AVPlayer(url: videoUrl)
        self.playerLayer = AVPlayerLayer(player: player)
    }
    
    func play(){
        player.seek(to: kCMTimeZero)
        player.play()
    }
    
    func addNotificationVideoEnd(){
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
}
