import UIKit

// Creating your own classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

var poppy = Dog(name: "Poppy", breed: "Poodle")

// Class inheritance
// Overriding methods

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}

poppy = Dog(name: "Poppy", breed: "Poodle")
poppy.makeNoise()
poppy = Poodle(name: "Poppy")
poppy.makeNoise()

// Final classes
final class Dog2 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copying objects
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singerCopy.name)
print(singer.name)
// If Singer is a struct, the values won`t be shared.

// Deinitializers
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Mutability
class Singer2 {
    let name = "Taylor Swift"
}

let taylor = Singer2()
//taylor.name = "Ed Sheeran" //error: cannot assign to property: 'name' is a 'let' constant
print(taylor.name)

