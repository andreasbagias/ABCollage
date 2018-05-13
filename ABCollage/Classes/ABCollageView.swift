//
//  CollageView.swift
//  ABCollage
//
//  Created by Andreas Bagias on 25/04/2018.
//

import UIKit
import AVFoundation
import SKPhotoBrowser
import AVKit

public class ABCollageView: UIView{
    
    private var imagesArray: [[ABMedia]]?
    private var imagesAreUserInteractionEnabled: Bool = false
    private var vc: UIViewController!
    private var skimages = [SKPhoto]()
    var videos: [ABVideo] = [ABVideo]()
    
    public var padding: CGFloat = 0.0
    public var cornerRadius: CGFloat = 0.0
    public var borderWidth: CGFloat = 0.0
    public var borderColor: UIColor = UIColor.black
    public var contentModes: [[UIViewContentMode]]?
    public var horizontalfactors: [[Int]]?
    public var verticalFactors: [Int]?
    public var media: [[ABMedia]]? {
        get{
            return imagesArray
        }
        set{
            imagesArray = newValue
            
            if let media = newValue{
                addMedia(media)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setUserInteraction(enabled: Bool, vc: UIViewController){
        self.vc = vc
        self.imagesAreUserInteractionEnabled = enabled
        
        self.subviews.forEach { (view) in
            view.isUserInteractionEnabled = enabled
        }
    }
    
    private func getFrames(media:[[ABMedia]]) -> [[CGRect]]{
        
        var frames = [[CGRect]]()
        
        var originYCounter: CGFloat = 0.0
        for i in 0..<media.count{
            
            let widthSum = horizontalfactors?[i].reduce(0, +) ?? media[i].count
            let heightSum = verticalFactors?.reduce(0, +) ?? media.count
            
            let imageWidth = CGFloat((self.frame.size.width-CGFloat(media[i].count+1)*padding)/CGFloat(widthSum))
            let imageHeight = CGFloat((self.frame.size.height-CGFloat(media.count+1)*padding)/CGFloat(heightSum))
            
            frames.append([CGRect]())
            
            let factorY = CGFloat(verticalFactors?[i] ?? 1)
            
            var originXCounter: CGFloat = 0.0
            
            for j in 0..<media[i].count{
                
                let factorX = CGFloat(horizontalfactors?[i][j] ?? 1)
                
                frames[i].append(CGRect(x: padding + originXCounter,
                                        y: padding + originYCounter,
                                        width: imageWidth*factorX,
                                        height: imageHeight*factorY))
                
                originXCounter += imageWidth*factorX + padding
            }
            originYCounter += imageHeight*factorY + padding
        }
        
        return frames
        
    }
    
    private func addMedia(_ media: [[ABMedia]]){
        
        self.videos.removeAll()
        self.skimages.removeAll()
        self.subviews.forEach({ $0.removeFromSuperview() })
        var positions = getFrames(media: media)
        var index = 0
        
        for i in 0..<media.count{
            for j in 0..<media[i].count{
                
                if let abVideo = media[i][j] as? ABVideo{
                    
                    abVideo.playerLayer.frame = positions[i][j]
                    abVideo.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    abVideo.playerLayer.masksToBounds = true
                    abVideo.playerLayer.cornerRadius = cornerRadius
                    abVideo.playerLayer.borderWidth = abVideo.borderWidth ?? borderWidth
                    abVideo.playerLayer.borderColor = abVideo.borderColor?.cgColor ?? borderColor.cgColor
                    abVideo.delegate = self
                    abVideo.index = videos.count
                    abVideo.addNotificationVideoEnd()
                    if videos.count == 0 { abVideo.play() }
                    videos.append(abVideo)
                    
                    layer.addSublayer(abVideo.playerLayer)
                    
                    
                }else if let abImage = media[i][j] as? ABImage{
                    
                    let imageView = UIImageView(frame: positions[i][j])
                    imageView.clipsToBounds = true
                    imageView.layer.cornerRadius = cornerRadius
                    imageView.layer.borderWidth = abImage.borderWidth ?? borderWidth
                    imageView.layer.borderColor = abImage.borderColor?.cgColor ?? borderColor.cgColor
                    imageView.tag = index
                    imageView.contentMode = contentModes?[i][j] ?? .scaleAspectFill
                    imageView.image = abImage.image
                    
                    let gesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
                    gesture.numberOfTapsRequired = 1
                    imageView.addGestureRecognizer(gesture)
                    imageView.isUserInteractionEnabled = imagesAreUserInteractionEnabled
                    
                    skimages.append(SKPhoto.photoWithImage(abImage.image))
                    
                    addSubview(imageView)
                }
                
                index += 1
            }
        }
        
    }
    
    @objc private func imageViewTapped(gesture: UITapGestureRecognizer){
        
        let browser = SKPhotoBrowser(photos: skimages)
        browser.initializePageIndex(gesture.view?.tag ?? 0)
        vc.present(browser, animated: true, completion: nil)
        
    }
    
    
    
}

extension ABCollageView: ABVideoDelegate{

    internal func videoFinishedPlaying(index: Int) {
        if index > videos.count-2{
            videos[0].play()
        }else{
            videos[index+1].play()
        }
    }
    
}



