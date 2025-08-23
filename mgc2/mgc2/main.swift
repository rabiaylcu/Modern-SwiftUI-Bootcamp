//
//  main.swift
//  mgc2
//
//  Created by Rabia Yolcu on 20.08.2025.
//

import Foundation

// nesne oluşturmak için class enum struct

/* struct : response request model kullanımında, sayfadan sayfaya argüman taşınırken, sabit net yapılarda kullanılır. Hızlı fakat dezavantajı her kopyalamada veriyi tekrar tekrar üretiyor. fakat optimizasyon şu şekilde ki copyonwrite kopyalanır ama doğrudan veri üretmez, kopyalanır o veride bişey değişirse veriyi üretir */

struct Person {
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
   
// mutating eklemen lazım çünkü age değiştiremiyorsun
    mutating func growOlder(){
        age += 1
    }
    
}

class Circle {
    var radius : Double
    
    init(radius : Double) {
        self.radius = radius
    }
    
    init(radius : Double, radiusName : String) {
        self.radius = radius
    }
    
    func area() -> Double {
        return .pi * radius * radius
    }
}

/* struct yapısı kullanıldığında memoryde yeni yerler açar
ama classın memoryde bir tane yeri vardır her instance oluşturduğunuzda
farklı yollarla memorydeki aynı yerlere işaret eder */

// şimdiki örnekte (class) ikinciyi değiştirince birinci de değişecek çünkü aynı dataya gidiyolar

var circle1 = Circle(radius: 5.0)
var circle2 = circle1
circle2.radius = 10.0
print("Circle radius: \(circle1.radius)")
print("Circle 2 radius: \(circle2.radius)")

// struct hızlı, fazla veri, memoryde fazla yük, sabit yapı, inherit vermez
// şimdiki örnekte (struct) ikinciyi değiştirince birinci değişmiyor

var person1 = Person(name: "Ali", age: 30)
var person2 = person1
person2.age = 40
print("Person name: \(person1.name), age: \(person1.age)")
print("Person 2 name: \(person2.name), age: \(person2.age)")

// classların structlara göre en büyük özelliği inheritance alabilirsiniz classta
// eğer classın inherit almasını istemiyorsan final class yazacaksın

class myCircle : Circle {
    
    // o an ihtiyacımız olmayan değişken lazy yapabiliriz
    lazy var person = Person(name: "Rabia", age: 22)
    
    override init(radius: Double) {
        super.init(radius: radius)
    }
    
    override func area() -> Double {
        return .pi * radius
    }
    
}

var circle3 = myCircle(radius: 5.0)
print("Circle3 area: \(circle3.area())")
print(circle3.person) // lazydi bu

// case leri array durumuna getirebiliyoruz
enum Kahve : CaseIterable {
    case Latte
    case turkishCoffee
    case çay
    case cappuccino
}

var kahveler = Kahve.allCases
var benimKahvem : Kahve = .cappuccino

for kahve in kahveler {
    if kahve == .cappuccino {
        print("Benim kahvem \(kahve)")
    }
}

// rawValue kullandık
enum Spor : String {
    case voleybol = "tvf"
    case badminton = "tbf"
    case tenis = "ttf"
    case atletizm = "run"
}

var sporum : Spor = Spor(rawValue: "tbf") ?? .tenis
print(sporum)
