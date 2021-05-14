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
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 0) {
        // IMAGE
        Text("_")
            .font(.custom("", size: 50))
            .fontWeight(.bold)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 10, alignment: .center)
            .padding(.bottom, 20)
            .padding(.top, -10)
        
        Image(colorScheme == .dark ? "dm\(recipe.image)" : recipe.image)
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
            //.fontWeight(.bold)
            //.modifier(TitleModifier())
          
          ForEach(recipe.instructions, id: \.self) { item in
            VStack(alignment: .center, spacing: 5) {
              Image(systemName: "staroflife")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(Color.black)
                .opacity(0.8)
                
              Text(item)
                .lineLimit(9)
                .font(.custom("Dosis-medium", size:22))
                .foregroundColor(Color("ColourTextAdaptive"))
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
//    .edgesIgnoringSafeArea(.top)
//    .overlay(
//      HStack {
//        Spacer()
//        VStack {
//          Button(action: {
//            // ACTION
//            self.presentationMode.wrappedValue.dismiss()
//          }, label: {
//             Image(systemName: "xmark.circle")
//                .font(.title)
//                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
//              //.shadow(radius: 10)
//                .opacity(0.8)
////colorScheme == .dark ? Color.black : Color.white
//
//
//
//
//          })
//            .padding(.trailing, 20)
//            .padding(.top, 20)
//          Spacer()
//        }
//      }
//    )
//    .onAppear() {
//      self.pulsate.toggle()
//    }
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 14.0, *) {
        CardsDetailView(recipe: cardsData[4])
            .environment(\.colorScheme, .light)
    } else {
        // Fallback on earlier versions
    }
  }
}

