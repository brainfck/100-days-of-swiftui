//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mykhailo Tsuber on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
//      Button("Delete selection", role: .destructive, action: executeDelete)
//      Button("Button1") {}
//        .buttonStyle(.bordered)
//      Button("Button2", role: .destructive) {}
//        .buttonStyle(.bordered)
//      Button("Button3") {}
//        .buttonStyle(.borderedProminent)
//        .tint(.mint)
//      Button("Button4", role: .destructive) {}
//        .buttonStyle(.borderedProminent)
      
//      Button {
//        print("Button was tapped")
//      } label: {
//        Text("Tap me")
//          .padding()
//          .foregroundStyle(.white)
//          .background(.red)
//      }
      Button {
        print("Button was tapped")
      } label: {
//        Image(systemName: "pencil")
        Label("Edit", systemImage: "pencil")
          .padding()
          .foregroundStyle(.white)
          .background(.red)
      }
    }
  }
  
  func executeDelete() {
    print("Deleting...")
  }
}

#Preview {
  ContentView()
}
