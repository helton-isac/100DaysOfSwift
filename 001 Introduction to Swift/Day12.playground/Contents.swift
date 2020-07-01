import UIKit

// Handling missing data
var age: Int? = nil
age = 38

// Unwrapping optionals
var nameNil: String? = nil
var nameNotNil: String? = "NotNil"
var nameNotNil2: String = "NotNil2"

func printTotalLetters(text: String?){
    if let unwrapped = text {
        print("\(unwrapped.count) letters")
    } else {
        print("Missing name.")
    }
}

printTotalLetters(text: nameNil)
printTotalLetters(text: nameNotNil)
printTotalLetters(text: nameNotNil2)

// Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

func getMeaningOfLife() -> Int? {
    42
}
func printMeaningOfLifeIfLet() {
    if let name = getMeaningOfLife() {
        print(name)
    }
}
func printMeaningOfLifeGuardLet() {
    guard let name = getMeaningOfLife() else {
        return
    }
    print(name)
}

// Force unwrapping
let str = "5"
let num = Int(str)
let numUnWrapped = Int(str)!


// Implicitly unwrapped optionals
let age2: Int! = nil

// Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"

// Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

// Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

// Failable initializers
let str2 = "5"
let num2 = Int(str)

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let person1 = Person(id: "12345678")
let person2 = Person(id: "123456789")
let person3 = Person(id: "1234567890")

// Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

