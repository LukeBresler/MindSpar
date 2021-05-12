//
//  HomeView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2020 Luke Bresler. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var homeShowModal: Bool = false
   
  
  var body: some View {
    VStack {
      //Spacer()
        Image(colorScheme == .dark ? "mindspar" : "mindspar")
      
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 240, height: 200, alignment: .center)
        .padding(.top, 50)
        
      
      VStack {

          
        Text("""
train your mind
""")
          .lineLimit(nil)
            
            //.font(.system(.headline, design: .monospaced))
            .font(.custom("Dosis-Medium", size: 22))
            //.font(.headline)
            //.foregroundColor(Color("ColourTextAdaptive"))
            .foregroundColor(Color.black)
          .multilineTextAlignment(.center)
          .lineSpacing(8)
          .frame(maxWidth: 640, minHeight: 120)
      }
      .padding()
      
      //Spacer()
        HStack(alignment: .center, spacing: 30){
            
                       //EXPAND CARD
                           Button(action: {
                            self.hapticImpact.impactOccurred()
                                               self.homeShowModal = true
                           }) {
                           Image(systemName: "chevron.down")
                               .font(.title)
                               .foregroundColor(Color.gray)
                            
                       }
                           
                       }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(12)
        //.shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.homeShowModal = true
            
            
        }
        .sheet(isPresented: self.$homeShowModal) {
          HomeDetailView()
            .animation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.6))
        }
        .frame(width:345)
    }
//    .background(colorScheme == .dark ? Color.black.opacity(0.8) : Color.white)
        //.resizable()
        //.aspectRatio(contentMode: .fill)
    
      .edgesIgnoringSafeArea(.all)
      .onAppear(perform: {
        //self.pulsateAnimation.toggle()
      })
  }
}

struct AvocadosView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .previewDevice("iPhone 11 Pro")
      .environment(\.colorScheme, .light)
  }
}
