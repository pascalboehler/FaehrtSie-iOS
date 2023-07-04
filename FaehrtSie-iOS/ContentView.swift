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
                
                CurrentJourneyTileView(journey: dataHandler.getNextJourney()!)
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5))
                
                // TODO: Put this in own view + Add a way to trigger search correctly
                SearchJourneyTileView()
                    .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                
            }
            
            .navigationTitle(Text("Home"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataHandler())
    }
}
