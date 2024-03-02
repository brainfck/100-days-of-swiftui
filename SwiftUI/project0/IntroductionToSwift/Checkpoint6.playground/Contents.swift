import Foundation

struct Car {
  let model: String
  let numberOfSeats: Int
  private(set) var gear: Int
  
  init() {
    self.init(model: "", numberOfSeats: 2, gear: 0)
  }
  
  init(model: String, numberOfSeats: Int, gear: Int) {
    self.model = model
    self.numberOfSeats = numberOfSeats
    self.gear = gear
  }
  
  mutating func gearUp(_ value: Int = 1) {
    gear += value
    
    if gear > 10 {
      gear = 10
    }
  }
  
  mutating func gearDown(_ value: Int = 1) {
    gear -= value
    
    if gear < 0 {
      gear = 0
    }
  }
}

var car = Car()
