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
        VStack(spacing: 20) {
            Text("Ja,")
                .font(.system(size: 30))
            Text("sie fährt")
            Button {
                NotificationHelper.triggerOnTimeNotification(1)
            } label: {
                Text("Trigger notification")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
