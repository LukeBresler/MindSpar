//
//  DecksModel.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/10.
//  Copyright © 2020 Luke Bresler. All rights reserved.
//

import SwiftUI

// MARK: - DECKS MODEL

struct Deck: Identifiable {
  var id = UUID()
  var title: String
  var numberOfCardsInDeck: Int
  var image: String
    
    static var example: Deck {
        Deck(id: UUID(), title: "test title", numberOfCardsInDeck: 10,
            image: "")
    }
}

