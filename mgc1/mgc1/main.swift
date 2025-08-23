//
//  main.swift
//  mgc1
//
//  Created by Rabia Yolcu on 13.08.2025.
//

import Foundation

var greetings : String = "Hello, World!"
print (greetings)
greetings = "good bye"
print (greetings)

//let
var greetings2 = "Hello, World"
greetings2 = "good bye" //let değişmezdir
print (greetings)

var age : Int = 25
var isStudent : Bool = true
isStudent.toggle() //mevcut değeri ters çevirir
var height : Double = 1.80

greetings = "/(age)"
print (greetings)

height = Double(age)
print (height)

let mod = age % 4
print (mod)

var tupleExample: (String, String, Int, Bool) = ("Ahmet", "Ali", 50, true)
var tupleExample2: (String, Int) = ("Mehmet", 50)

//sıralı ve aynı eleman birden fazla durabilir
var array1 : [String] = ["a", "b", "c"]
array1.append("d")
array1.remove(at: 2)
print (array1)

//sırasız ve bir tane bulunabilir
var set1: Set<String> = ["a", "b", "c"]
set1.insert("d")
set1.remove("c")
print(set1)

var dictionary1 : [String: Int] = ["a": 1, "b": 2, "c": 3]
dictionary1["d"] = 4
dictionary1["c"] = 5
print (dictionary1)

var array1Result = [String]()
for item in array1 {
    if item == "c" {
        break
    }
    let itemUpperCased = item.uppercased()
    array1Result.append(itemUpperCased)
}

array1 = array1Result
print (array1)

var ages : [Int] = []

repeat {
    age += 1
    ages.append(age)
} while age < 30
print (ages)
            
//map her bir item a tek tek gidiyor
//filter arasından bi kaç seçim yaparak süzerek getiriyor
//reduce çoklu olan bi şeyi teke indiriyor
//sort belli düzenlemeyle sıralı hale getiriyor
            
array1 = array1.map { item in //$0 itere edeceği itemlar tek tek demek
    item.uppercased()
}
print (array1)

array1 = array1.filter { item in
    item == "c"
}
print (array1)

var array2: [Int] = [1, 2, 3, 4, 5]
age = array2.reduce(0){result, number in
    result + number
}
//aynısı age = array2.reduce(0, +

array2 = array2.sorted(by: >)

var sum: Int = 0
for (index,item) in array2.enumerated() {
    if index == 2 || index == 3{
        sum += item
    }
}
print (sum)

func generateMessage(with letter: String) -> String {
    return "\(letter) :D, geldi"
}

for item in array1 {
    let generatedMessage = generateMessage(with: item)
    print (generatedMessage.uppercased())
}


            


















