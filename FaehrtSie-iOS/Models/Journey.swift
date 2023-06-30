//
//  Journey.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

public enum Vehicle: String {
    case Ferry = "Ferry"
    case Bus = "Bus"
    case SBahn = "SBahn"
    case Express = "Express"
}

public struct Journey: Identifiable {
    public var id: Int
    public var name: String
    public var departurTime: Date
    public var arrivalTime: Date
    public var vehicleType: Vehicle
    public var vehicleId: Int // line ID
    public var startStation: String
    public var endStation: String
    public var isDelayed: Bool
    public var delay: Int // delay in minutes!
}
