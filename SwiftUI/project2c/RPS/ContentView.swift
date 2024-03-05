////  ContentView.swift
//  RPS
//
//  Created by brainfsck on 05.03.2024.
//
//

import SwiftUI

internal enum MoveType {
  case rock
  case paper
  case scissors
  case win
  case lose
}

struct GameButton: View {
  let type: MoveType
  let action: () -> Void
  
  var buttonText: String {
    switch type {
    case .rock:
      return "🪨"
    case .paper:
      return "📜"
    case .scissors:
      return  "✂️"
    case .win:
      return "🏆"
    case .lose:
      return "💀"
    }
  }
  
  var body: some View {
    Button(
      action: action,
      label: {
        Text(buttonText)
      })
    .font(.system(size: 60))
  }
}

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

struct ContentView: View {
  private let moves: [MoveType] = [.rock, .paper, .scissors]
  private let winMoves: [MoveType] = [.paper, .scissors, .rock]
  private let loseMoves: [MoveType] = [.scissors, .rock, .paper]
  
  @State private var correctMove: Int = Int.random(in: 0...2)
  @State private var winGoal: Bool = Bool.random()
  @State private var scoreTitle = ""
  @State private var showingScore = false
  @State private var showingReset = false
  @State private var totalScore = 0
  @State private var movesMade = 0
  @State private var hostFace = "😎"
  
  private let maximumMoves = 3
  
  func moveTapped(_ move: MoveType) {
    movesMade += 1
    let moves = winGoal ? winMoves : loseMoves
    
    if move == moves[correctMove] {
      scoreTitle = "Correct"
      totalScore += 1
      hostFace = "😭"
    } else {
      scoreTitle = "WRONG, YOU DIE"
      totalScore -= 1
      hostFace = "😎"
    }
    
    showingScore = true
    
    if movesMade >= maximumMoves {
      showingReset = true
    }
  }
  
  func makeMove() {
    correctMove = Int.random(in: 0...2)
    winGoal.toggle()
  }
  
  func restartGame() {
    totalScore = 0
    movesMade = 0
    makeMove()
  }
  
  var body: some View {
    
    ZStack {
      LinearGradient(stops: [
        .init(color: Color(red: 89/255, green: 5/255, blue: 173/255), location: 0),
        .init(color: .black, location: 1),
      ], startPoint: .top, endPoint: .bottom)
      .ignoresSafeArea()
      
      Spacer()
      
      VStack {
        Text("RPS")
          .titleStyle()
        Text("Score: \(totalScore) of \(movesMade)")
          .titleStyle()
        Text(hostFace)
          .font(.system(size: 150))
        
        HStack {
          Text("My move:")
            .foregroundStyle(.white.secondary)
            .font(.headline)
          GameButton(type: moves[correctMove]) {}
          .disabled(true)
          
          Text("Your goal:")
            .foregroundStyle(.white.secondary)
            .font(.headline)
          
          GameButton(type: winGoal ? .win : .lose) {}
          .disabled(true)
        }
        
        Spacer()
        Spacer()
        Spacer()
        
        HStack {
          GameButton(type: .rock) {
            moveTapped(.rock)
          }
          
          GameButton(type: .paper) {
            moveTapped(.paper)
          }
          
          GameButton(type: .scissors) {
            moveTapped(.scissors)
          }
          .rotationEffect(Angle(degrees: 180))
        }
        .alert(scoreTitle, isPresented: $showingScore) {
          Button("Continue") {
            if movesMade < maximumMoves {
              makeMove()
            }
          }
        }
        
        Spacer()
        Spacer()
        Spacer()
      }
    }
    .alert("Game Over", isPresented: $showingReset) {
      Button("Restart game", action: restartGame)
    } message: {
      Text("Your total score is \(totalScore) of \(maximumMoves)")
    }
  }
}

#Preview {
  ContentView()
}
