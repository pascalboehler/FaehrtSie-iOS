//
//  AccountSettingsView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, Account!")
            }
            .navigationTitle(Text("My Account")) // enter Account name here
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
