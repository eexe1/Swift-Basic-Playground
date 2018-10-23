//: [Previous](@previous)

import Foundation


class Person : Codable {
    var name: String?

    private enum CodingKeys : String, CodingKey {
        case name
    }

    init() {

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }

    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

}

class Employee : Person {
    var employeeID: String?

    private enum CodingKeys : String, CodingKey {
        case employeeID = "emp_id"
    }

    override init() {
        super.init()
    }

    required init(from decoder: Decoder) throws
    {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        let superdecoder = try container.superDecoder()
        try super.init(from: superdecoder)
        //        try super.init(from: decoder)

        employeeID = try container.decode(String.self, forKey: .employeeID)
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let superDecoder = try container.superDecoder()
//        try super.init(from: superDecoder)
////        try super.init(from: decoder)
//        if let employeeID = try container.decodeIfPresent(String.self, forKey: .employeeID) {
//            self.employeeID = employeeID
//        }
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
//        try super.encode(to: container.superEncoder())
        try container.encode(employeeID, forKey: .employeeID)
        let superdecoder = container.superEncoder()
        try super.encode(to: superdecoder)
    }
}
//
//
let employee = Employee()
employee.employeeID = "emp123"
employee.name = "Joe"
//
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data = try! encoder.encode(employee)
print(String(data: data, encoding: .utf8)!)

// decode
let result = try JSONDecoder().decode(Employee.self, from:data)
print(result.employeeID)
print(result.name)
//: [Next](@next)



class FullSuper: Codable {

    var id: UUID?

    init() {}

    private enum CodingKeys: String, CodingKey { case id }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)

    }

    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)

    }

}

class FullSub: FullSuper {

    var string: String?
    private enum CodingKeys: String, CodingKey { case string }

    override init() { super.init() }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        let superdecoder = try container.superDecoder()
        try super.init(from: superdecoder)
//        try super.init(from: decoder)

//        string = try container.decode(String.self, forKey: .string)

//        string = try container.decode(String.self, forKey: .string)

        string = try container.decodeIfPresent(String.self, forKey: .string)
    }

    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(string, forKey: .string)

        let superdecoder = container.superEncoder()
        try super.encode(to: superdecoder)

    }
}

let fullSub = FullSub()
fullSub.id = UUID()
fullSub.string = "FullSub"

let fullEncoder = PropertyListEncoder()
let fullData = try fullEncoder.encode(fullSub)

let fullDecoder = PropertyListDecoder()
let fullSubDecoded: FullSub = try fullDecoder.decode(FullSub.self, from: fullData)
print(fullSubDecoded.string)
