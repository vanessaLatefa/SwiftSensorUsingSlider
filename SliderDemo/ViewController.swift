//
//  ViewController.swift
//  SliderDemo
//
//  Created by Vanessa Latefa Pampilo on 4/5/19.
//  Copyright © 2019 Vanessa Latefa Pampilo. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var motionManager = CMMotionManager()
    var queue = OperationQueue()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func adjustFontSize(_ sender: Any) {
        
        motionManager.startDeviceMotionUpdates(to: queue) { (motion, error) in
            
            DispatchQueue.main.async {
                self.slider.value = Float((motion?.attitude.roll ?? 0) * 1.4)
                
                self.helloLabel.font = UIFont.systemFont(ofSize: CGFloat(self.slider.value * 40.0))
                
            }
        }
        
    }
    
}

