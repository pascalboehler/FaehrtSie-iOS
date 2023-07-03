//
//  ContentView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 26.06.23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var startStation: String = ""
    @State var selectedStartDate: Date = Date.now
    
    @State var endStation: String = ""
    @State var selectedEndDate: Date = Date.now
    
    @State var isDeparture = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    TextField("From...", text: $startStation)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 5, trailing: 15))
                    Divider()
                    TextField("To...", text: $endStation)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    Divider()
                    DatePicker("Departure", selection: $selectedStartDate)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                }
                .cornerRadius(25.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                
                
                NavigationLink (destination: SelectJourneyView()) {
                    Text("Find journey")
                        .foregroundColor(.primary)
                }
                    .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
                    .background(.gray)
                    .cornerRadius(14)
                
            }
            .padding()
            
            Spacer()
            
            .padding()
            .navigationTitle(Text("Home"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
