//
//  ContentView.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user : User
    @EnvironmentObject var flightsDataSource : FlightsDataSource
    var body: some View {
        NavigationView{
            VStack {
                TabView{
                    EntryFormView()
                    //.environmentObject(user)
                        .tabItem{
                        Text("Reservation")
                        Image(systemName: "airplane.departure")
                    }
                    ReservationHistoryView()
                    //.environmentObject(user)
                        .tabItem{
                            Text("History")
                            Image(systemName: "clock.fill")
                        }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
