//
//  CurrentjourneyTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 03.07.23.
//

import SwiftUI

struct CurrentJourneyTileView: View {
    
    @ObservedObject var journey: Journey
    
    var body: some View {
        VStack {
            Text("Upcoming")
                .font(.system(size: 40))
                .padding(EdgeInsets(top: 10, leading: 5, bottom: -2, trailing: 5))
            
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "\(journey.mot.type.rawValue.lowercased())")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    
                    Spacer()
                    
                    Image(journey.mot.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                    
                    Spacer()
                    
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                
                HStack {
                    Text("\(Utility.convertDateToDayNameString(journey.departureTime)),\n\(journey.getDepartureDate())")
                    Spacer()
                    Image(systemName: "clock")
                    Text("\(journey.getDepartureTime())")
                }
                .font(.system(size: 22, weight: .semibold))
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
                HStack {
                    Text("Status: ")
                    Text("\(!journey.isDelayed ? "On Time" : "Delayed \n\(journey.delay) Minutes" )")
                        .foregroundColor(journey.isDelayed ? .red : Design.greenColor) // TODO: Find a better green! Changed to ForestGreen
                    Spacer()
                    
                }
                .font(.system(size: 22, weight: .semibold))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                
                VStack {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        Text("\(journey.departureStation) at \(journey.getDepartureTime())")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    HStack {
                        Image(systemName: "ellipsis")
                            .scaledToFit()
                            .frame(width: 22)
                        Image(systemName: "clock")
                        Text("20 Minutes")
                            .font(.system(size: 17))
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    HStack {
                        Image(systemName: "flag.checkered.circle.fill")
                        Text("\(journey.arrivalStation) at \(journey.getArrivalTime())")
                        Spacer()
                    }
                }
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                
            }
            
            .padding(EdgeInsets(top: 20, leading: 5, bottom: 15, trailing: 5))
            .background(Design.darkBGColor)
            .cornerRadius(25.0)
        }
            .background(Design.stdCorpColor)
            .foregroundColor(.black)
            .cornerRadius(25.0)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}

struct CurrentJourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentJourneyTileView(journey: Journey(name: "test", departureTime: Date.now, departureStation: "Landungsbrücken", arrivalTime: Date.now, arrivalStation: "Ernst-August-Schleuse", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Landungsbrücken", endPoint: "Ernst-August-Schleuse", iconName: "Faehre73Logo"), isDelayed: true, delay: 10))
    }
}
