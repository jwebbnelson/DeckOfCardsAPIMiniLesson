//
//  ViewController.swift
//  DeckOfCardsAPIMiniLesson
//
//  Created by Jordan Nelson on 2/16/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var suitValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        suitValueLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drawCardTapped(sender: AnyObject) {
        CardController.drawACard { (card) -> Void in
            if let card = card {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.suitValueLabel.text = "\(card.suit) - \(card.value)"
                })
                NetworkController.fetchImageAtURL(card.imageURLString, completion: { (image) -> () in
                    if let image = image {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.imageView.image = image
                        })
                    }
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                   self.suitValueLabel.text = "Error, please try again..."
                })
            }
        }
    }

}

