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
            VStack {
                ForEach(dataHandler.userJourneys) { item in
                    JourneyTileView(journey: item)
                }
            }
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
        NextRidesView()
    }
}
