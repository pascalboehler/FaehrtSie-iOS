//
//  NetworkHandler.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 05.07.23.
//

import Foundation
import Alamofire

public class NetworkHandler {
    
    @Published var isFetching: Bool = false
    
    private let baseURL = "https://api.alpaka.fyi"
    
    public init() {
        
    }
    
    public func getScheduleForDay(_ day: Date) -> [Journey] {
        self.isFetching = true
        
        let urlString = "\(baseURL)/data/isComing"
        
        guard let fullURL = URL(string: urlString) else {
            self.isFetching = false
            print("Error!!")
            return []
        }
        
        if (IsConnectedToNetwork()) {
            AF.request(fullURL, method: .get).validate().responseString { response in
                guard response.error == nil else {
                    print("ERROR while fetching")
                    return                }
                do {
                    print(response.data!)
                } catch {
                    fatalError("Could not parse the data!")
                }
            }
        } else {
            print("Not connected to internet, cannot update")
        }
        
        self.isFetching = false
        return []
    }
    
    private func IsConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager(host: "api.alpaka.fyi")?.isReachable ?? false
    }
    
}
