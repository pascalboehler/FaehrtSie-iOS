//
//  ContentView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 26.06.23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Ja,")
                    .font(.system(size: 30))
                Text("sie fährt")
                Button {
                    NotificationHelper.triggerOnTimeNotification(1)
                } label: {
                    Text("Trigger on time notification")
                }
                Button {
                    NotificationHelper.triggerDelayNotification(1, delay: 10)
                } label: {
                    Text("Trigger delay notification")
                }
            }
            .padding()
            .navigationTitle(Text("Ferry"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
