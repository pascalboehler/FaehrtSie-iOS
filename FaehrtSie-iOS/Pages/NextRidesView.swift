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
            ScrollView {
                ForEach(dataHandler.userJourneys) { item in
                    JourneyTileView(journey: item)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            .navigationTitle(Text("Next rides"))
            .toolbar {
                NavigationLink(destination: SelectJourneyView()) {
                    Image(systemName: "plus.app")
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
    }
}

struct NextRidesView_Previews: PreviewProvider {
    static var previews: some View {
        NextRidesView().environmentObject(DataHandler())
    }
}
