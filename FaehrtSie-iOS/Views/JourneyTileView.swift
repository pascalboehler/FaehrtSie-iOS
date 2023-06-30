//
//  JourneyTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct JourneyTileView: View {
    
    @State var journey: Journey
    
    var body: some View {
        Text(journey.name)
    }
}

struct JourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTileView(journey: Journey(id: 1, name: "hi", departurTime: Date.now, arrivalTime: Date.now, vehicleType: Vehicle.Ferry, vehicleId: 73, startStation: "Test", endStation: "Huhu", isDelayed: false, delay: 0))
    }
}
