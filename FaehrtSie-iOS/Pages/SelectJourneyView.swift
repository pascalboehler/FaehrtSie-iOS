//
//  SelectJourneyView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct SelectJourneyView: View {
    
    @State var startStation: String = ""
    @State var selectedStartDate: Date = Date.now
    
    @State var endStation: String = ""
    @State var selectedEndDate: Date = Date.now
    
    @State var isDeparture = false
    
    @EnvironmentObject var dataHandler: DataHandler
    
    @Environment (\.dismiss) var dismiss
    
    @State var isProcessing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    ForEach(dataHandler.userJourneys) { item in
                        JourneyTileView(journey: item)
                            .onTapGesture {
                                if (isProcessing) {
                                    return
                                }
                                isProcessing = true
                                dataHandler.addJourney(item)
                                dismiss()
                            }
                    }
                }
                .padding(5)
            }
            .navigationTitle(Text("Results"))
        }
        
    }
}

struct SelectJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJourneyView().environmentObject(DataHandler())
    }
}
