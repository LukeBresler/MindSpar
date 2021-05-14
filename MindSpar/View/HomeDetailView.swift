//
//  HomeDetailView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/18.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//

import SwiftUI

struct HomeDetailView: View {
// MARK: - PROPERTIES


@Environment(\.presentationMode) var presentationMode
@Environment(\.colorScheme) var colorScheme
    

var body: some View {
    
    VStack{
        Text("_")
            .font(.custom("", size: 50))
            .fontWeight(.bold)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: .center)
            .padding(.bottom, 20)
            .padding(.top, -10)
    
    ScrollView(.vertical, showsIndicators: false){
        VStack{
            Text("_")
                .font(.custom("", size: 50))
                .fontWeight(.bold)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 10, alignment: .center)
                .padding(.bottom, 20)
                .padding(.top, -30)
        Image("Composition - 6")
            .resizable()
            .frame(width:150, height: 210)
            .scaledToFit()
            
            //.font(.largeTitle)
            .foregroundColor(Color.gray)

    Group {
        
        Text("""
    Choose not to be harmed and you won't feel harmed.  Don't feel harmed and you haven't been. \n- Marcus Aurelius

    The aim of this app is to practice our mental reactions to destructive thoughts, and replace them with healthier and more useful thoughts.
    """)
        .lineLimit(nil)
        .font(.custom("Dosis-Medium", size: 22))
        .foregroundColor(Color("ColourTextAdaptive"))
        .multilineTextAlignment(.center)
                 .lineSpacing(8)
                 .frame(maxWidth: 650, minHeight: 220)
    
        
        VStack{
            Text("Instructions:")
                .underline()
                .lineSpacing(8)
                .font(.custom("Dosis-Medium", size: 24))
                .padding(.top, 20)
                .padding(.bottom, 10)

                    }
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)
                }
            HStack{
                Text("1.)")
                    .font(.custom("Dosis-Medium", size: 24))
                HStack{
                    Text("To start, go to")
                    VStack{
                Image(systemName: "square.on.square")
                    Text("Cards")
                    }
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        
                Text("and read the card.")
                }
            }
        HStack{
                Text("2.)")
                    .font(.custom("Dosis-Medium", size: 24))
                //Image(systemName: "square.on.square")
                Text("Open the card & read the counter-thought")
            }
        
        HStack{
                Text("3.)")
                    .font(.custom("Dosis-Medium", size: 24))
                Text("Close the card & practice the new reaction")
            }
        
        HStack{
            Text("4.)")
                .font(.custom("Dosis-Medium", size: 24))
            HStack{
                Text("Tap the")
                    Image(systemName: "shuffle")
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            Text("icon to get another card.")
            }
        }
        .padding(.bottom, 20)
            }
        }
}
    
}



struct HomeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HomeDetailView()
        .environment(\.colorScheme, .light)
  }
}








///

//VStack{

//
//    }
//
//
//    HStack{
//        Text("4.)")
//            .font(.custom("Dosis-Medium", size: 24))
//                HStack{
//                        Text("Press the ")
//                            VStack{
//                            Image(systemName: "shuffle")
//                            }
//                            .opacity(0.8)
//                            Text("button to get another card, randomly")
//                        }
//                    }
//
//                }
//                padding(.leading)
//
/////
