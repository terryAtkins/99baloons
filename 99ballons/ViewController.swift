//
//  ViewController.swift
//  99ballons
//
//  Created by terry atkins on 11/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ballonLabel: UILabel!
    
    var ballonArray:[Ballons] = []
    var index = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ballonGenerate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(sender: UIBarButtonItem) {
        let baloon =  ballonArray[index]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.ballonLabel.text = "Ballon: \(baloon.ballonNumber)"
            self.imageView.image = baloon.randomImage
            self.index++
            
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }
    
    
    
     func ballonGenerate() {
            for var i = 1; i <= 99; i++ {
                var baloonCreated = Ballons()
                baloonCreated.ballonNumber = i
                
                switch Int(arc4random_uniform(UInt32(4))) {
                case 1:
                    baloonCreated.randomImage = UIImage(named: "RedBalloon1.jpg")
                case 2:
                    baloonCreated.randomImage = UIImage(named: "RedBalloon2.jpg")
                case 3:
                    baloonCreated.randomImage = UIImage(named: "RedBalloon3.jpg")
                default :
                    baloonCreated.randomImage = UIImage(named: "RedBalloon4.jpg")
                }
                self.ballonArray.append(baloonCreated)
            }
            
        }
}

