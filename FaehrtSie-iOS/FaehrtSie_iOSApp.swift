//
//  FaehrtSie_iOSApp.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 26.06.23.
//

import SwiftUI
import UserNotifications

@main
struct FaehrtSie_iOSApp: App {
    
    init() {
        // get the users permission to trigger notifications (for ferry notifications)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
