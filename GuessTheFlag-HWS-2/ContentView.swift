//
//  ContentView.swift
//  GuessTheFlag-HWS-2
//
//  Created by Kevin Mattocks on 9/16/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    //shuffled randomizes the array for us
    
    @State private var correctAnswer = Int.random(in: 0...2)
    //There will be 3 flags displayed, 0, 1, 2
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                        flagTapped(number) //number is being passed into the function to check and see if it matches up with the corect answer
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("\(score) point")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Your score is \(score)")
        }
        
   
    }
    
    
    //MARK: - Methods
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            score -= 1
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
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
