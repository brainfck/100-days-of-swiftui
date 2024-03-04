////  ContentView.swift
//  ViewsAndModifiers
//
//  Created by brainfsck on 04.03.2024.
//
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    // There, font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.
    VStack {
      Text("Gryffindor")
        .font(.largeTitle)
      Text("Hufflepuff")
      Text("Ravenclaw")
      Text("Slytherin")
    }
    .font(.title)
    .padding()
    
    // That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
    VStack {
      Text("Gryffindor")
        .blur(radius: 0)
      Text("Hufflepuff")
      Text("Ravenclaw")
      Text("Slytherin")
    }
    .blur(radius: 5)
  }
}

#Preview {
  ContentView()
}
