import UIKit

func printHeader(_ header: String){
    var line = ""
    for _ in 1...header.count {
        line = line + "-"
    }
    print()
    print(line)
    print(header)
    print(line)
    print()
}




printHeader("Using closures as parameters when they accept parameters")

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

travel (
    action: {
        (place: String)
        in
        print("I'm going to \(place) in my car")
    }
)

func travelAction (place: String)
{
    print("My travel function to \(place)")
}

travel (action: travelAction(place:))




printHeader("When would closures with parameters be used as parameters?")

let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

func buildCar(name: String, engine: (Int) -> Void) {
    engine(2)
}

buildCar(name: "Test", engine: changeSpeed)

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}


printHeader("Using closures as parameters when they return values")

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    print(action("London"))
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}




printHeader("When would you use closures with return values as parameters to a function?")

func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]

    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
        // call our closure with the current value and the array element, assigning its result to our current value
        current = closure(current, value)
    }

    // send back the final current value
    return current
}

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}

print(sum)

let multiplied = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal * next
}

// WOW
let sum2 = reduce(numbers, using: +)


func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}




printHeader("Shorthand parameter names")

func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travel2 { place -> String in
    return "I'm going to \(place) in my car"
}

travel2 { place in
    return "I'm going to \(place) in my car"
}

travel2 { place in
    "I'm going to \(place) in my car"
}

travel2 {
    "I'm going to \($0) in my car"
}




printHeader("Closures with multiple parameters")

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel {
    "I'm going to \($0) at \($1) miles per hour."
}





printHeader("Returning closures from functions")

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")

let result2: Void = travel()("London")


printHeader("Capturing values")

func travel3() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result3 = travel3()
result("London")

func travel4() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result4 = travel4()
result4("London")
result4("London")
result4("London")




printHeader("Why do Swift’s closures capture values?")

func makeRandomNumberGenerator() -> () -> Int {
    var previousNumber = 0
    return {
        var newNumber: Int

        repeat {
            newNumber = Int.random(in: 1...3)
        } while newNumber == previousNumber

        previousNumber = newNumber
        return newNumber
    }
}

let generator = makeRandomNumberGenerator()

for _ in 1...10 {
    print(generator())
}
