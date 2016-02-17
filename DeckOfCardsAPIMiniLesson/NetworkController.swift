//
//  NetworkController.swift
//  DeckOfCardsAPIMiniLesson
//
//  Created by Jordan Nelson on 2/16/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    static func dataAtURL(completion:(NSData?) -> Void) {
        
        let url = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=1")!
        
        let datatask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print("Error with DataTask \(error)")
            }
            completion(data)
        }
        datatask.resume()
    }
    
    
    
    static func fetchImageAtURL(imageURLString: String, completion: (image: UIImage?) -> ()) {
        
        if let url = NSURL(string: imageURLString) {
            
            NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                if let error = error {
                    print(error.localizedDescription)
                    completion(image: nil)
                }
                
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image: image)
                }
                }
                .resume()
        } else {
            completion(image: nil)
        }
    }
}