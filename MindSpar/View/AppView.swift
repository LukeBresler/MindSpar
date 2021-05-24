//
//  IntroView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//
import UserNotifications
import SwiftUI

struct AppView: View {
    @Environment(\.colorScheme) var colorScheme
  var body: some View {
    TabView {
      HomeView()
        .tabItem({
            Image(systemName:"house.fill")
          Text("Home")
        })
      CardsView()
        .tabItem({
            Image(systemName:"square.on.square")
          Text("Cards")
        })
      DecksView()
        .tabItem({
            Image(systemName:"square.grid.3x2")
          Text("Decks")
        })
      SettingsView()
        .tabItem({
            Image(systemName:"slider.horizontal.3")
          Text("Settings")
        })
        
        
        
        
        
    }
    .edgesIgnoringSafeArea(.top)
    .accentColor(Color.primary)
    
  
    
  }
    
    
}


struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
        AppView()
      .previewDevice("iPhone 11 Pro")
        .previewDisplayName("iPhone 11 Pro")
//             .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        .environment(\.colorScheme, .dark)
        //.environment(\.colorScheme, .light)

    
//       AppView()
//        .previewDevice("iPad Pro (12.9-inch)")
//        .previewDisplayName("iPad Pro (12.9-inch)")
////         .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
//        .environment(\.colorScheme, .light)
    }
  }
}

