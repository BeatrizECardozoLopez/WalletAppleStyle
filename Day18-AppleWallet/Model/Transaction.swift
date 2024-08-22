//
//  Transaction.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 22/8/24.
//

import Foundation


struct Transaction: Identifiable {
    
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollasign.circle"
}

#if DEBUG

var transactions = [
    Transaction(merchant: "Amazon", amount: 65, date: "2023-10-03", icon: "cart.circle"),
    Transaction(merchant: "Clothing Store", amount: 120.00, date: "2024-08-12", icon: "bag.fill"),
    Transaction(merchant: "Gym Membership", amount: 50.00, date: "2024-08-11", icon: "figure.walk.circle"),
    Transaction(merchant: "Mobile Phone Bill", amount: 80.00, date: "2024-08-10", icon: "iphone.homebutton"),
    Transaction(merchant: "Hardware Store", amount: 37.50, date: "2024-08-09", icon: "hammer.fill"),
    Transaction(merchant: "Dentist", amount: 200.00, date: "2024-08-08", icon: "bandage"),
    Transaction(merchant: "Electricity Bill", amount: 95.00, date: "2024-08-07", icon: "bolt.fill"),
    Transaction(merchant: "Skydiving", amount: 300.00, date: "2024-08-06", icon: "airplane"),
    Transaction(merchant: "Concert Tickets", amount: 150.00, date: "2024-08-05", icon: "music.mic"),
    Transaction(merchant: "Gift Shop", amount: 25.00, date: "2024-08-04", icon: "gift"),
    Transaction(merchant: "Laptop Purchase", amount: 1500.00, date: "2024-08-03", icon: "laptopcomputer"),
    Transaction(merchant: "Car Wash", amount: 20.00, date: "2024-08-02", icon: "car.fill"),
    Transaction(merchant: "Ski Resort", amount: 250.00, date: "2024-08-01", icon: "snow"),
    Transaction(merchant: "Art Supplies", amount: 80.00, date: "2024-07-31", icon: "paintpalette.fill"),
    Transaction(merchant: "Spa Visit", amount: 100.00, date: "2024-07-30", icon: "flame"),
    Transaction(merchant: "Cruise Booking", amount: 1000.00, date: "2024-07-29", icon: "ship.fill"),
    Transaction(merchant: "Fitness Class", amount: 30.00, date: "2024-07-28", icon: "bolt.horizontal.circle"),
    Transaction(merchant: "Bar Tab", amount: 45.00, date: "2024-07-27", icon: "list.bullet"),
    Transaction(merchant: "Home Decor", amount: 150.00, date: "2024-07-26", icon: "house.fill"),
    Transaction(merchant: "Hiking Gear", amount: 60.00, date: "2024-07-25", icon: "heart.circle.fill"),
    Transaction(merchant: "Sushi Takeout", amount: 35.00, date: "2024-07-24", icon: "suit.heart.fill")
]

#endif
