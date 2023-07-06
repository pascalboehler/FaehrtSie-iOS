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
        //self.addJourney(Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), isDelayed: false, delay: 0))
        //self.addJourney(Journey(id: 2, name: "test", departureTime: Date.now, departureStation: "Landungsbrücken", arrivalTime: Date.now, arrivalStation: "Ernst-August-Schleuse", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Landungsbrücken", endPoint: "Ernst-August-Schleuse", iconName: "Faehre73Logo"), isDelayed: true, delay: 10))
    }
    
    public func addJourney(_ journey: Journey) {
        let newId = userJourneys.count + 1
        
        userJourneys.append(journey)
        
        userJourneys = userJourneys.sorted(by: {$0.departureTime < $1.departureTime})
    }
    
    public func getNextJourney() -> Journey {
        // TODO: Make this time based ==> somewhat fixed due to sorting of the list
        return self.userJourneys.first!
    }
    
    public func getAllJourneys() -> [Journey] {
        
        return userJourneys
    }
    
    // TODO: Add function that returns all upcoming journeys sorted by date
    
    public func getUpcomingJourneys() -> [Journey] {
        
        return []
    }
}
