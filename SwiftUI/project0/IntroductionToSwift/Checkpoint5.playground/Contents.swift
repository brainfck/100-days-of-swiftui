import Foundation

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

var numbers = luckyNumbers
  .filter{ !$0.isMultiple(of: 2)}
  .sorted(by: <)
  .map { "\($0) is a lucky number" }

numbers.forEach {
  print($0)
}
