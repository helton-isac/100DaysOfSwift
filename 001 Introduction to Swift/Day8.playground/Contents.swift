import UIKit

func printHeader(_ header: String){
    var line = ""
    for _ in 1...header.count {
        line += "-"
    }
    print("\n\(line)\n\(header)\n\(line)\n")
}


printHeader("Creating your own structs")

struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)


printHeader("Computed properties")
struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

printHeader("Property observers")

struct Progress {
    var task: String
    var amount: Int {
        willSet {
            print("\(task) will set called. Current Amount: \(amount)")
        }
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
print("progress.amount = 30")
progress.amount = 30
print("progress.amount = 80")
progress.amount = 80
print("progress.amount = 100")
progress.amount = 100


printHeader("Methods")
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

printHeader("Mutating methods")
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()
print(person.name)
let person2 = Person(name: "Ed")
//person2.makeAnonymous() //--Cannot use mutating member on immutable value: 'person2' is a 'let' constant
print(person2.name)

printHeader("Properties and methods of strings")
let string: String = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

printHeader("Properties and methods of arrays")
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

