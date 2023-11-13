//
//  ReservationHistoryView.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import SwiftUI

struct ReservationHistoryView: View {
    @EnvironmentObject var flightsListDS : FlightsDataSource
    @EnvironmentObject var user : User
    var body: some View {
        VStack{
            Text("Reservation History").font(.title).foregroundColor(Color.blue)
            List{
                if(user.reservationList.isEmpty){
                    Text("No reservation is done yet!")
                }
                ForEach(user.reservationList){
                    reserve in
                    NavigationLink(destination: ReservationDetailsView(reservation: reserve).environmentObject(self.user))
                    {
                        
                        HStack
                        {
                            Text("\(reserve.customerName)")
                            Spacer()
                            Text("Booking ID: \(reserve.bookingId)")
                        }//HSTACK
                    } //NAvigationLink
                } //ForEACH
                .onDelete {
                    indexSet in
                    user.reservationList.remove(atOffsets: indexSet)
                } //ONDELETE
            } //List
            Spacer()
        }//VSTACK
        .padding()
        //.navigationTitle(Text("Reservation History"))
    }
}

struct ReservationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHistoryView()
    }
}
