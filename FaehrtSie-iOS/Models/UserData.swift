//
//  UserData.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 06.07.23.
//

import Foundation

struct UserData : Decodable, Encodable {
    public var userStoredJourney = [Journey]()
}
