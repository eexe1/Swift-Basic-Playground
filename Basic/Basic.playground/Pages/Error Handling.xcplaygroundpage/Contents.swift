//: [Previous](@previous)

import Foundation

struct fooError: Error {
    let detail: String
    
}


func somethingWrong() throws {
    throw fooError(detail: "Oops, something goes wrong")
}


do {
    try somethingWrong()
} catch is fooError {
    print("this is foo Error")
}


class errorManager {
    let error: Error
    init(error: Error) {
        self.error = error
    }
}

let manager = errorManager(error: fooError(detail: "foo Error instance"))

if type(of: manager.error) == fooError.self {
    print("this is an instance of foo Error")
}


//: [Next](@next)
