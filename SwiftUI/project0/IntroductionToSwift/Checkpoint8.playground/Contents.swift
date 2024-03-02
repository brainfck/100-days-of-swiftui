import Foundation

protocol Building {
  var rooms: Int { get }
  var cost: Int { get set }
  var estateAgentName: String { get set }
  
  func printSalesSummary()
}

extension Building {
  func printSalesSummary() {
    print("Building with \(rooms) rooms, costs: \(cost)$, agent: \(estateAgentName)")
  }
}

struct House: Building {
  let rooms: Int = 3
  var cost: Int
  var estateAgentName: String
}

struct Office: Building {
  let rooms: Int = 10
  var cost: Int
  var estateAgentName: String
}

var home = House(cost: 50_000, estateAgentName: "John Doe")
var office = Office(cost: 1_000_000, estateAgentName: "John Doe")

home.printSalesSummary()
office.printSalesSummary()
