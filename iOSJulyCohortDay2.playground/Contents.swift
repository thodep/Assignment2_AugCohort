import UIKit
/*:
## Bitmaker Labs Swift Fundamentals = Functions and Methods in Swift
Functions and Methods are a large topic. I will stress however, that they're an important one. If you come from another programming language, you may hear the term **function** and **method** used interchangeably. I'm going to refer to the Swift Programming Language Book for this definition. I would advise following the link for a more detailed explanation of this. [Helpful resourses on Swift Functions should be read before continuing.](https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Methods.html) . **Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structures, and enumerations can also define type methods, which are associated with the type itself. Type methods are similar to class methods in Objective-C**

Ok, that's the long version. To put it in a concise manner. Functions are standalone pieces of functionality, while methods are functionality associated enclosed within a **class** **struct** or **enumeration**.

First, let's refresh ourselves with the creation of a simple function

*   func mySimpleFunction() {
*       println("hello, world")
*   }

* The **func** keyword denotes that this is a function.
* The **name** of this function is mySimpleFunction.
* There are no parameters passed in — hence the empty ( ).
* There is no return value.
* The function execution happens between the { }.

### Have a go. 
* Create a function that prints your name.
* Create a function that takes your name as a parameter and prints your name
*/
func takeMyName(){
print("Tho")
}
takeMyName()

func printYourName(myName:String) {
    print("Hello, my name is \(myName)")

}
printYourName("Tho")
/*:

Great, since you completed the first challenge. This will look very familiar. 

* func myFunctionName(param1: String, param2: Int) -> String {
* return "hello, world!"
* }

This new function, takes two parameters of type **String** and type **Int** the **->** indicates that this function returns a string. In this example, it returns a the String "hello, world!"

### Have a go, update this function so that it returns both the passed String and an Integer. This could be your name and your age.

*/
func allAboutMe(param1:String, param2:Int){
 print("My name is \(param1) and my age is \(param2)")
    
}
allAboutMe("THO", 120)
/*:

## Calling Functions

One thing we have to be aware of when writing Swift code. Is how parameters work. Let's look at the following example.

*   func hello(name: String) {
*       println("hello \(name)")
*   }
*   calling the function would be as follows. **hello("Kwame")**. This doesn't look to bad, this issue that I do want to bring up is that having a function/method with multiple parameters is quite common. Let's look at another example.

*   func hello(name: String, age: Int, location: String) {
*       println("Hello \(name). I live in \(location) too. When is your \(age + 1)th birthday?")
*   }

*   hello("Kwame Bryan", 39, "Courtice")

Working with the above function, it's difficult to know which each parameter is. Swift has a concept called external parameter name to clarify sometimes confusing syntax.

  
func hello(fromName name: String) {
    println("\(name) says hello to you!")

}

*   hello(fromName: "Kwame Bryan")

### Have a go. Create a function that uses the **external parameter name** concept. In your challenge, instead of a string use an Integer value.
*/
func randomNumber(bigNumber:Int, smallerNumber:Int){
print( " \(bigNumber) is bigger than \(smallerNumber) ")
}
randomNumber(10,5)
/*:
Now, you may be asking. What if the name of the variable is the name I want for the external parameter name. Do I need to write this twice? Lucky for us, this is not the case. Swift has a handy operator we can use for these types of situations. Looking back at our previous example.

* func hello(#name: String) {
*   println("Hello \(name)")
* }
We now get:
* hello(name:"Kwame Bryan")
*/
func saySomething(#name:String){
    print("Say \(name)")
}
saySomething(name:"aaaaaa")
/*:
 ## More on Parameters in Swift

Compared to Objective-C, Swift has a lot of extra options for what type of parameters can be passed in. Here are some examples.

## Variadic Parameters

In Swift, there is a new concept of optional types:

**Optionals say either “there is a value, and it equals x” or “there isn’t a value at all.” Optionals are similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Optionals are safer and more expressive than nil pointers in Objective-C and are at the heart of many of Swift’s most powerful features.**

To indicate that a parameter type is optional (can be nil), just add a question mark after the type specification:

* func myFuncWithOptionalType(parameter: String?) {
*       // function execution
* }

myFuncWithOptionalType("someString")
myFuncWithOptionalType(nil)

One caveat, that you should be aware of is that when working with optional parameters. You are forced to unwrap.

*   func myFuncWithOptionalType(optionalParameter: String?) {
*       if let unwrappedOptional = optionalParameter {
*           println("The optional has a value! It's \(unwrappedOptional)")
*      } else {
*           println("The optional is nil!")
*       }
*   }

* myFuncWithOptionalType("someString")
* // The optional has a value! It's someString

* myFuncWithOptionalType(nil)
* // The optional is nil

## Parameters with Default Values

* func hello(name: String = "you") {
* println("hello, \(name)")
* }

* hello(name: "Kwame Bryan")
* // hello, Kwame Bryan

* hello()
* // hello, you

Note that a parameter with a default value automatically has an external parameter name.

And since parameters with a default value can be skipped when the function is called, it is best practice to put all your parameters with default values at the end of a function’s parameter list. 

Here is a note from the [Swift Programming Language Book on the topic.](https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html):
Place parameters with default values at the end of a function’s parameter list. This ensures that all calls to the function use the same order for their non-default arguments, and makes it clear that the same function is being called in each case.
I’m a huge fan of default parameters, mostly because it makes code easy to change and backward compatible. You might start out with two parameters for your specific use case at the time, such as a function to configure a custom UITableViewCell, and if another use case comes up that requires another parameter (such as a different text color for your cell’s label), just add a new parameter with a default value — all the other places where this function has already been called will be fine, and the new part of your code that needs the parameter can just pass in the non-default value!

*/
//--------Variadic Parameters------------

