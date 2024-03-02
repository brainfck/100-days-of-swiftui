import Foundation

func getRandomElement(from array: [Int]?) -> Int {
  return array?.randomElement() ?? Int.random(in: 1...100)
}

let array: [Int]? = [1, 2, 3, 4, 10, 99]
let array2: [Int]? = nil

print(getRandomElement(from: array))
print(getRandomElement(from: array2))
