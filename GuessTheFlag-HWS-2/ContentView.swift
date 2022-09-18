//
//  ContentView.swift
//  GuessTheFlag-HWS-2
//
//  Created by Kevin Mattocks on 9/16/22.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    var correctAnswer = Int.random(in: 0...2)
    //There will be 3 flags displayed, 0, 1, 2
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        //flag was tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Zstack
//If you want to fill out the whole area behind the text. Use Color.red as first thing in Zstack rather than a background modifier

//Color.primary is s adaptive. Depends on user Dark/Light mode



//background modifer .ultraThinMaterial is very translucent looking
