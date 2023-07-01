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
                Text("Monday, \(journey.getDepartureDate())")
                    .font(.system(size: 25))
                Spacer()
                Image(systemName: "clock").font(.system(size: 25))
                    .foregroundColor(!journey.isDelayed ? .green : .primary)
                Text("\(journey.getDepartureTime())")
                    .font(.system(size: 25))
                    .foregroundColor(!journey.isDelayed ? .green : .primary)
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: -2, trailing: 15))
            HStack { // the part underneath
                Image("\(journey.mot.iconName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Spacer()
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
                            .frame(width: 25)
                        Image(systemName: "clock")
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

                })
            }
            
            .padding(EdgeInsets(top: 25, leading: 15, bottom: 25, trailing: 15))
            .background(.gray)
            .cornerRadius(25.0)
        }
        .background(Color(UIColor.lightGray))
        .cornerRadius(25.0)
        .padding()
    }
}

struct JourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTileView(journey: Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: true, delay: 0))
    }
}
