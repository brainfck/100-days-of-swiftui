////  ContentView.swift
//  BetterRest
//
//  Created by brainfsck on 06.03.2024.
//
//

import CoreML
import SwiftUI

struct ContentView: View {
  @State private var wakeUp = defaultWakeTime
  @State private var sleepAmount = 8.0
  @State private var coffeAmount = 1
  
  static var defaultWakeTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    
    return Calendar.current.date(from: components) ?? .now
  }
  
  var body: some View {
    NavigationStack {
      Form {
        
        Section("When do you want to wake up?") {
          DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        }
        
        
        
        Section("Desired amount of sleep") {
          Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        }
        
        Section("Daily coffee intake") {

          Picker(selection: $coffeAmount, label: Text("Cups")) {
            ForEach(1...20, id: \.self) { cupAmount in
              Text("\(cupAmount) cup\(cupAmount != 1 ? "s" : "")")
            }
          }
        }
        
        Section("Your ideal bedtime is") {
          Text(calculatedBedtime())
        }
        
      }
      .navigationTitle("BetterRest")
    }
    .padding()
  }
  
  func calculatedBedtime() -> String {
    do {
      let config = MLModelConfiguration()
      let model = try SleepCalculator(configuration: config)
      
      let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
      let hour = (components.hour ?? 0) * 60 * 60
      let minute = (components.minute ?? 0) * 60
      
      let prediction = try model.prediction(
        wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeAmount))
      
      let sleepTime = wakeUp - prediction.actualSleep
      return sleepTime.formatted(date: .omitted, time: .shortened)
    } catch {
      return "Sorry, there was a problem calculating your bedtime."
    }
  }
}

#Preview {
  ContentView()
}
