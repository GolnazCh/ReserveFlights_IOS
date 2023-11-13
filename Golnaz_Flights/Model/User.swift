//
//  User.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import Foundation
class User: ObservableObject{
    @Published var reservationList :[Reservation] = [Reservation]()
    
    func addReservation( newReservation: Reservation){
        self.reservationList.append(newReservation)
    }
}
