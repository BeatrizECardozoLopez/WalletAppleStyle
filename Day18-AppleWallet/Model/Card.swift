//
//  Card.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 22/8/24.
//

import Foundation


struct Card: Identifiable {
    
    var id = UUID()
    var name: String
    var type: CardType
    var number: String
    var expirationDate: String
    var image: String {
        return type.rawValue
    }
    
}


enum CardType: String{
    case visa // = "visa" is the rawValue that returns
    case mastercard
    case amex
    case chase
    case discover
}


#if DEBUG

var cards = [
    Card(name: "John Doe", type: .visa, number: "1234 5678 9123 4567", expirationDate: "09/26"),
    Card(name: "Jane Smith", type: .mastercard, number: "9876 5432 1098 7654", expirationDate: "05/25"),
    Card(name: "Bob Johnson", type: .amex, number: "2468 1357 8024 6913", expirationDate: "12/28"),
    Card(name: "Alice Williams", type: .chase, number: "5555 1234 5678 9999", expirationDate: "03/27"),
    Card(name: "David Brown", type: .discover, number: "7777 8888 9999 1111", expirationDate: "08/29"),
//    Card(name: "Sarah Davis", type: .mastercard, number: "1111 2222 3333 4444", expirationDate: "10/25"),
//    Card(name: "Michael Miller", type: .visa, number: "4444 5555 6666 7777", expirationDate: "11/26"),
//    Card(name: "Linda Wilson", type: .amex, number: "9876 5432 1098 7654", expirationDate: "07/26"),
//    Card(name: "Tom Taylor", type: .chase, number: "2222 3333 4444 5555", expirationDate: "02/25"),
//    Card(name: "Emily Martinez", type: .visa, number: "1234 5678 9123 4567", expirationDate: "06/26"),
//    Card(name: "Chris Anderson", type: .discover, number: "7777 8888 9999 1111", expirationDate: "04/27"),
//    Card(name: "Olivia Garcia", type: .mastercard, number: "5555 1234 5678 9999", expirationDate: "03/27"),
//    Card(name: "Kevin Rodriguez", type: .chase, number: "2468 1357 8024 6913", expirationDate: "01/30"),
//    Card(name: "Rachel King", type: .amex, number: "9876 5432 1098 7654", expirationDate: "09/26"),
//    Card(name: "Justin Lee", type: .visa, number: "1111 2222 3333 4444", expirationDate: "10/26"),
//    Card(name: "Megan Scott", type: .discover, number: "1234 5678 9123 4567", expirationDate: "12/27"),
//    Card(name: "Brandon Perez", type: .mastercard, number: "2222 3333 4444 5555", expirationDate: "07/25"),
//    Card(name: "Hannah Nguyen", type: .visa, number: "4444 5555 6666 7777", expirationDate: "08/26"),
//    Card(name: "Aiden Cooper", type: .amex, number: "7777 8888 9999 1111", expirationDate: "06/28"),
]
#endif
