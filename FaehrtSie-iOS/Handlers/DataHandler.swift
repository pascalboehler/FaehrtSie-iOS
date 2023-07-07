//
//  DataHandler.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public class DataHandler : ObservableObject {
    
    @Published var userJourneys: [Journey]
    //@Published var isCurrentVisible: Bool = false
    
    public init(_ journeys: [Journey] = []) {
        
        userJourneys = journeys
        //self.addJourney(Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), isDelayed: false, delay: 0))
        //self.addJourney(Journey(id: 2, name: "test", departureTime: Date.now, departureStation: "Landungsbrücken", arrivalTime: Date.now, arrivalStation: "Ernst-August-Schleuse", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Landungsbrücken", endPoint: "Ernst-August-Schleuse", iconName: "Faehre73Logo"), isDelayed: true, delay: 10))
        
        print("Reading from disk")
        self.readStoredUserData()
        self.cleanUpUserJourneyList()
    }
    
    private func readStoredUserData() {
        
        var tempUserData: [Journey] = []
        
        let url = getDocumentsDir().appending(path: "userData.json")
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let decodedStuff = try decoder.decode(UserData.self, from: data)
            tempUserData = decodedStuff.userStoredJourney
        } catch {
            print("Hi")
            return
        }
        
        userJourneys = tempUserData
        
    }
    
    private func writeStoredUserData() {
        var userData = UserData()
        userData.userStoredJourney = self.userJourneys
        
        let url = getDocumentsDir().appending(path: "userData.json")
        
        do {
            let encoder = JSONEncoder()
            
            let encodedList = try encoder.encode(userData)
            
            try encodedList.write(to: url)
            
        } catch {
            print("THIS BLEW UP")
        }
    }
    
    private func getDocumentsDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0] // should be fine
    }
    
    public func addJourney(_ journey: Journey) {
        
        for item in userJourneys {
            if (item.departureTime == journey.departureTime && item.departureStation == journey.departureStation) {
                // if the entry is already there; do nothing
                return
            }
        }
        
        userJourneys.append(journey)
        
        NotificationHelper.planOntimeNotification(journey.departureTime, depStation: journey.departureStation)
        
        userJourneys = userJourneys.sorted(by: {$0.departureTime < $1.departureTime})
        
        self.cleanUpUserJourneyList()
        self.writeStoredUserData()
    }
    
    public func deleteJourney(_ index: Int) {
        let journeyToDel = userJourneys[index]
        
        NotificationHelper.deletePlannedNotification("\(journeyToDel.departureStation)+\(journeyToDel.departureTime.timeIntervalSince1970)")
        
        self.userJourneys.remove(at: index)
        self.cleanUpUserJourneyList()
        self.writeStoredUserData()
    }
    
    public func getNextJourney() -> Journey? {
        // TODO: Make this time based ==> somewhat fixed due to sorting of the list
        print("I WAS CALLED")
        for item in self.userJourneys {
            if (item.departureTime > Date.now) {
                //self.isCurrentVisible = true
                return item
            }
        }
        return nil
    }
    
    public func cleanUpUserJourneyList() {
        if (self.userJourneys.isEmpty) {
            return
        }
        
        let theDay: Date = Date.now
        
        var tempList: [Journey] = []
        
        for item in self.userJourneys {
            if (item.departureTime >= theDay) {
                tempList.append(item)
            }
        }
        
        self.userJourneys = tempList
    }
    
    public func getAllJourneys() -> [Journey] {
        self.cleanUpUserJourneyList()
        return userJourneys
    }
    
    // TODO: Add function that returns all upcoming journeys sorted by date
    
    public func getUpcomingJourneys() -> [Journey] {
        
        return []
    }
}
