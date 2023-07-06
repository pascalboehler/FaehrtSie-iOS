//
//  SearchJourneyTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 04.07.23.
//

import SwiftUI

struct SearchJourneyTileView: View {
    
    @State var startStation: String = ""
    @State var selectedStartDate: Date = Date.now
    
    @State var endStation: String = ""
    @State var selectedEndDate: Date = Date.now
    
    @State var isDeparture = false
    
    @EnvironmentObject var networkHandler: NetworkHandler
    
    var body: some View {
        VStack {
            VStack {
                TextField("From...", text: $startStation)
                    .onTapGesture {
                        startStation = ""
                    }
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 5, trailing: 15))
                //Text("Ernst-August-Schleuse")
                Divider()
                TextField("To...", text: $endStation)
                    .onTapGesture {
                        endStation = ""
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                
                Divider()
                DatePicker("Departure", selection: $selectedStartDate)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
            }
            .cornerRadius(25.0)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Design.stdCorpColor, lineWidth: 2)
            )
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            
            // FIXME: API is called before this Link is activated => should not happen!!!
            NavigationLink (destination: SelectJourneyView(startStation: startStation, selectedStartDate: selectedStartDate, endStation: endStation)) {
                Text("Find journey")
                    .foregroundColor(.black)
            }
            .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
            .background(Design.stdCorpColor)
            .cornerRadius(14)
        }
    }
}

struct SearchJourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchJourneyTileView().environmentObject(NetworkHandler())
    }
}
