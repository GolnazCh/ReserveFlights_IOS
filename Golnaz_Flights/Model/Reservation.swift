//
//  Reservation.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import Foundation
class Reservation:Identifiable{
    var id : UUID = UUID()
    var customerName : String
    var passportNumber : String
    var date : Date
    var flightNumber : String
    var depaurture : String
    var arrival : String
    var price : Double
    
    init(customerName: String, passportNumber: String, date: Date, flightNumber: String, depaurture: String, arrival: String, price: Double) {
        self.customerName = customerName
        self.passportNumber = passportNumber
        self.date = date
        self.flightNumber = flightNumber
        self.depaurture = depaurture
        self.arrival = arrival
        self.price = price
    }
    
    var bookingId : String{
        return String(id.uuidString.prefix(5))
    }
    
//    func showInfo()->String{
//        return """
//Customer Name: \(self.customerName)
//Passport Number: \(self.passportNumber)
//Date: \(formatedDate(self.date))
//Departure: \(self.depaurture)
//Arrival: \(self.arrival)
//Total Price: $\(self.price)
//Booking Number: #\(self.bookingId)
//"""
//    }

    func formatedDate(_ date: Date)-> String{
        // Create a DateFormatter instance
        let dateFormatter = DateFormatter()

        // Set the desired date format
        dateFormatter.dateFormat = "yyyy-MM-dd"

        // Format the current date
        let formatDate = dateFormatter.string(from: date)

        return formatDate
    }
    
    
}
