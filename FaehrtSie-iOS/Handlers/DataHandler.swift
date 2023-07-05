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
        //self.addJourney(Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: false, delay: 0))
        //self.addJourney(Journey(id: 2, name: "test", departureTime: Date.now, departureStation: "Landungsbrücken", arrivalTime: Date.now, arrivalStation: "Ernst-August-Schleuse", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Landungsbrücken", endPoint: "Ernst-August-Schleuse", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: true, delay: 10))
    }
    
    public func addJourney(_ journey: Journey) {
        // TODO: Fix ids
        let newId = userJourneys.count + 1
        
        journey.id = newId
        
        userJourneys.append(journey)
        
        userJourneys = userJourneys.sorted(by: {$0.departureTime < $1.departureTime})
    }
    
    public func getNextJourney() -> Journey? {
        // TODO: Make this time based ==> somewhat fixed due to sorting of the list
        return self.userJourneys.first
    }
    
    public func getAllJourneys() -> [Journey] {
        
        return userJourneys
    }
    
    // TODO: Add function that returns all upcoming journeys sorted by date
    
    public func getUpcomingJourneys() -> [Journey] {
        
        return []
    }
    
    public func getSearchResults(startStation: String, endStation: String, selectedStartDate: Date) -> [Journey] {
        // TODO: Search the Api for the users journey
        
        var searchResults: [Journey] = []
        
        let arrivalDate = selectedStartDate.addingTimeInterval(3000)
        
        searchResults.append(Journey(id: 0, name: "newJourney", departureTime: selectedStartDate, departureStation: startStation, arrivalTime: arrivalDate, arrivalStation: endStation, mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: startStation, endStation: endStation, isDelayed: false, delay: 0))
        
        
        return searchResults
    }
}
