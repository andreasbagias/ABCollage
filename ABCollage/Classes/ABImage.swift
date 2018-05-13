//
//  ABImage.swift
//  ABCollage
//
//  Created by Andreas Bagias on 30/04/2018.
//

import UIKit

public class ABImage: ABMedia {
    
    var image: UIImage!
    
    override init() {
        super.init()
    }
    
    public convenience init(image: UIImage) {
        self.init()
        
        self.image = image
    }
    
    
}
