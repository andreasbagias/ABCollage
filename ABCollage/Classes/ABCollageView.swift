//
//  CollageView.swift
//  ABCollage
//
//  Created by Andreas Bagias on 25/04/2018.
//

import UIKit
import UIKit

public class ABCollageView: UIView{
    
    private var imagesArray: [[UIImage]]?
    public var padding: CGFloat = 0.0
    public var cornerRadius: CGFloat = 0.0
    public var contentModes: [[UIViewContentMode]]?
    public var images: [[UIImage]]? {
        get{
            return imagesArray
        }
        set{
            imagesArray = newValue
            
            if let imgs = newValue{
                addImages(images: imgs)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func getFrames(images:[[UIImage]]) -> [[CGRect]]{
        
        var frames = [[CGRect]]()
        
        for i in 0..<images.count{
            
            let imageWidth = CGFloat((self.frame.size.width-CGFloat(images[i].count+1)*padding)/CGFloat(images[i].count))
            let imageHeight = CGFloat((self.frame.size.height-CGFloat(images.count+1)*padding)/CGFloat(images.count))
            
            frames.append([CGRect]())
            
            for j in 0..<images[i].count{
                frames[i].append(CGRect(x: (imageWidth+padding)*CGFloat(j)+padding, y: (imageHeight+padding)*CGFloat(i)+padding, width: imageWidth, height: imageHeight))
            }
        }
        
        return frames
        
    }
    
    private func addImages(images: [[UIImage]]){
        
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        var positions = getFrames(images: images)
        
        for i in 0..<images.count{
            for j in 0..<images[i].count{
                
                let imageView = UIImageView(frame: positions[i][j])
                imageView.clipsToBounds = true
                imageView.image = images[i][j]
                if let contentModes = contentModes{
                    imageView.contentMode = contentModes[i][j]
                }else{
                    imageView.contentMode = .scaleAspectFill
                }
                imageView.layer.cornerRadius = cornerRadius
                
                addSubview(imageView)
                
            }
        }
        
    }
    
    
    
}
