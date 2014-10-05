# Swift
Lets talk about Swift

Author: Lin Dong

Date: Sat Oct  4 23:57:04 EDT 2014

## Core Syntax

Notes I took along with reading:

* Swift Programming Language First Look
* Swift Essential Training

### Create variables
``` swift
// with type annotation
var myVariable1 : Int
var myVariable2 : Float
var myVariable3 : Double
var myVariable4 : Bool
var myVariable4 : String
var myVariable4 : Character
```

### Create constant

``` swift
let daysInWeek = 7

```

### Print
```
println("Something")
println(10)
println(variable1)
```

### String interpolation
```
var name = "John Doe"
println("This is \(name)")

var unitPrice = 20
var quantity = 10
println("The total value is \(unitPirce * quantity)")
```

Swift conversion: `Double(), int(), String()`
Swift will not implicitly covert types for safety concerns

### If
```
if var > 500 {

} else {

}
```

Code blocks must be surrounded
statement must be evaluated into **Bool**

### Switch
```
let windSpeed = 10
switch windSpeed {

case 0:
println("Hi")

case 1:
println("Hi")

case 2:
println("Hi")

default:
break // explicity to end this statement

}
```

Swift switch:

* will not fall though next switch statements
* cases must be exhaustive.
* can provide ranges of values

```
switch windSpeed{
case 0...3:
    println("Hi")
default:
    break
}
```
### loops
```
// ok to use
for var i =0; i<00; ++i {
    //
}

// encouraged
for item in collection{
    //
}

var total = 0
for index in 1...100 {
    total += index
}
```

`...`, closed range operator, 0...100,  0-100
`..<`, half-open range operator, 0..<100, 0-99

```
var name = "John"
for eachChar in name{
    println(eachChar)
}
```

while loop
```
while condition{
    //
}
```

do while loop
```
do {
  // logics
} while conditon

```


### function

```
func myFunc(){
    println("what is up?")
}

myFunc()

func myFunc2(name: String){
    println("Hello \(name)")
}
myFunc2("John")
```

In swift by default, an input parameter is a **constant** not a **variable**

This is how you make the parameter to be mutable
```
// return String
func myFunc3(var age: Int) -> String{
    println("Hello \(name)")
    return "String"
}

let returnValue = myFunc3(10)

// using default parameter values
func myFunction(name: String = "John Doe"){
    println("Hello", \(name))
}
myFunction() // use default value
myFunction("Jane") // ERROR
myFunction(name: "Jane") // good

```

## Complex Types
Arrays and Dictionary
### Arrays

Type-Safed, zero based array

Is array dynamic? If its `var` it is mutable, `let` is not.

i.e.

```
let daysInMonth = [1,2,3,4]

var colors =["Red", "Black"]

vars flavors : [String] // without initialization

flavors.append();

flavors += ['color']

flavors.insert("color", atIndex:0);

flavors.removeLast()

flavors.removeAtIndex(3)

flavors.count

flavors.isEmpty

for each in collection{
    println(each)
}
```

### Dictionary
```
var states= ["AZ" : "Arizona", "GA": "Georgia"]
var products : [Int: String]
println(states["AZ"])
states["FL"] = "Flordia"
states.updateValue("Nevada", forKey: "NV")
states["DE"] = nil // atually remove
states.removeValueForKey("CA")
states.count
for (key, val) in collection {
    println("\(key) and \(val)")
}
```
### Tuple
```
var a = "string"
let b = 100
var myTuple = (a,b)
var anotherTuple = (a, b, 12345, "Hi")
// Tuples with dictionaries
for (abbr, fullname) in states {
    println("\(abbr): \(fullname)")
}

func getName() -> (name:String, length:Int) {
    return ("Hi", 100)
}

var result = getName()

println("Name is \(result.0), length is \(result.1)")
// or
println("Name is \(result.name), length is \(result.length)")
let (name, length) = getName();
```
### Using optional
```
// must be initialized before use
var temp : Int = 0
println("The temperature is \(temp)")

// Either vaild Integer or nil
var temp2 : Int?
println("The temperature is \(temp2)")

// forced unwrapping, if we know for sure the value is not nil
println("The temperature is \(temp2!)")

// optional binding
if let fullname = states["NV"]{
    println("The state's fullname is \(fullname)")
} else {
    println("No details found")
}
```

