//
//  SelectJourneyView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct SelectJourneyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Tour!")
            }
            .navigationTitle(Text("Next rides"))
        }
        
    }
}

struct SelectJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJourneyView()
    }
}
