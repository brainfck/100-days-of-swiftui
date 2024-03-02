//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mykhailo Tsuber on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("X")
        Text("X")
        Text("X")
      }
      HStack {
        Text("X")
        Text("X")
        Text("X")
      }
      HStack {
        Text("X")
        Text("X")
        Text("X")
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
