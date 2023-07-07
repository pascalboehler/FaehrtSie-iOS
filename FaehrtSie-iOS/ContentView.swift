//
//  ContentView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 26.06.23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @EnvironmentObject var dataHandler: DataHandler
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                if let currJourney = dataHandler.getNextJourney() {
                    CurrentJourneyTileView(journey: currJourney)
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5))
                        .onTapGesture {
                            print(dataHandler.userJourneys.first!.arrivalTime)
                        }
                }
                
                SearchJourneyTileView()
                    .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                
            }
            .toolbar(dataHandler.userJourneys.isEmpty ? .visible : .hidden)
            .navigationTitle(Text("Home"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataHandler())
    }
}
