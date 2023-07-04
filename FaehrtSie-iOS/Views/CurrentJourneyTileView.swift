//
//  CurrentJourneyTileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 03.07.23.
//

import SwiftUI

struct CurrentJourneyTileView: View {
    
    @State var journey: Journey
    
    var body: some View {
        VStack {
            Text("Your next trip")
                .underline()
                .font(.system(size: 30))
            
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
                Text("Monday, \(journey.getDepartureDate())")
                    .font(.system(size: 22))
                Spacer()
                Image(systemName: "clock").font(.system(size: 22))
                    //.foregroundColor(!journey.isDelayed ? .green : .black)
                Text("\(journey.getDepartureTime())")
                    .font(.system(size: 22))
                    //.foregroundColor(!journey.isDelayed ? .green : .black)
            }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
            HStack {
                Text("Status: ")
                Text("\(!journey.isDelayed ? "On Time" : "Delayed \n\(journey.delay) Minutes" )")
                    .foregroundColor(journey.isDelayed ? .red : Color(red: 0.25, green: 0.52, blue: 0.14)) // TODO: Find a better green! Changed to ForestGreen
                Spacer()
                
            }
                .font(.system(size: 22))
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
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
            .background(Color.gray)
            .cornerRadius(25.0)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}

struct CurrentJourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentJourneyTileView(journey: Journey(id: 1, name: "hi", departureTime: Date.now, departureStation: "Ernst-August-Schleuse", arrivalTime: Date.now, arrivalStation: "Landungsbrücke", mot: MoT(lineNum: 73, type: .Ferry, startPoint: "Ernst-August-Schleuse", endPoint: "Landungsbrücken", iconName: "Faehre73Logo"), startStation: "Test", endStation: "Huhu", isDelayed: true, delay: 10))
    }
}