//
//  Golnaz_FlightsApp.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import SwiftUI

@main
struct Golnaz_FlightsApp: App {
    //refer to the singleton instance of workDataSource class
    var flightsDataSource : FlightsDataSource = FlightsDataSource.getInstance()
    var user : User = User()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(flightsDataSource).environmentObject(user)
        }
    }
}
