import UIKit

// Initializers
struct User {
    var username: String
}

var user = User(username: "twostraws")

struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user2 = User2()
user2.username = "twostraws"

// Referring to the current instance
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")

struct PersonLazy {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var edLazy = PersonLazy(name: "Ed")
edLazy.familyTree

// Static properties and methods
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let edStudent = Student(name: "Ed")
let taylorStudent = Student(name: "Taylor")
print(Student.classSize)

// Access control
struct PersonAccess {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let edAccess = PersonAccess(id: "12345")



