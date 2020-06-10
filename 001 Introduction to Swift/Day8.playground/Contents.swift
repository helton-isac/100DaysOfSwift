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


