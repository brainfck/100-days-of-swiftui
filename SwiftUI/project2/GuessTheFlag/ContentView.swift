//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mykhailo Tsuber on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        Color.blue
        Color.yellow
      }
      
      Text("Your content")
        .foregroundStyle(.secondary)
        .padding(50)
        .background(.ultraThinMaterial)
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ContentView()
}
