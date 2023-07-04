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
                    .font(.system(size: 22))
                Spacer()
                Image(systemName: "clock").font(.system(size: 22))
                    //.foregroundColor(!journey.isDelayed ? Color(red: 0.25, green: 0.52, blue: 0.14) : .black)
                Text("\(journey.getDepartureTime())")
                    .font(.system(size: 22))
                    //.foregroundColor(!journey.isDelayed ? Color(red: 0.25, green: 0.52, blue: 0.14) : .black)
            }
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: -2, trailing: 15))
            HStack { // the part underneath
                Image("\(journey.mot.iconName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
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
                            .frame(width: 22)
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

                }).foregroundColor(.black)
            }
            
            .padding(EdgeInsets(top: 22, leading: 15, bottom: 22, trailing: 15))
            .background(.gray)
            .cornerRadius(25.0)
        }
        .background(!journey.isDelayed ? Color(red: 0.94, green: 0.58, blue: 0.25) : Color.red)
        .cornerRadius(25.0)
        //.padding()
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
}

struct JourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTileView(journey: Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: false, delay: 0))
    }
}
