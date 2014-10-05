// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


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

func getDailyBonus() -> Int {
  // logics
  return random()
}
class Player {
  
  lazy var bonus = getDailyBonus()
  var name : String = "John Doe" {
    willSet{
      println("About to change \(newValue)");
    }
    didSet {
      println("changed \(oldValue)")
    }
  
  }
}

var newPlayer = Player()
newPlayer.name = "Jeen Doe";

println(newPlayer.bonus)


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
}
var arr = [123 , 456]
arr.last!


class Point {
  var x : Int {
    willSet {
      println("willSet called")
    }
    didSet {
      println("didSet called")
    }
  }
  init(){
    x = 10
    sum = 10
  }
  
  var sum : Int {
    set {
      x = newValue * 2 //Error
    }
    get {
      return x / 2 //Error
    }
  }
}

var p = Point()
p.sum = 10