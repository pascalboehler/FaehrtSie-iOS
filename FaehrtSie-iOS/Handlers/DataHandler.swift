//
//  DataHandler.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public class DataHandler : ObservableObject {
    @Published var userJourneys: [Journey]
    
    public init(_ journeys: [Journey] = []) {
        userJourneys = journeys
        self.addJourney(Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: true, delay: 0))
        self.addJourney(Journey(id: 2, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: true, delay: 0))
    }
    
    public func addJourney(_ journey: Journey) {
        userJourneys.append(journey)
    }
}
