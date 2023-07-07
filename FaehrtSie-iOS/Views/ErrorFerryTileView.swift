//
//  ErrorFerryTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 07.07.23.
//

import SwiftUI

struct ErrorFerryTileView: View {
    
    @State var errorDescription: String = "Uuuups..."
    
    var body: some View {
        VStack {
            
            Spacer()
            Image("FerrySad")
                .resizable()
                .scaledToFit()
                .colorInvert()
                .frame(width: 300)
            Spacer()
            Text("\(errorDescription)")
                .font(.system(size: 30, weight: .semibold))
                .padding(20)
            Spacer()
        }
    }
}

struct ErrorFerryTileView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorFerryTileView()
    }
}