### Using Enumerations
```
enum SeatPreference{
    case Middle
    case Aisle     // member values
    case Window
    case NoPrefernce
}

var jenPrefers : SeatPreference
jenPrefer = SeatPreference.Aisle
// or
jenPrefer = .Aisle
// or
let jenPreferen = SeatPreference.Aisle
switch royPrefers {
case .Window:
    println("Window")
case .Aisle
    println("Aisle")
case .Middle
    println("Middle")
case .NoPreference
    println("NoPreference")
}

```

### Closures
Just another name for **Anonymous Function**

``` swift
func myFunction(){
    println("This is a function")
}

{
    println("This is a closure")
}
let myClosure = {
    println("This is another closure")
}

func performFiveTimes(closure: () -> () ){
    for i in 1...5{
        closure()
    }
}

// or
perforFiveTimes({
    println("This is an inline closure")
})

// defining closure input/ output
// A function that takes no parameters and returns nothing
func myFunction ()->(){
    println()
}
// A closure that takes no parameters and return nothing
{ ()->() in
    println("This is a simple closure")
}

// sorted is a built-in function in Swift
// sorted(array_to_sort, closure_to_compare)
let unsortedArray = [1,3,-10,5,5,3,4,6,7,44,3]
// closure
{ (first: Int, second: Int) -> Bool in
    return first < second
}

// using them together
let sortedArray = sorted(unsortedArray,
        { (first: Int, second: Int) -> Bool in
            return first < second
        }
)
```

### Classes and Instantiating objects

```
class Player {
    // properties
    var name: String = "John Doe"
    var score: Int = 100

    // methods
    func description(){
        println("Player \(name) has a score of \(score)")
    }

    // init
    init(){
        name = "John Doe"
        score = 0
    }

    int(name:String){
        self.name = name // self
        self.score = 0
    }
}

var jake = Player() // instantiates a new player object
jake.name = "Jake"
jake.score = "1"
var fred = Player(name: "Fred")
```

Inheritance in Swift

```
class GoldPlayer: Player{

    func newMethod(){
        //
    }

    override func description(){
        println("Hi")
        super.description() // call method in superclass
        println("There")
    }
}

```

Calling functions vs calling methods
```
func multipleParams(first:int, second: Int){
    println("First times second is \(first * second)")
}

// function call
multipleParams(123, 456)

class Example {
    func multipleParams(first:int, second: Int){
        println("First times second is \(first * second)")
    }
}
// method call
var myObject = Example()
myObject.multipleParams(123,456) // wont compile, failing
myObject.multipleParams(123, second: 456)
```

Access levels in Swift:
* private: only accessible from within the same source code file

* internal: this is default, accessible across code files, but must be within the same compiled module

* public: accessible from any module that has imported yours

i.e.

```
public class Player {
    // properties - no modifer, will default to internal
    var name: String
    var score: Int

    // public methods
    public func description(){
        println("something")
    }
    // private methods
    private func calculateBonus(){
        //
    }
}
```

### Computed properties
```
class Person{

    var firstName : String
    var lastName: String
    // computed properties
    var fullName: String{
        // setters and getters
        get {
            return firstName + " " + lastName
        }
        set {
            var nameArray = newValue.componentsSeparatedByString(" ")
            firstName = nameArray[0]
            lastName = nameArray[1]
        }
    }
    var anotherFullName: String {
        // as getters
        return firstName + " " + lastName
    }
    init(first: String, last:String){
        self.firstName = first
        self.lastName = last
    }
}

var examplePerson = Person(first: "Jen", last: "Doe")
println(examplePerson.fullName)

```

### Type properties and methods

They are actually class level properties
``` swift
class BankAccount {
  class var interestRate: Float {
    return 1000
  }
  class func printMe() {
    // cannot refer instance level, only class level
    println("Hi")
  }
}

BankAccount.interestRate

BankAccount.printMe()

```

### Lazy Properties

``` swift
func getDailyBonus() -> Int {
    // logics
    return random()
}
class Player {

  lazy var bonus = getDailyBonus()
}

var newPlayer = Player()
println(newPlayer.bonus)
```

Lazy property is a variable that initialization upon accessing, and must be `var`

