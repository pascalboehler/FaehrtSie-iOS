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
    @Published var searchResults: [Journey] = []
    
    private let baseURL = "https://api.alpaka.fyi"
    
    public init() {
        
    }
    
    public func searchForJourney() {
        _ = getScheduleForDay(Date.now)
    }
    
    public func getScheduleForDay(_ day: Date) -> [Journey] {
        self.isFetching = true
        
        let urlString = "\(baseURL)/data/dayInfo"
        
        var responseJourney: [Journey] = []
        
        guard let fullURL = URL(string: urlString) else {
            self.isFetching = false
            print("Error!!")
            return []
        }
        
        if (IsConnectedToNetwork()) {
            AF.request(fullURL, method: .get).responseDecodable(of: Schedule.self) { response in
                guard let dataDecoded = response.value else {
                    print("Decoding error")
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
            }
        } else {
            print("Not connected to internet, cannot update")
        }
        
        self.isFetching = false
        
        return responseJourney
    }
    
    private func IsConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager(host: "api.alpaka.fyi")?.isReachable ?? false
    }
    
}
