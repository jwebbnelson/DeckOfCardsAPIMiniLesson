//
//  CardController.swift
//  DeckOfCardsAPIMiniLesson
//
//  Created by Jordan Nelson on 2/16/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class CardController {
    
    static func drawACard(completion:(Card?) -> Void) {
    
        NetworkController.dataAtURL { (resultData) -> Void in
            guard let data = resultData else {
                print("No Data Returned")
                completion(nil)
                return
            }

            do {
                let resultsAnyObject: AnyObject
                
               resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject], let cardArray = resultsDictionary["cards"] as? [[String:AnyObject]] {
                    let card = Card(jsonDictionary: cardArray[0])
                    completion(card)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
                return
            }
        }
    }
    
}