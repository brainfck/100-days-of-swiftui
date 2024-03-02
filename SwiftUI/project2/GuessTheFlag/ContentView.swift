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
//      LinearGradient(stops:[
//        .init(color: .white, location: 0.65),
//        .init(color: .black, location: 0.35)
//      ], startPoint: .top, endPoint: .bottom)
      
//      RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
      
//      AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
      
      Text("Your content")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
        .background(.red.gradient)
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ContentView()
}
