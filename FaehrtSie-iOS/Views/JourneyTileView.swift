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
        VStack {
            Text("\(journey.mot.type.rawValue) \(journey.mot.lineNum)")
            Text(journey.name)
        }
        
    }
}

struct JourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTileView(journey: Journey(id: 1, name: "hi", departurTime: Date.now, arrivalTime: Date.now, mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Hello"), startStation: "Test", endStation: "Huhu", isDelayed: false, delay: 0))
    }
}
