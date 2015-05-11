//: ## 1 @SheffieldSwift 19 May 2015
//: ### Swift is an interesting new language with some interesting features.
//: I'll be discussing a few of those today
//: * Mutability versus immutability
//: * Difference between Class and Struct instances and why that is important
//: * Optionals
//: * Functions are first class objects in Swift
//: * Enums and associative values
//:   * Possibly also pattern matching on the enum and associated values
//:   * The Result type

//: ### Swift is strictly typed and does type inference
var str = "Hello, playground"

//: str is declared as a variable which means its value can be changed.
str = "@SheffieldSwift says hello back"

//: Variables can't have their type changed from the type determined when they were declared.
// str = 3

//: #### So what is going on here?
//: Swift is stricly typed so the compiler gives every variable or constant a specific type, the type cannot be changed after the variable is declared. This is different to ruby where a variable can be reassigned to an object of any type. If a type isn't specified but the type can be inferred from the assigned value when the variable or constant is declared then the compiler gives the variable or constant a type. If the type cannot be inferred the compiler will emit an error message.
//: So the type of str is determined by the compiler at the point of decleration at compile time and is determined to be a string.
println("str type is: \(str.dynamicType)")

//: #### We can specify the type in the decleration
let newString:String = "Hello lovely people"

//: #### The types of str and newString are the same
println("newString type is: \(newString.dynamicType)")

//: #### Type inference works for integers to
let myNum = 2
println("\(myNum.dynamicType)")

//: We can modify str
let c = str.removeAtIndex(str.startIndex)
str.append(c)

//: but can we modify newString

// newString.append(c)
println(newString)

//: So newString is a constant. newString is also a struct instance, not an object instance and I'll explain about why that is important later on.

//: A variable or a constant does not have to have an initial value as long as the variable is assigned a value before it is accessed. In this case though the decleration requires the type to be specified. The compiler will not attempt to look ahead to infer the type from later information.

// let theString
let theString:String

if str == "Hello, playground" {
    theString = "Hello, playground"
}
else {
    theString = "Help me"
}

println(theString)
//: #### Difference between Struct and Object instances.

class Person {
    var firstName = ""
    let lastName:String
    
    init(firstName:String, lastName:String = "Serious") {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printName() {
        println("\(firstName)  \(lastName)")
    }
}

let someone = Person(firstName: "Bluey")

//: So what happens when we try to change the person's name:
someone.firstName = "John"
// someone.lastName = "SemiSerious"
someone.printName()

//: ##### Hey!. someone has been declared as a constant but we change someone's name.

struct City {
    var name = ""
    let country:String
    var population:Int
    
    init(cityName:String, country:String = "UK", population:Int) {
        name = cityName
        self.country = country
        self.population = population
    }
    
    func printCity() {
        println("City: \(name) in \(country) has population: \(population)")
    }
}

let myCity = City(cityName: "Sheffield", population: 525000)
// myCity.name = "Chestrerfield"

myCity.printCity()

//: So what is going on here. The difference is the difference in how Swift treats Struct or Class objects.

