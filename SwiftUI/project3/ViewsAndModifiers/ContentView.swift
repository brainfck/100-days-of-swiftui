////  ContentView.swift
//  ViewsAndModifiers
//
//  Created by brainfsck on 04.03.2024.
//
//

import SwiftUI

struct ContentView: View {
//  let motto1 = Text("Draco dormiens")
//  let motto2 = Text("nunquam titillandus")
  
  var motto1: some View {
    Text("Draco dormiens")
  }
  
//  var spells: some View {
////    VStack {
////      Text("Lumos")
////      Text("Obliviate")
////    }
//    
//    Group {
//      Text("Lumos")
//      Text("Obliviate")
//    }
//  }
  
  // adding ViewBuilder silently adds wrapping into TupleView so we can return multiple views
  @ViewBuilder var spells: some View {
    Text("Lumos")
    Text("Obliviate")
  }
  
  var body: some View {
    VStack {
      motto1
        .foregroundStyle(.red)
      spells
    }
  }
}

#Preview {
  ContentView()
}
