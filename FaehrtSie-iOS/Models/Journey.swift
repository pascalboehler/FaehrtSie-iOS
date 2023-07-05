//
//  Journey.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public struct MoT {
    public var lineNum: Int
    public var type: VehicleType
    public var startPoint: String
    public var endPoint: String
    public var iconName: String // insert icon here
}

public enum VehicleType: String {
    case Ferry = "Ferry"
    case Bus = "Bus"
    case SBahn = "SBahn"
    case Express = "Express"
}

public class Journey: Identifiable, ObservableObject {
    public var id: Int
    public var name: String
    public var departureTime: Date
    public var arrivalTime: Date
    public var mot: MoT
    public var startStation: String
    public var endStation: String
    public var isDelayed: Bool
    public var delay: Int // delay in minutes!
    public var departureStation: String
    public var arrivalStation: String
    
    public init(id: Int, name: String, departureTime: Date, departureStation: String, arrivalTime: Date, arrivalStation: String, mot: MoT, startStation: String, endStation: String, isDelayed: Bool, delay: Int) {
        self.id = id
        self.name = name
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.mot = mot
        self.startStation = startStation
        self.endStation = endStation
        self.isDelayed = isDelayed
        self.delay = delay
        self.departureStation = departureStation
        self.arrivalStation = arrivalStation
    }
    
    public func getDepartureDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let formattedString = dateFormatter.string(from: departureTime)
        
        return formattedString
    }
    
    public func getDepartureTime() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let formattedString = dateFormatter.string(from: departureTime)
        
        return formattedString
    }
    
    public func getArrivalDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let formattedString = dateFormatter.string(from: arrivalTime)
        
        return formattedString
    }
    
    public func getArrivalTime() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let formattedString = dateFormatter.string(from: arrivalTime)
        
        return formattedString
    }
}
