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

public struct Journey: Identifiable {
    public var id: Int
    public var name: String
    public var departurTime: Date
    public var arrivalTime: Date
    public var mot: MoT
    public var startStation: String
    public var endStation: String
    public var isDelayed: Bool
    public var delay: Int // delay in minutes!
}
