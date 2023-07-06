//
//  MainTabView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "ferry.fill")
                }
            NextRidesView()
                .tabItem {
                    Label("Next rides", systemImage: "calendar.day.timeline.left")
                }
            /*AccountSettingsView()
                .tabItem {
                    Label("My Account", systemImage: "person.crop.circle.fill")
                }*/
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
