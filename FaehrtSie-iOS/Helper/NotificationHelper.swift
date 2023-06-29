//
//  NotificationHelper.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 29.06.23.
//

import Foundation
import UserNotifications

public class NotificationHelper {
    
    static func triggerOnTimeNotification(_ ferryId: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Faehrt sie?"
        content.subtitle = "Your ferry is arriving"
        content.body = "Hey, it looks like your ferry is about to arrive. You might want to leave now to catch it in time"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}
