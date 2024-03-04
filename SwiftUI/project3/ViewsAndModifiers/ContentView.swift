////  ContentView.swift
//  ViewsAndModifiers
//
//  Created by brainfsck on 04.03.2024.
//
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
//      Button("Hello World") {
//        print(type(of: self.body))
//      }
//      .frame(width: 200, height: 200)
//      .background(.red)
      Text("Hello World")
        .padding()
        .background(.red)
        .padding()
        .background(.blue)
        .padding()
        .background(.yellow)
        .padding()
        .background(.green)
    }
  }
}

#Preview {
  ContentView()
}
