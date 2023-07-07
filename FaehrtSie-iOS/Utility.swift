//
//  Utility.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 06.07.23.
//

import Foundation

public class Utility {
    public static func convertDateToString (_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
    
    public static func convertDateTimeToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
    
    public static func convertDateToDayNameString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
    
    public static func unicodeToASCII(_ stringToConvert: String) -> String {
        
        var asciiString = ""
        
        for char in stringToConvert {
            switch (char) {
            case "ä":
                asciiString += "ae"
                break
            case "ü":
                asciiString += "ue"
                break
            case "ö":
                asciiString += "oe"
                break
            default:
                asciiString += "\(char)"
                break
            }
        }
        
        return asciiString
    }
}
