//
//  ViewController.swift
//  ABCollage
//
//  Created by andreasbagias@gmail.com on 04/25/2018.
//  Copyright (c) 2018 andreasbagias@gmail.com. All rights reserved.
//

import UIKit
import ABCollage
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var collageView: ABCollageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collageView.horizontalfactors = [[2,1],[1,2],[1,1]]
        collageView.verticalFactors = [1,1,1]
        collageView.padding = 10
        collageView.cornerRadius = 10
        collageView.borderWidth = 3
        
        let image1 = ABImage(image: UIImage(named: "test1")!)
        let image2 = ABImage(image: UIImage(named: "test2")!)
        let image3 = ABImage(image: UIImage(named: "test3")!)
        let image4 = ABImage(image: UIImage(named: "test4")!)
        let image5 = ABImage(image: UIImage(named: "test5")!)
        let image6 = ABImage(image: UIImage(named: "test6")!)
        
        image1.borderColor = UIColor.blue
        image2.borderColor = UIColor.cyan
        image3.borderColor = UIColor.green
        image4.borderColor = UIColor.orange
        image5.borderColor = UIColor.brown
        image6.borderColor = UIColor.yellow
        
        
        collageView.media = [[image1,image2],
                             [image4,image3],
                             [image5,image6]]
        
        collageView.setUserInteraction(enabled: true, vc: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

