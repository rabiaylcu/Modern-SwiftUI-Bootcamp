//
//  main.swift
//  mgcOdev1.2
//
//  Created by Rabia Yolcu on 22.08.2025.
//

import Foundation

func calculator(_ a: Double, _ b: Double, operation: String) -> Double? {
    switch operation {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        return b != 0 ? a / b : nil
    default:
        return nil
    }
}

if let result = calculator(10, 5, operation: "-") {
    print("Sonuç: \(result)")
} else {
    print("Geçersiz işlem")
}


print("-----")

//map her bir item a tek tek gidiyor
//filter arasından bi kaç seçim yaparak süzerek getiriyor
//reduce çoklu olan bi şeyi teke indiriyor
//sort belli düzenlemeyle sıralı hale getiriyor

let sayilar = [3, 10, 7, 25, 18, 5, 42, 9]

let mapSonuc = sayilar.map { $0 + 1 }
print("map sonucu: \(mapSonuc)")

let filterSonuc = sayilar.filter { $0 % 2 == 0 }
print("filter sonucu: \(filterSonuc)")

let reduceSonuc = sayilar.reduce(0) { $0 + $1 }
print("reduce sonucu (toplam): \(reduceSonuc)")

let sortedSonuc = sayilar.sorted { $0 < $1 }
print("sorted sonucu: \(sortedSonuc)")
