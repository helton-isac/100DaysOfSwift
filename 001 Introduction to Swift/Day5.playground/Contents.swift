import UIKit

// Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()


// Accepting parameters
print("Hello, world!")

func square(number: Int) {
    print(number * number)
}

square(number: 8)

// Returning values
func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)

func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

greet(name:"Helton")

func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}
doMath()
doMoreMath()

// Parameter labels
func square3(number: Int) -> Int {
    return number * number
}

let result2 = square3(number: 8)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

// Default parameters
func greet2(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet2("Taylor")
greet2("Taylor", nicely: false)

// Variadic functions
print("Haters", "gonna", "hate")

func square4(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square4(numbers: 1, 2, 3, 4, 5)

// Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// Running throwing functions
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
