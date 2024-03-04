//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by brainfsck on 02.03.2024.
//

import SwiftUI

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundStyle(.white)
      .font(.largeTitle.bold())
  }
}

extension View {
  func titleStyle() -> some View {
    modifier(Title())
  }
}

struct FlagImage: View {
  let country: String
  
  var body: some View {
    Image(country)
      .clipShape(.capsule)
      .shadow(radius: 5)
  }
}

struct ContentView: View {
  @State private var showingScore = false
  @State private var showingReset = false
  @State private var scoreTitle = ""
  @State private var totalScore = 0
  @State private var movesMade = 0
  
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  
  private let maximumMoves = 3
  
  var body: some View {
    ZStack {
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
      ], center: .top, startRadius: 200, endRadius: 400)
      
      .ignoresSafeArea()
      
      Spacer()
      
      VStack {
        Text("Guess the Flag")
          .titleStyle()
        
        VStack(spacing: 15) {
          VStack {
            Text("Tap the flag of")
              .font(.subheadline.weight(.heavy))
              .foregroundStyle(.white.secondary)
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
              .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
              } message: {
                Text("Your score is \(totalScore)")
              }
          }
          
          ForEach(0..<3) { number in
            Button {
              flagTapped(number)
            } label: {
              FlagImage(country: countries[number])
            }
          }
          .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
          .padding(.vertical, 20)
          .background(.regularMaterial)
          .clipShape(.rect(cornerRadius: 20))
        }
        
        Spacer()
        Spacer()
        
        Text("Score: \(totalScore)")
          .foregroundStyle(.white)
          .font(.title.bold())
        
        Spacer()
      }
      .padding()
    }
    .alert("Game Over", isPresented: $showingReset) {
      Button("Restart game", action: restartGame)
    } message: {
      Text("Your total score is \(totalScore) of \(maximumMoves)")
    }
  }
  
  func flagTapped(_ number: Int) {
    movesMade += 1
    
    if number == correctAnswer {
      scoreTitle = "Correct"
      totalScore += 1
    } else {
      scoreTitle = "Wrong! \n Thats a flag of \(countries[number])"
    }
    
    showingScore = true
    
    if movesMade >= maximumMoves {
      showingReset = true
    }
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  
  func restartGame() {
    totalScore = 0
    movesMade = 0
    askQuestion()
  }
}

#Preview {
  ContentView()
}
