import Cocoa

final class Passport {
    let series: String
    let number: String
    let issueDate: String
    weak var owner: Person?
    
    init(series: String,
         number: String,
         issueDate: String
    ) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        print("Creating passport \(series) \(number)")
    }
    
    deinit {
        print("Deleting passport \(series) \(number)")
    }
}

final class Person {
    let fullName: String
    let age: Int
    let passport: Passport
    
    init(fullName: String,
         age: Int,
         passport: Passport
    ) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print("Creating person \(fullName)")
    }
    
    deinit {
        print("Deleting \(fullName)'s data")
    }
}

// Function for testing the creation and deletion of objects
func testPersonAndPassport() {
    print("Creating Person and Passport objects")
    var passport1: Passport? = Passport(series: "75", number: "123456", issueDate: "2024-06-22")
    var person1: Person? = Person(fullName: "Kuzina Anastasia", age: 24, passport: passport1!)

    passport1?.owner = person1
    
    print("Passport owner: \(passport1?.owner?.fullName ?? "No owner")")
    
    print("Deleting Person and Passport objects")
    person1 = nil
    print("Cheking passport owner: \(String(describing: passport1?.owner))")
    passport1 = nil
    
    print("Objects should be deleted now")
}

testPersonAndPassport()
