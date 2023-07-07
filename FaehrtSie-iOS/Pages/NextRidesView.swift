//
//  NextRidesView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct NextRidesView: View {
    
    @EnvironmentObject var dataHandler: DataHandler
    
    var body: some View {
        NavigationStack {
            if (!dataHandler.userJourneys.isEmpty) {
                List {
                    ForEach(dataHandler.userJourneys) { item in
                        JourneyTileView(journey: item)
                    }
                    .onDelete { index in
                        print("hi")
                        
                        guard let indexInt = index.first else {
                            print("HELO ME")
                            return
                        }
                        
                        dataHandler.deleteJourney(indexInt)
                        
                        print(dataHandler.userJourneys.count)
                        
                        print("ho")
                    }
                    .background(.clear)
                    .padding(EdgeInsets(top: 20, leading: -10, bottom: 10, trailing: -10))
                }
                .listStyle(.plain)
                .navigationTitle(Text("Next rides"))
            } else {
                ErrorFerryTileView(errorDescription: "It's so empty here:(\n\nJump to the Home Screen to add a new journey")
                    .navigationTitle(Text("Next rides"))
            }
            
            //.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
        }
    }
}

struct NextRidesView_Previews: PreviewProvider {
    static var previews: some View {
        NextRidesView().environmentObject(DataHandler())
    }
}
