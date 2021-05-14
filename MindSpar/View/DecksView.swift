//
//  DecksView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//

import SwiftUI

struct DecksView: View {
    // MARK: - PROPERTIES
    
    // var deck: Deck
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 50){
            rowsOfFolders()
            rowsOfFolders()
            rowsOfFolders()
            rowsOfFolders()
            
        }
    .blur(radius: 2)
    .overlay(
        HStack{
            Text("Decks Coming Soon!")
                .font(.title)
                .fontWeight(.bold)
        }
        )
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        DecksView()
    }
}

struct rowsOfFolders: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Image(systemName: "folder")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.red)
            Image(systemName: "folder")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.blue)
            Image(systemName: "folder")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.green)
            Image(systemName: "folder")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.pink)
        }
    }
}
