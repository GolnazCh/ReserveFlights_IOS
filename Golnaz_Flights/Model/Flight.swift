//
//  Flight.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import Foundation
class Flight:Identifiable{
    var id : UUID = UUID()
    var departure : String
    var arrival : String
    var distance : Double
    var flightNumber : String
    var carrier : String
    
    var price : Double{
        return 100 + (self.distance * 0.12)
    }
    
    init(departure: String, arrival: String, distance: Double, flightNumber: String, carrier: String) {
        self.departure = departure
        self.arrival = arrival
        self.distance = distance
        self.flightNumber = flightNumber
        self.carrier = carrier
    }
    
   
}
