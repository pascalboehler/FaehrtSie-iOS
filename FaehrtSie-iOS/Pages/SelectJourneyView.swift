//
//  SelectJourneyView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct SelectJourneyView: View {
    
    @State var startStation: String = "Ernst-August-Schleuse"
    @State var selectedStartDate: Date = Date.now
    
    @State var endStation: String = "Landungsbrücken"
    @State var selectedEndDate: Date = Date.now
    
    @State var isDeparture = false
    
    @EnvironmentObject var dataHandler: DataHandler
    @ObservedObject var networkHandler: NetworkHandler = NetworkHandler()
    
    @Environment (\.dismiss) var dismiss
    
    @State var isProcessing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if (!networkHandler.isOffline && !networkHandler.searchResults.isEmpty) {
                    ScrollView {
                        ForEach(networkHandler.searchResults) { item in
                            JourneyTileView(journey: item)
                                .onTapGesture {
                                    if (isProcessing) {
                                        return
                                    }
                                    isProcessing = true
                                    dataHandler.addJourney(item)
                                    dismiss()
                                }
                                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                        }
                    }
                    
                    .padding(5)
                } else if (!networkHandler.isOffline) {
                    // TODO: Make this beautiful
                    Text("No ferries found :'(")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(20)
                }
                    
                else {
                    // TODO: Make this beautiful
                    Text("You are offline!\nCannot search for departures online")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(20)
                }
                
            }
            .overlay(content: {
                if (self.networkHandler.isFetching) {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            })
            .navigationTitle(Text("Results"))
        }.onAppear {
            networkHandler.getScheduleForCurrentDay()
            //networkHandler.searchForJourney(selectedStartDate, stationDep: startStation, stationArr: endStation)
        }
        
    }
}

struct SelectJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJourneyView().environmentObject(DataHandler())
    }
}