### Property observer
```
class Player {

  lazy var bonus = getDailyBonus()
  var name : String = "John Doe" {
    willSet{
      println("About to change \(newValue)");
    }
    didSet {
      println("changed \(oldValue)")
    }

    // didSet (varName) {
    //   println("changed \(varName)")
    // }

  }
}

var newPlayer = Player()
newPlayer.name = "Jeen Doe";
```

Property observer does not work for lazy property

### Inheritance

```
class Person {
  var name: String

  final func description() -> String{
    return "This is a toString method in Java"
  }
  init (){
    name = "Hi"
  }
}

class Student : Person {
  var grade : String
  override init () {
    grade = "A"
    super.init()
  }
  func description(){  // errors, since super class declared as final
    return "Hello"
  }
}
```

Using `final` can avoid overriding.

### Structures

Structure vs Class

Structures are value types(pass by value)
* Int, Float, Double, and String

Classes are reference types(pass by reference)

i.e.

``` swift
struct SimpleStruct {
    var val: Int = 99
}
struct SimpleClass {
    var val: Int = 99
}

func changeMe(var object: SimpleClass) -> Int{
    object.val = 1000
    return object.val
}

var myStruct= SimpleStruct()
var myClass = SimpleClass()
changeMe(myStruct)
changeMe(myClass)
myStruct // unchanged,  still 99
myClass // changed, 1000

```
Struct has no `inheritance` nor `deinit`

Swift automatically generate Struct member initialization.

### Basic operators
```
+ - * /
+= -=
++ --
```
Swift does not allow values to overflow

Here are some exceptions: `&+ &- &* &/ &%`

###  Operators
Comparison Operators

``` swift
==,   // equal to
!=,   // not equal to
===,  // identical to
!==,  // not identical to
```
Advanced Operators

Nil coalescing operator
``` swift
var personalSite: String?
var defaultSite = "ldong.org"

var website: String

if personalSite != nil{
    website = personalSite!
} else {
    website = defaultSite
}

// simplify
var website = personalSite ?? defaultSite

```
Remainder operator: `%`


### import

Playground: `import UIKit`

OS X: `import Cocoa`

Frameworks:

* `import UIKit` for iOS
* `import AppKit` for Mac Desktop

Both of these links to `Foundation`

### Type checking and Casting

See **UIKit** hierarchy

```
import UIKit
let myButton = UIButton()
let mySlider = UISlider()
let myTextField = UITextField()
let myDatePicker = UIDatePicker()
let controls = [myButton, mySlider, myTextField, myDatePicker]
for item in controls {
    // optional 1
    if item is UIDatePicker{
        println("UIDatePicker")
        // keyword as
        let picker = item as UIDatePicker // downcasting
    }

    // optional 2
    let picker = item as? UIDatePicker
    if picker != nil{
        picker!.datePickerMode = UIDatePickerMode.CountDownTimer
    }

    // optional 3
    if let picker = item as ? UIDatePicker {
        picker!.datePickerMode = UIDatePickerMode.CountDownTimer
    }
}
```

### Any and AnyObject references

``` swift
var someObject : AnyObject
var something : Any

var arrayOfObject: [AnyObject]
var arrayOfAnything: [Any]

if someObject is String{
    // do something
}
```

* Objective C `id` maps to swift `AnyObject`

### Protocol

Really similar to `interface` in Java

Defining a protocol

``` swift
protocol Cleaner {
    // methods signatures
    func cleanFloors()
    func vacuum()
    function emptyTrash() -> Bool

    // properties
    var brokenBulbs : Bool {get set}
}

```

Confirming a protocol

``` swift
class MyClass : SuperClass , ExampleProtocol, AnotherProtocol {
    // logics
}

```
Class can only inherit from one *class*,  but multiple *protocols*

### Extensions

Extensions:

* Add methods and properties to existing types
* Does not require source code for the type
* Can be added to classes, structures and enumerations

``` swift
import UIKit

extension String{

    func reverseWords() -> String {
        let wordsArray = self.componentsSeparatedByString(" ")
        let reversedArray = wordsArray.reverse()
        var newString = ""
        for eachWord in reversedArray {
            newString += eachWord + " "
        }
        return newString
    }
}

var message = "helloworld"
message.reverseWords()
```

### Generics

Using **Generics** like *interfaces* or *abstract*

``` swift
func printMe<T> (theArray : [T]) -> T {
    for eachItem in theArray {
        print(eachItem)
    }
    println()
    return theArray.last
}
