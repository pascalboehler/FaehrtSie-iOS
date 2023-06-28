//
//  ContentView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 26.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Ja,")
                .font(.system(size: 30))
            Text("sie fährt")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
