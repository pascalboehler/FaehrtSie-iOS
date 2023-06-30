//
//  AccountSettingsView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Account!")
            }
            .navigationTitle(Text("My Account"))
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
