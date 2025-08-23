//
//  main.swift
//  mgcOdev1
//
//  Created by Rabia Yolcu on 22.08.2025.
//

import Foundation

var nameSurname: String = "Rabia Yolcu"
var age: Int = 21
var city: String = "Ankara"
var phoneNumber: String? = nil
var isStudent: Bool = true
var gpa: Double = 3.35

func bilgiKartiYazdir(){
    print("--- Kişisel Bilgi Kartım ---")
    print("Adım Soyadım: \(nameSurname)")
    print("Yaşım: \(age)")
    print("Şehrim: \(city)")

    if let phone = phoneNumber {
        print("Telefon: \(phone)")
    } else {
        print("Telefon numarası yok.")
    }
    print("Öğrencilik durumum: \(isStudent)")
    isStudent.toggle()
    print("2026 Haziran sonrası öğrecilik durumum: \(isStudent)")
    print("Güncel ortalamam: \(gpa)")
}

bilgiKartiYazdir()

