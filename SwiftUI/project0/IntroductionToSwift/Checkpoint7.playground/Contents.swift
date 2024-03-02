import Foundation

class Animal {
  let legs: Int
  
  init(legs: Int) {
    self.legs = legs
  }
  
  func speak() {
    preconditionFailure("This method must be overridden")
  }
}

class Dog: Animal {
  private let barkingSound: String
    
  init(barkingSound: String) {
    self.barkingSound = barkingSound
    super.init(legs: 4)
  }
  
  override func speak() {
    print("My barking sounds like: \(barkingSound)")
  }
}

class Cat: Animal {
  private let meowingSound: String
  
  let isTame: Bool
  
  init(meowingSound: String, isTame: Bool) {
    self.isTame = isTame
    self.meowingSound = meowingSound
    super.init(legs: 4)
  }
  
  override func speak() {
    print("My meowing sounds like: \(meowingSound)")
  }
}

class Corgi: Dog {
  init() {
    super.init(barkingSound: "corgi-wuff.wav")
  }
}

class Poodle: Dog {
  init() {
    super.init(barkingSound: "poodle-wuff.wav")
  }
}

class Persian: Cat {
  init() {
    super.init(meowingSound: "persian-meow.wav", isTame: true)
  }
}

class Lion: Cat {
  init() {
    super.init(meowingSound: "lion-roar.wav", isTame: false)
  }
}

var animals = [Animal]()

let corgi = Corgi()
let poodle = Poodle()

let persian = Persian()
let lion = Lion()

animals.append(corgi)
animals.append(poodle)
animals.append(persian)
animals.append(lion)

for animal in animals {
  animal.speak()
  print(animal.legs)
}
