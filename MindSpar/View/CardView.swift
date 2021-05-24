//
//  ExtendedCardsView.swift
//  MindSpar

//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//
import SwiftUI

struct ExtendedCardsView: View {
  // MARK: - PROPERTIES
    
    @State private var showingAlert = false
    @State var arr = cardsData
    @State private var refresh: Bool = false
    
   
  
    
  var recipes: [CardData] = cardsData
    
  var recipe: CardData
  var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  @State private var showModal: Bool = false
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    VStack(alignment: .center, spacing: 5) {
        
      // CARD IMAGE
        Image(colorScheme == .dark ? recipe.image : recipe.image)
        .resizable()
        
        .scaledToFit()
            .frame(width:228, height: 160)
        .overlay(
          HStack {
            Spacer()

            
          }
        )
            .padding(20)
          
    
      VStack(alignment: .center, spacing: 16) {
        // TITLE
        Text(recipe.title)
            .font(.custom("Dosis-Medium", size: 22))
            .multilineTextAlignment(.center)
            .foregroundColor(Color("adaptiveTitleColor"))
            //.opacity(0.9)
            .padding(.leading, 20)
            .padding(.trailing, 20)
           
          //.lineLimit(1)
        
        // HEADLINE
        Text(recipe.headline)
            .font(.system(.footnote, design: .default))
            .multilineTextAlignment(.center)
          .foregroundColor(Color.gray)
          
           // .frame(width: 345)
            //.padding(10)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
       
      }
      
      .padding(.bottom, 12)
        
        HStack(alignment: .center, spacing: 25){
               //EXPAND CARD
                   Button(action: {
                    self.hapticImpact.impactOccurred()
                                       self.showModal = true
                   }) {
                   Image(systemName: "chevron.down")
                       .font(.title)
                       .foregroundColor(Color.gray)
                    
               }
            
            
            
    //MARK: RANDOM CARD
                        

               }
        .padding(.bottom)
        
    }
    .background(Color("adaptiveBackgroundColor"))
    .cornerRadius(12)
    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    .onTapGesture {
      self.hapticImpact.impactOccurred()
      self.showModal = true
        
        
    }
    .sheet(isPresented: self.$showModal) {
        if #available(iOS 14.0, *) {
            CardsDetailView(recipe: self.recipe)
                .animation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.6))
        } else {
            // Fallback on earlier versions
        }
    }
    //.frame(width:345)
  }

}

func update(){
  
}

struct ExtendedCarsdView_Previews: PreviewProvider {
    //var selected: Bool = false
  static var previews: some View {
    
    ExtendedCardsView(recipe:cardsData [3])
      .previewLayout(.sizeThatFits)
        .environment(\.colorScheme, .light)
        //.environment(\.colorScheme, .dark)
  }
}





