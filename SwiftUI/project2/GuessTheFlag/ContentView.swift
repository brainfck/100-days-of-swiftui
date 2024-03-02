//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mykhailo Tsuber on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false
  
  var body: some View {
    VStack {
      Button("Show Alert") {
        showingAlert = true
      }
      .padding()
      .foregroundStyle(.white)
      .background(.red)
      .alert("Important message", isPresented: $showingAlert) {
        Button("Delete", role: .destructive) { }
        Button("Cancel", role: .cancel) { }
      } message: {
        Text("Please read this.")
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
