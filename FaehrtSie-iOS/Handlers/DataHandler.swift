//
//  DataHandler.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public class DataHandler : ObservableObject {
    @Published var userJourneys: [Journey]
    
    public init() {
       userJourneys = []
    }
    
    public func addJourney(_ journey: Journey) {
        userJourneys.append(journey)
    }
}
