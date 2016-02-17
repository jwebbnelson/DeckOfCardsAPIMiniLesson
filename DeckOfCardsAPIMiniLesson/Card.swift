//
//  Card.swift
//  DeckOfCardsAPIMiniLesson
//
//  Created by Jordan Nelson on 2/16/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Card {
    
    private let valueKey = "value"
    private let suitKey = "suit"
    private let imageKey = "image"
    
    var value: String
    var suit: String
    var imageURLString: String
    
    init(jsonDictionary: [String: AnyObject]) {
        
        guard let value = jsonDictionary[valueKey] as? String,
        let suit = jsonDictionary[suitKey] as? String,
        let imageURLString = jsonDictionary[imageKey] as? String else {
            self.value = ""
            self.suit = ""
            self.imageURLString = ""
            return
        }
            self.value = value
            self.suit = suit
            self.imageURLString = imageURLString
    }
}

