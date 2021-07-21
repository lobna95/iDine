//
//  CheckoutView.swift
//  iDine
//
//  Created by Lobna Shaheen on 18/07/2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    @State private var showingPaymentAlert = false
    
    let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    @State private var pickupTime = "Now"
    
    var body: some View {
        Form{
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            if addLoyaltyDetails{
            TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            Section{
                Picker("When to Deliver?", selection: $pickupTime){
                    ForEach(pickupTimes, id: \.self){
                        Text($0)
                    }
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))

            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
