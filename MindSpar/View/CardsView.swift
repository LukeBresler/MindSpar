//
//  CardsView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2020 Luke Bresler. All rights reserved.
//

import SwiftUI

struct CardsView: View {


  // MARK: - PROPERTIES
    
    
    @Environment(\.colorScheme) var colorScheme
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
     @State private var refresh: Bool = false
     @State var arr = cardsData
   
     var cardsTitleLabel = "Cards"
    
    var recipes: [CardData] = cardsData
   
    
      var body: some View {
        
       
        
        //ScrollView(.vertical, showsIndicators: false) {
            
        VStack {
        
            VStack {
                VStack(alignment: .center, spacing:15) {



// MARK: - CARDS

                    VStack(alignment: .center, spacing:30) {
                      (refresh ? ExtendedCardsView(recipe: recipes.randomElement()!) : ExtendedCardsView(recipe: recipes.randomElement()!))
                        
                    }
                    
                    //.frame(minWidth: 345, maxWidth: 345)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    .padding(.top, 10)

                  }
                //}
                    .background(colorScheme == .dark ? Color.black.opacity(0.8) : Color.white)
                .padding(.bottom, 5)
            }
            
//MARK: refresh button
            Button(action: {
                
                self.arr.shuffle()
                self.hapticImpact.impactOccurred()
                self.refresh.toggle()
                
            }) {
            
                Image(systemName: "shuffle")
                    
                .padding(8)
                    .foregroundColor(.gray)
                   
                       
            }
            .buttonStyle(SimpleButtonStyle())
            
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
            
            //
                .font(.title)
//                .foregroundColor(Color.gray)
//                .padding(.top, 30)
//                .padding(.bottom, 5)
            //
            
            
        }
       

      }
    
}

    struct TitleModifier: ViewModifier {
      func body(content: Content) -> some View {
        content
            .font(.custom("Dosis-Medium", size: 22))
            .foregroundColor(Color.black)
            .padding(.top, 20)
            
      }
    }

    struct CardsView_Previews: PreviewProvider {
      static var previews: some View {
        CardsView(recipes: cardsData)
          .previewDevice("iPhone 7")
            .environment(\.colorScheme, .light)
      }
    }

extension Color {
    static let offWhite = Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255)
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                           if configuration.isPressed {
                               Circle()
                                   .fill(Color.offWhite)
                           } else {
                               Circle()
                                   .fill(Color.offWhite)
                                   .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                                   .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                           }
                       }
            )
    }
}

