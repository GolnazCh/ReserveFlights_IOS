//
//  FlightsInformation.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import Foundation
class FlightsDataSource: ObservableObject{
    @Published var flightList : [Flight] = [Flight(departure: "ATL", arrival: "MAD", distance: 6943.70, flightNumber: "AM316", carrier: "Aeromexico"),Flight(departure: "ATL", arrival: "AUS", distance: 1514.00, flightNumber: "WS6463", carrier: "Westjet"),Flight(departure: "ATL", arrival: "HKG", distance: 12538.51, flightNumber: "KL662", carrier: "KLM"),Flight(departure: "ATL", arrival: "LAX", distance: 1945, flightNumber: "DL123", carrier: "Delta Airlines"), Flight(departure: "ATL", arrival: "JFK", distance: 760, flightNumber: "AS456", carrier: "Alaska Airlines"), Flight(departure: "ATL", arrival: "ORD", distance: 587, flightNumber: "UA789", carrier: "United Airlines"), Flight(departure: "ATL", arrival: "DCA", distance: 547, flightNumber: "NK453", carrier: "Sprit Airlines")]
    
    //singleton instance
    private static var shared : FlightsDataSource?
    
    static func getInstance() -> FlightsDataSource{
        if (shared == nil){
            shared = FlightsDataSource()
        }
        
        return shared!
    }
    
    func addNewFlight(_ newFlight: Flight){
        self.flightList.append(newFlight)
    }
    
    func getArrivals() -> [String]{
        var arrCities : [String] = [String]()
        for fli in self.flightList{
            if(!arrCities.contains(where: {$0 == fli.arrival})){
                arrCities.append(fli.arrival)
            }
        }
        return arrCities.sorted()
    }
    
    func getFirstDeparture()->String{
        return self.flightList.first?.departure ?? "unknown"
    }
    
    func showInfobyArrival(arrival: String)->String{
        var result : String = ""
        for fli in self.flightList{
            if(fli.arrival == arrival){
                result = """
                Flight Number: \(fli.flightNumber)
                Operated By: \(fli.carrier)
                Price: $\(String(format: "%.2f", fli.price))
                """
            }
        }
        return result
    }
    
    func getFlightByArr(arr: String)-> Flight?{
        for fli in self.flightList{
            if(fli.arrival == arr){
                return fli
            }
        }
        return nil
    }
    
}
