//
//  main.swift
//  mgc2.1
//
//  Created by Rabia Yolcu on 20.08.2025.
//

import Foundation

// kullanıcı emir girişi yapacak fon hisse satın alacak
/* not: solid in s si singular her ekranın objenin birbirinden ayrı işleri olmalı
   iki iş aynı yerde yapılmamalı*/

struct emirElemani{
    let isim: String
    let fiyat: Double
}

protocol emirIslemi {
    
    var baslik: String{ get }
    
    var toplamTutar : Double { get set }
    
    var yeniFiyat : Double? { get }
    
    var emirElemani: emirElemani { get set }
    
    func fiyatGuncelle(_ yeniFiyat: Double)
    
    func adetBelirle(_ adet: Int)
    
    func emriGonder()
    
    //sadece kriptoda
    func komisyonEkle(_ kom: Double)
    
    //sadece hissede
    func tarihEkle(_ date: Date)
    
}

extension emirIslemi {
    func komisyonEkle(_ kom: Double) {
    }
    
    func tarihEkle(_ date: Date) {
    }
}

class kriptoEmirIslemi: emirIslemi {
    
    var baslik: String{
        return "Kripto Emri Giriniz."
    }
    
    var toplamTutar : Double = 0
    
    private(set) var yeniFiyat : Double?
    
    var emirElemani: emirElemani
    
    init(emirElemani: emirElemani) {
        self.emirElemani = emirElemani
    }
    
    func fiyatGuncelle(_ yeniFiyat: Double){
        print("yeni fiyat geldi. \(yeniFiyat)")
        self.yeniFiyat = yeniFiyat
    }
    
    func adetBelirle(_ adet: Int){
        print("adet geldi. \(adet)")
        toplamTutar += Double(adet) * (yeniFiyat ?? emirElemani.fiyat)
    }
    
    func komisyonEkle(_ kom: Double){
        toplamTutar += kom 
    }
    
    func emriGonder(){
        print("emir gidiyor. bu da tutar: \(toplamTutar)")
    }
    
}

class hisseEmirIslemi: emirIslemi {
    
    var baslik: String{
        return "Hisse Emri Giriniz."
    }
    
    var toplamTutar : Double = 0
    
    private(set) var yeniFiyat : Double?
    
    var emirElemani: emirElemani
    
    init(emirElemani: emirElemani) {
        self.emirElemani = emirElemani
    }
    
    func fiyatGuncelle(_ yeniFiyat: Double){
        print("yeni fiyat geldi. \(yeniFiyat)")
        self.yeniFiyat = yeniFiyat
    }
    
    func adetBelirle(_ adet: Int){
        print("adet geldi. \(adet)")
        toplamTutar += Double(adet) * (yeniFiyat ?? emirElemani.fiyat)
    }
    
    func tarihEkle(_ date: Date){
        print("tarih geldi. \(date)")
    }
    
    func emriGonder(){
        print("emir gidiyor. bu da tutar: \(toplamTutar)")

    }
    
}

class Ekran {
    
    func sayfaAcildi(){
        print(String(describing: self) + ": Açıldı")
    }
    
    func sayfaKapandi(){
        print(String(describing: self) + ": Kapandı")
    }
}

class emirGirişEkranı: Ekran {
    
    var emirIslemi: emirIslemi?
    
    override func sayfaAcildi() {
        super.sayfaAcildi()
    }
    
    override func sayfaKapandi() {
        super.sayfaKapandi()
    }
    
    func sayfaYenileme(){
        print("sayfa güncellendi.")
    }
    
    func fiyatGuncelle(_ fiyat: Double ){
        emirIslemi?.fiyatGuncelle(fiyat)
    }
    
    func adetGir(_ adet: Int){
        emirIslemi?.adetBelirle(adet)
    }
    
    func tarihEkle(_ date: Date){
        if let emirIslemi, emirIslemi is  hisseEmirIslemi{
            emirIslemi.tarihEkle(date)
        }
        else{
            //fatalError("Kriptoda tarih yok.")
        }
    }
    
    func komisyonGirisi(_ kom: Double ){
        if let emirIslemi, emirIslemi is  kriptoEmirIslemi{
            emirIslemi.komisyonEkle(kom)
        }
        else{
            //fatalError("Hissede komisyon yok.")
        }
    }
    
    func emirGirisi(){
        emirIslemi?.emriGonder()
    }
    
}

let hisseEmirElemani : emirElemani = .init(isim: "Aselsan", fiyat: 170.40)
let hisseEmirIşlemi: emirIslemi = hisseEmirIslemi(emirElemani: hisseEmirElemani)
let hisseEkrani = emirGirişEkranı()
hisseEkrani.emirIslemi = hisseEmirIşlemi

hisseEkrani.sayfaAcildi()
hisseEkrani.fiyatGuncelle(165.50)
hisseEkrani.adetGir(100)
hisseEkrani.tarihEkle(Date())
hisseEkrani.komisyonGirisi(10)
hisseEkrani.emirGirisi()

let kriptoEmirElemani : emirElemani = .init(isim: "btc", fiyat: 3452246.40)
let kriptoEmirIşlemi: emirIslemi = hisseEmirIslemi(emirElemani: kriptoEmirElemani)
let kriptoEkrani = emirGirişEkranı()
kriptoEkrani.emirIslemi = kriptoEmirIşlemi

kriptoEkrani.sayfaAcildi()
kriptoEkrani.fiyatGuncelle(3452249.50)
kriptoEkrani.adetGir(5)
kriptoEkrani.tarihEkle(Date())
kriptoEkrani.komisyonGirisi(10)
kriptoEkrani.emirGirisi()
