//
//  NetworkHandler.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 05.07.23.
//

import Foundation
import Alamofire

public class NetworkHandler : ObservableObject {
    
    @Published var isFetching: Bool = false
    @Published var isOffline: Bool = false
    @Published var searchResults: [Journey] = []
    @Published var initialFetchDone: Bool = false
    
    private let baseURL = "https://api.alpaka.fyi"
    
    public init() {
        
    }
    
    public func searchForJourney(_ date: Date = Date.now, stationDep: String = "Ernst-August-Schleuse", stationArr: String = "Landungsbruecken") {
        self.isFetching = true
        var searchResultJourneys: [Journey] = []
        
        let urlString = "\(baseURL)/data/getSchedule?unix=\(date.timeIntervalSince1970)&date=\(Utility.convertDateToString(date))&time=\(Utility.convertDateTimeToString(date))&offset=120&station=\(stationDep)"
        
        guard let fullURL = URL(string: urlString) else {
            self.isFetching = false
            print("error while creating url")
            return
        }
        
        if (IsConnectedToNetwork()) {
            self.isOffline = false
            AF.request(fullURL, method: .get).responseDecodable(of: Schedule.self) { response in
                guard let dataDecoded = response.value else {
                    print("error while decoding response")
                    self.isFetching = false
                    return
                }
                
                for departure in dataDecoded.departures {
                    let departureDate = Date(timeIntervalSince1970: departure)
                    let arrivalDate = departureDate.addingTimeInterval(1200) // MARK: Estimation of how long the ferry needs between the two stops
                    let journeyToAdd = Journey(name: "RESULT", departureTime: departureDate, departureStation: stationDep, arrivalTime: arrivalDate, arrivalStation: stationArr, mot: MoT(lineNum: 73, type: .Ferry, startPoint: stationDep, endPoint: stationArr, iconName: "Faehre73Icon"), isDelayed: false, delay: 0)
                    
                    searchResultJourneys.append(journeyToAdd)
                }
                self.searchResults = searchResultJourneys
                self.isFetching = false
                self.checkInitialFetch()
            }
        } else {
            print("Not connected to internet")
            self.isOffline = true
            self.isFetching = false
        }
    }
    
    public func getScheduleForCurrentDay() {
        self.isFetching = true
        
        let urlString = "\(baseURL)/data/dayInfo"
        
        var responseJourney: [Journey] = []
        
        guard let fullURL = URL(string: urlString) else {
            self.isFetching = false
            print("Error!!")
            return
        }
        
        if (IsConnectedToNetwork()) {
            self.isOffline = false
            AF.request(fullURL, method: .get).responseDecodable(of: Schedule.self) { response in
                guard let dataDecoded = response.value else {
                    print("Decoding error")
                    self.isFetching = false
                    return
                }
                print(dataDecoded)
                
                var i = 1;
                
                for departure in dataDecoded.departures {
                    print(departure)
                    let departureDate = Date(timeIntervalSince1970: departure)
                    let arrivalDate = departureDate.addingTimeInterval(1200)
                    let journeyToAdd = Journey(name: "RESULT", departureTime: departureDate, departureStation: "Ernst-August-Schleuse", arrivalTime: arrivalDate, arrivalStation: "Landungsbrücken", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), isDelayed: false, delay: 0)
                    responseJourney.append(journeyToAdd)
                    i += 1
                }
                print("done without errors")
                self.searchResults = responseJourney
                self.isFetching = false
                self.checkInitialFetch()
            }
        } else {
            print("Not connected to internet, cannot update")
            self.isOffline = true
            self.isFetching = false
        }
        
        return
    }
    
    private func IsConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager(host: "api.alpaka.fyi")?.isReachable ?? false
    }
    
    private func checkInitialFetch() {
        if (!initialFetchDone) {
            initialFetchDone = true
        }
    }
    
}
