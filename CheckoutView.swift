//
//  CheckoutView.swift
//  Idine
//
//  Created by Macbook Pro on 31/12/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "Mobile Money"]
    let tipAmounts = [10, 15, 20, 25, 30, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section{
                Picker("How do you want to pay?",selection:
                    $paymentType) {
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                
                Toggle("Want to pay with Mobile Money?",
                       isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails{
                    TextField("Enter your mobile money number",
                              text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")){
                Picker("Percentage", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self) {
                    Text("\($0)%")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("TOTAL: \(totalPrice)")
            .font(.largeTitle)
        ) {
            Button("Confirm Order"){
                showingPaymentAlert.toggle()
            }
        }
    }
      .navigationTitle("Payment")
      .navigationBarTitleDisplayMode(.inline)
      .alert(isPresented: $showingPaymentAlert) {
          Alert(title: Text("Order confirmed"), message:
                    Text("Your total was \(totalPrice)"),
                dismissButton: .default(Text("OK")))
         }
      }
   }

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
