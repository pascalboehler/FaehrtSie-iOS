//
//  NotificationHelper.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 29.06.23.
//

import Foundation
import UserNotifications

public class NotificationHelper {
    
    static let notificationTitle = "Updates on your journey"
    
    static func triggerOnTimeNotification(_ ferryId: Int) {
        let content = UNMutableNotificationContent()
        content.title = notificationTitle
        content.subtitle = "Your ferry is about to arrive"
        content.body = "Hey, it looks like your ferry is about to arrive. You might want to leave now to catch it in time"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        print(UUID().uuidString)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    static func triggerDelayNotification(_ ferryId: Int, delay: Int) {
        let content = UNMutableNotificationContent()
        content.title = notificationTitle
        content.subtitle = "Your ferry is delayed"
        content.body = "Hey, it looks like your ferry is delayed by about \(delay) minutes. Check the app for current alternatives"
        content.sound = UNNotificationSound.defaultCritical
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}
