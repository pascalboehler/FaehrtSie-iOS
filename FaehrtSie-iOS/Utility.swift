//
//  Utility.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 06.07.23.
//

import Foundation

public class Utility {
    public static func convertToDateString(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
    
    public static func convertToTimeString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
}
