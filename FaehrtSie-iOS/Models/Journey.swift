//
//  Journey.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public struct MoT : Decodable, Encodable{
    public var lineNum: Int
    public var type: VehicleType
    public var startPoint: String
    public var endPoint: String
    public var iconName: String // insert icon here
}

public enum VehicleType: String, Decodable, Encodable {
    case Ferry = "Ferry"
    case Bus = "Bus"
    case SBahn = "SBahn"
    case Express = "Express"
}

public class Journey: Identifiable, ObservableObject, Decodable, Encodable {
    //public var id: Int
    public var name: String
    public var departureTime: Date
    public var arrivalTime: Date
    public var mot: MoT
    public var isDelayed: Bool
    public var delay: Int // delay in minutes!
    public var departureStation: String
    public var arrivalStation: String
    
    public init(name: String, departureTime: Date, departureStation: String, arrivalTime: Date, arrivalStation: String, mot: MoT, isDelayed: Bool, delay: Int) {
        self.name = name
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.mot = mot
        self.isDelayed = isDelayed
        self.delay = delay
        self.departureStation = departureStation
        self.arrivalStation = arrivalStation
    }
    
    public func getDepartureDate() -> String {
        return Utility.convertDateToString(departureTime)
    }
    
    public func getDepartureTime() -> String {
        return Utility.convertDateTimeToString(departureTime)
    }
    
    public func getArrivalDate() -> String {
        return Utility.convertDateToString(arrivalTime)
    }
    
    public func getArrivalTime() -> String {
        return Utility.convertDateTimeToString(arrivalTime)
    }
}
