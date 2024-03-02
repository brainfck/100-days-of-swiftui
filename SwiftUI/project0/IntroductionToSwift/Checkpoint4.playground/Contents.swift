import Foundation

enum SqrtError: Error {
  case NumberOutOfBounds
  case NoRoot
}

func findIntSqrt(of number: Int) throws -> Int{
  if number < 1 || number > 10_000 {
    throw SqrtError.NumberOutOfBounds
  }
  
  var sqrt = 1
  while sqrt <= 100 {
    if sqrt * sqrt == number {
      return sqrt
    }
    sqrt += 1
  }
  
  throw SqrtError.NoRoot
}
do {
  let sqrt = try findIntSqrt(of: 999)
  print(sqrt)
} catch SqrtError.NumberOutOfBounds {
  print("Number is out of bounds 1...10_000")
} catch SqrtError.NoRoot {
  print("Number doesn't have int square root")
} catch {
  print("\(error)")
}

