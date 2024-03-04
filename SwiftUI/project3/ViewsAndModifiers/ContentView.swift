////  ContentView.swift
//  ViewsAndModifiers
//
//  Created by brainfsck on 04.03.2024.
//
//

import SwiftUI

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundStyle(.white)
      .padding()
      .background(.blue)
      .clipShape(.rect(cornerRadius: 10))
  }
}


extension View {
  func titleStyle() -> some View {
    modifier(Title())
  }
  
  func watermarked(with text: String) -> some View {
    modifier(Watermark(text: text))
  }
}

struct Watermark: ViewModifier {
  var text: String
  
  func body(content: Content) -> some View {
    ZStack(alignment: .bottomTrailing) {
      content
      Text(text)
        .font(.caption)
        .foregroundStyle(.white)
        .padding(5)
        .background(.black)
    }
  }
}


struct ContentView: View {
  var body: some View {
    VStack(spacing: 10) {
      Color.blue
        .frame(width: 300, height: 300)
        .watermarked(with: "Hacking with Swift")
      
      Text("Hello World")
        .titleStyle()
    }
  }
}

#Preview {
  ContentView()
}