func thoFuncWithOptionals(optionalParam:Int?,optionalParam2:String){
    if let unwrapOptional = optionalParam{
    print("Let count \(unwrapOptional) then sing \(optionalParam2) song")
    } else{
    print("This is nil")
    }
}
thoFuncWithOptionals(123,"ABC")
//thoFuncWithOptionals(nil)

//-------Param With Default Value---------
func sing(songName:String = "All about the Bass"){
print("Please sing \(songName) song")
}
sing()
sing(songName:"hey")
/*:

## Variadic Parameters

Variadic parameters are simply a more readable version of passing in an array of elements. In fact, if you were to look at the type of the internal parameter names in the below example, you’d see that it is of type [String] (array of strings):

* func helloWithNames(names: String...) {
* for name in names {
* println("Hello, \(name)")
* }
* }

* // 2 names
* helloWithNames("Mr. Bryan", "Mr. Lattner")
* // Hello, Mr. Bryan
* // Hello, Mr. Lattner

* // 4 names

* helloWithNames("Batman", "Superman", "Wonder Woman", "Catwoman")
* // Hello, Batman
* // Hello, Superman
* // Hello, Wonder Woman
* // Hello, Catwoman

The catch here is to remember that it is **possible to pass in 0 values**, just like it is possible to pass in an empty array, so don’t forget to check for the empty array if needed:

* func helloWithNames(names: String...) {
*  if names.count > 0 {
* for name in names {
* println("Hello, \(name)")
* }
* } else {
* println("Nobody here!")
* }
* }

* helloWithNames()
* // Nobody here!

*/
//----- Example 1------
func myFriendNames(friendName:String...){
    for name in friendName{
    print("I like \(name) the most ")
    }
}
myFriendNames("Michelle","Chi")
myFriendNames("Lan","Chrissy","FiFi","Lala")

//-------- Example 2--------
func myShoesCollection(totalShoes:Int...){
    if totalShoes.count > 0 {
        for shoe in totalShoes {
        print("hi,\(shoe)")
        }
        } else{
        print("no shoe")
        }
    
    }

 myShoesCollection()
/*:
## Inout Parameters

With inout parameters, you have the ability to manipulate external variables (aka pass by reference):

* var name1 = "Mr. Bryan"
* var name2 = "Mr. Abrash"

* func nameSwap(inout name1: String, inout name2: String) {
* let oldName1 = name1
* name1 = name2
* name2 = oldName1
* }

* nameSwap(&name1, &name2)

* name1
* // Mr. Abrash

* name2
* // Mr. Bryan

This can be used for doing error handling in Swift. Check out this amazing article on the subject. [Swift Programming Language Book on the topic.](http://owensd.io/2014/08/22/error-handling-take-two.html)

*/
var firstName = "Tho"
var lastName = "Dang"
func swapForFun(inout firstName:String, inout lastName:String ){
let newName = firstName
    firstName = lastName
    lastName = newName
}
swapForFun(&firstName, &lastName )
firstName
lastName
/*:
## Generic Parameter Types

I’m not going to get too much into generics in this assignment, but here is a very simple example for how you can make a function accept parameters of different types while making sure that both parameters are of the same type: I really recommend you taking the time to read [Generic Programming in Swift.](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html)

* func valueSwap<T>(inout value1: T, inout value2: T) {
* let oldValue1 = value1
* value1 = value2
* value2 = oldValue1
* }

* var name1 = "Mr. Bryan"
* var name2 = "Mr. Abrash"

* valueSwap(&name1, &name2)

* name1 // Mr. Abrash
* name2 // Mr. Bryan

* var number1 = 2
* var number2 = 5

* valueSwap(&number1, &number2)

* number1 // 5
* number2 // 2
*/

/*:
## Variable Parameters

Parameters that are passed to function are constant. Meaning, that can't be changed within the scope of the function. If you would like to change that behaviour, you need to use the **var** keyword for your parameters:

* var name = "Mr. Bryan"

* func appendNumbersToName(var name: String, #maxNumber: Int) -> String {
* for i in 0..<maxNumber {
* name += String(i + 1)
* }
* return name
* }

* appendNumbersToName(name, maxNumber:5)
*  // Mr. Bryan 12345

name

* // Mr. Bryan

Note that this is different than an inout parameter — variable parameters do not change the external passed-in variable!

*/


/*:

## Functions as Parameters
    In Swift, funtions can be passed around just like variables, As an example, a function cna have another function passed in as a parameter:

* func luckyNumberForName(name: String, #lotteryHandler: (String, Int) -> String) -> String {
* let luckyNumber = Int(arc4random() % 100)
* return lotteryHandler(name, luckyNumber)
* }

* func defaultLotteryHandler(name: String, luckyNumber: Int) -> String {
* return "\(name), your lucky number is \(luckyNumber)"
* }

* luckyNumberForName("Mr. Bryan", lotteryHandler: defaultLotteryHandler)
* // Mr. Bryan, your lucky number is 38

*/


/*:

## Access Controls

Swift has three levels of access controls:

**Public** access enables entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use public access when specifying the public interface to a framework.

**Internal** access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.

**Private** access restricts the use of an entity to its own defining source file. Use private access to hide the implementation details of a specific piece of functionality.

By default, every function and variable is internal — if you want to change that, you have to use the private or public keyword in front of every single method and variable:


* public func myPublicFunc() {

* }

* func myInternalFunc() {

* }

* private func myPrivateFunc() {

* }

* private func myOtherPrivateFunc() {

* }

*/
