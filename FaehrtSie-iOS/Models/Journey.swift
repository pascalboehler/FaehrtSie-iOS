//
//  Journey.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import Foundation

enum Vehicle: String {
    case Ferry = "Ferry"
    case Bus = "Bus"
    case SBahn = "SBahn"
    case Express = "Express"
}

struct Journey: Identifiable {
    var id: Int
    var name: String
    var departurTime: Date
    var arrivalTime: Date
    var vehicleType: Vehicle
    var vehicleId: Int // line ID
    var startStation: String
    var endStation: String
    var isDelayed: Bool
    var delay: Int // delay in minutes!
}
