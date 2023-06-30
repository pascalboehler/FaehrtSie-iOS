//
//  SelectJourneyView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct SelectJourneyView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, there!")
            }
            .navigationTitle(Text("New ride"))
        }
        
    }
}

struct SelectJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJourneyView()
    }
}
