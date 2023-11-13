//
//  EntryFormView.swift
//  Golnaz_Flights
//
//  Created by Golnaz Chehrazi on 2023-06-13.
//

import SwiftUI

struct EntryFormView: View {
    @EnvironmentObject var flightsListDS : FlightsDataSource
    @EnvironmentObject var user : User
    @State private var arrivalFromUI : String = ""
    @State private var customerNameFromUI : String = ""
    @State private var passportNumberFromUI : String = ""
    @State private var selectedDateFromUI = Date()
    @State private var errorMsg : String? = nil
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Flights Leaving \(self.flightsListDS.getFirstDeparture())").font(.title).foregroundColor(Color.blue)
            //Image("ATL").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
            Form{
                Section{
                    Picker("Arrival Airport:", selection:self.$arrivalFromUI){
                        Text("-----------").tag("")
                        ForEach(flightsListDS.getArrivals(), id: \.self) {
                            arr in
                            Text(arr).tag(arr)
                        }
                        
                    }.pickerStyle(.automatic)
                }
                Section(header: Text("Flight Details")){
                    //Text("\(flightsListDS.showInfobyArrival(arrival: self.arrivalFromUI))")
                    if let fli = flightsListDS.getFlightByArr(arr: self.arrivalFromUI){
                        HStack{
                            Text("Flight Number:")
                            Spacer()
                            Text("\(fli.flightNumber)")
                        }
                        HStack{
                            Text("Operated By:")
                            Spacer()
                            Text("\(fli.carrier)")
                        }
                        HStack{
                            Text("Price:")
                            Spacer()
                            Text("$\(String(format: "%.2f", fli.price))")
                        }
                    }
                }
                
                Section{
                    
                    let minDate = Date()
                    DatePicker("Select a Date", selection: $selectedDateFromUI, in: minDate..., displayedComponents: .date)
                        .datePickerStyle(.automatic)
                    
                    TextField("Enter customer name", text: self.$customerNameFromUI).textFieldStyle(.roundedBorder).autocorrectionDisabled(true).autocapitalization(.none).keyboardType(.default)
                    TextField("Enter passport number", text: self.$passportNumberFromUI).textFieldStyle(.roundedBorder).autocorrectionDisabled(true).autocapitalization(.none).keyboardType(.asciiCapable)
                    
                }
                
            }
            //.frame(height: 450)
            //Spacer()
            if let msg = self.errorMsg{
                Text("Error: \(msg)").bold().foregroundColor(Color.red)
            }
            Button(action:{
                if(self.arrivalFromUI.isEmpty){
                    errorMsg = "selcet the arrival city"
                    return
                }
                if(customerNameFromUI.isEmpty){
                    errorMsg = "Enter customer name"
                    return
                }
                if(passportNumberFromUI.isEmpty){
                    errorMsg = "Enter passport number"
                    return
                }
                if let fli = flightsListDS.getFlightByArr(arr: self.arrivalFromUI){
                    let newReservation:Reservation = Reservation(customerName: customerNameFromUI, passportNumber: passportNumberFromUI, date: selectedDateFromUI, flightNumber: fli.flightNumber, depaurture: fli.departure, arrival: fli.arrival, price: fli.price)
                    self.user.addReservation(newReservation: newReservation)
                    self.showAlert = true
                }
            }){
                Text("Confirm Reservation")
            }.buttonStyle(.borderedProminent).padding()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Successful Reservation"),
                            message: Text("Thanks for your purchase!"),
                            dismissButton: .default(Text("OK")){
                                self.resetForm()
                            }
                        )
                    }
            Spacer()
        }
        .padding()
        .navigationTitle("Add Reservation")
    }
    
    func resetForm(){
        self.arrivalFromUI = ""
        self.selectedDateFromUI = Date()
        self.customerNameFromUI = ""
        self.passportNumberFromUI = ""
        self.errorMsg = nil
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView()
    }
}
