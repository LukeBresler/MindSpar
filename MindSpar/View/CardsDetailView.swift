//
//  CardsDetailView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct CardsDetailView: View {
  // MARK: - PROPERTIES
  
  var recipe: CardData
  
  @State private var pulsate: Bool = false
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.openURL) var openURL
  
    var baseURL = "www.realpixel.co.za"
    
  var body: some View {
    
    
    VStack(alignment: .center, spacing: 0) {
    
        Text("_")
            .font(.custom("", size: 50))
            .fontWeight(.bold)
            .foregroundColor(Color("customControlColor"))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: .center)
            .padding(.bottom, 20)
            .padding(.top, -10)
    
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 0) {
        // IMAGE
       
        
        Image(colorScheme == .dark ? (recipe.image) : recipe.image)
          .resizable()
          .scaledToFit()
            .frame(width:320, height: 160)
            .padding(20)
        
        Group {
          // TITLE
          Text(recipe.title)
            .font(.custom("Dosis-Medium", size: 22))
           // .fontWeight(.Bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.gray)
            .padding(.top, 10)
            .padding(.bottom, 20)
            
          
          // INSTRUCTIONS
          
          Text("Counter-thought:")
            .font(.custom("Dosis-medium", size: 20))
            .foregroundColor(Color("customControlColor"))
            //.modifier(TitleModifier())
          
          ForEach(recipe.instructions, id: \.self) { item in
            VStack(alignment: .center, spacing: 5) {
              Image(systemName: "staroflife")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(Color("customControlColor"))
                .opacity(0.8)
                
              Text(item)
                .lineLimit(9)
                .font(.custom("Dosis-medium", size:22))
                .foregroundColor(Color("customControlColor"))
                .multilineTextAlignment(.center)
                         .lineSpacing(8)
                .padding(.top, 20)
                
                
            //.frame(minHeight: 100)
            }
          }
            
            Button("For more information..."){
                openURL(URL(string: recipe.readMore)!)
                   }
            
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      }
    }
    .background(Color("adaptiveBackgroundColor"))
    .edgesIgnoringSafeArea(.all)

  }
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 14.0, *) {
        CardsDetailView(recipe: cardsData[4])
            //.environment(\.colorScheme, .light)
            .environment(\.colorScheme, .dark)
    } else {
        // Fallback on earlier versions
    }
  }
}

