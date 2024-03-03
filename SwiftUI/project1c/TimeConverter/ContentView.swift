//
//  ContentView.swift
//  TimeConverter
//
//  Created by brainfsck on 01.03.2024.
//

import SwiftUI

struct ContentView: View {
  
  @State private var inputValue = 0.0
  @State private var inputUnit = "Seconds"
  @State private var outputUnit = "Minutes"
  
  @FocusState private var amountIsFocused: Bool
  
  private let units = ["Seconds", "Minutes", "Hours", "Days", "Years"]
  
  let amountFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.zeroSymbol = ""
    return formatter
  }()
  
  private func getAmountInSeconds() -> Double {
    switch inputUnit {
    case "Seconds":
      return inputValue
    case "Minutes":
      return inputValue * 60.0
    case "Hours":
      return inputValue * 3600.0
    case "Days":
      return inputValue * 86400.0
    case "Years":
      return inputValue * 31536000.0
    default:
      return 0.0
    }
  }
  
  private func calculateOutput() -> Double {
    let inputAmountInSeconds = getAmountInSeconds()
    
    switch outputUnit {
    case "Seconds":
      return inputAmountInSeconds
    case "Minutes":
      return inputAmountInSeconds / 60.0
    case "Hours":
      return inputAmountInSeconds / 3600.0
    case "Days":
      return inputAmountInSeconds / 86400.0
    case "Years":
      return inputAmountInSeconds / 31536000.0
    default:
      return 0.0
    }
  }
  
  var convertedValue: String {
    let calculatedOutput = calculateOutput()
    return calculatedOutput == 0.0 ? "" : calculatedOutput.formatted()
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section("Amount you want to convert") {
          TextField("Amount",
                    value: $inputValue,
                    formatter: amountFormatter)
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)
        }
        
        Section("Select units you want to convert from") {
          Picker("From Units", selection: $inputUnit) {
            ForEach(units, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(.navigationLink)
        }
        
        Section("Select units you want to convert to") {
          Picker("To Units", selection: $outputUnit) {
            ForEach(units, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(.navigationLink)
        }
        
        Section("Result") {
          Text(convertedValue)
        }
      }
      .navigationTitle("Time Converter")
      .toolbar {
        if amountIsFocused {
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
