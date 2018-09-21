import Foundation

// declare constant
let myMoney = 1500
// declare multiple ones in one line
let myBankAccount = 1000, myWallet = 500
// error if you do this
// myMoney = 500

// declare variable
// with type annotation
var myExpense: Int = 50
var mySalary = 500, myBills = 150

/* Int's size depends on 32/64 bit OS
 In 32 bit OS, size is Int32
 In 64 bit OS, size is Int64 */

// Integer with unsigned 8 bit
let minValue = UInt8.min
let maxValue = UInt8.max


// Decimal
// Double: 64 bit, precision of at least 15 decimal digits
// Float: 32 bit, precision of at least 6 decimal digits

let decimalInteger = 17
let binaryInteger = 0b10001 //start with 0b
let octalInteger = 0o21 // start with 0o
let hexadecimalInteger = 0x11 // start with 0x

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 // p is required for hexadecimal even if power is 0

// use underscore to increase readability
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// convert
let one: UInt8 = 1
let oneInHex = UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let addition = Double(three) + pointOneFourOneFiveNine // must be the same type

// tuple
let error = (404, "error")

let (code, description) = error // retrieve values in a tuple
error.0 // retrieve first value: code
error.1 // retrieve second value: description

let (code2, _) = error // use underscore to ignore a value

let errorDetail = (code: 404, description: "error") // tuple with keys
errorDetail.code; errorDetail.description

// optional
// an optional variable can be nil if no value is stored.
// to get the actual value in an optional variable, unwrap it.
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(type(of: convertedNumber)) // the type of convertedNumber is Int? (Optional<Int>)
let illegalNumber = "!@#"
let failedConvertion = Int(illegalNumber)
if failedConvertion == nil {
    print("failedConvertion is nil")
} else {
    let _ = failedConvertion! // implicitly unwrap
}
if let value = failedConvertion { // optional binding
    print(value)
} else {
    print("failed to unwrap")
}


// error handling
func canThrowAnError() throws {
    // throws indicate this function may throw an error
}

// try has to be put in do
do {
    try canThrowAnError()
    // no error
} catch {
    // error catched
}

// assertion, precondition
// assertion is called in Debug mode
// precondition is called in both Debug and Release mode

// if they returns false, the program will be terminated
// prevent the system from doing something wrong
let age = 3
assert(age >= 0, "Age cannot be negative")

// force assertion to fail
// assertionFailure("A person's age can't be less than zero.")

let index = 3
precondition(index > 0, "index must be larger than zero")
// if Ounchecked is set in compiler, precondition always returns true.

// fatalError(_:file:line:) force program to terminate regardless of the setting of compiler














