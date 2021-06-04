//
//  RecipeModel.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2020 Luke Bresler. All rights reserved.
//

import SwiftUI

// MARK: - RECIPE MODEL

struct CardData: Identifiable {
    var id = UUID()
  var title: String
  var headline: String
  var image: String
  var instructions: [String]
 // var readMore: String
    
//    static var example: Recipe {
//        Recipe(id: UUID(), title: "test title", headline: "headline", image: "", instructions: ["Instructions"])
//    }
}

