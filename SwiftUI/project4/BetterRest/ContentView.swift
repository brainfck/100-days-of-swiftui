////  ContentView.swift
//  BetterRest
//
//  Created by brainfsck on 06.03.2024.
//
//

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date.now
  
  var body: some View {
    VStack {
      Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
      DatePicker("Please, enter a time", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
