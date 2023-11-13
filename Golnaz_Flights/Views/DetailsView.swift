//
//  ReservationDetailsView.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import SwiftUI

struct ReservationDetailsView: View {
    let reservation : Reservation
    var body: some View {
        VStack(spacing: 10){
            Text("Resrvation Details").font(.title).foregroundColor(.blue).bold()
            List{
                HStack{
                    Text("Customer Name: ")
                    Spacer()
                    Text("\(self.reservation.customerName)")
                }
                HStack{
                    Text("Passport Number: ")
                    Spacer()
                    Text("\(self.reservation.passportNumber)")
                }
                HStack{
                    Text("Date: ")
                    Spacer()
                    Text("\(formatedDate(self.reservation.date))")
                }
                HStack{
                    Text("Departure: ")
                    Spacer()
                    Text("\(self.reservation.depaurture)")
                }
                HStack{
                    Text("Arrival: ")
                    Spacer()
                    Text("\(self.reservation.arrival)")
                }
                HStack{
                    Text("Total Price: ")
                    Spacer()
                    Text("$\(String(format: "%.2f" ,self.reservation.price))")
                }
                HStack{
                    Text("Booking Number:")
                    Spacer()
                    Text("#\(self.reservation.bookingId)")
                }
                //Text(Text(reservation.showInfo()).font(.body).foregroundColor(Color.black)
            }
            Spacer()
        }
        .padding()
    }
    
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

struct ReservationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsView(reservation: Reservation(customerName: "unknown", passportNumber: "unknown", date: Date(), flightNumber: "fli", depaurture: "unknown", arrival: "unknown", price: 0.0))
    }
}
