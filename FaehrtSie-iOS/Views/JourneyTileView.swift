//
//  JourneyTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 30.06.23.
//

import SwiftUI

struct JourneyTileView: View {
    
    @State var journey: Journey
    
    var body: some View {
    
        VStack {
            HStack {
                // TODO: Get weekday
                Text("Monday, \(journey.getDepartureDate())")
                    .font(.system(size: 22))
                Spacer()
                Image(systemName: "clock").font(.system(size: 22))
                Text("\(journey.getDepartureTime())")
                    .font(.system(size: 22))
            }
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: -2, trailing: 15))
            HStack { // the part underneath
                Image("\(journey.mot.iconName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                Spacer().frame(width: 30)
                VStack(alignment: .leading, content: {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 20))
                        Text(journey.departureStation)
                            .font(.system(size: 20))
                    }
                    Spacer().frame(height: 10)
                    HStack {
                        Image(systemName: "ellipsis")
                            .scaledToFit()
                            .frame(width: 22)
                        Image(systemName: "clock")
                        // TODO: calculate this from dep && arr time
                        Text("20 Minutes")
                            .font(.system(size: 15))
                    }
                    Spacer().frame(height: 10)
                    HStack {
                        Image(systemName: "flag.checkered.circle.fill")
                            .font(.system(size: 20))
                        Text(journey.arrivalStation)
                            .font(.system(size: 20))
                    }

                }).foregroundColor(.black)
                Spacer()
            }
            
            .padding(EdgeInsets(top: 22, leading: 15, bottom: 22, trailing: 15))
            .background(Design.darkBGColor)
            .cornerRadius(25.0)
        }
        .background(!journey.isDelayed ? Design.stdCorpColor : Color.red)
        .cornerRadius(25.0)
        //.padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
}

struct JourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTileView(journey: Journey(name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), isDelayed: false, delay: 0))
    }
}
