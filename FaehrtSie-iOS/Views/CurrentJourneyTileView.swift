//
//  CurrentdataHandler.userJourneys.first!TileView.swift
//  FaehrtSie-iOS
//
//  Created by Pascal Böhler on 03.07.23.
//

import SwiftUI

struct CurrentJourneyTileView: View {
    
    //@State var dataHandler.userJourneys.first!: dataHandler.userJourneys.first!
    
    @EnvironmentObject var dataHandler: DataHandler
    
    var body: some View {
        VStack {
            Text("Your next trip")
                .underline()
                .font(.system(size: 30))
            
            HStack {
                
                Spacer()
                
                Image(systemName: "\(dataHandler.userJourneys.first!.mot.type.rawValue.lowercased())")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                Spacer()
                
                Image(dataHandler.userJourneys.first!.mot.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                
                Spacer()
                
            }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
            
            HStack {
                Text("Monday, \(dataHandler.userJourneys.first!.getDepartureDate())")
                    .font(.system(size: 22))
                Spacer()
                Image(systemName: "clock").font(.system(size: 22))
                    //.foregroundColor(!dataHandler.userJourneys.first!.isDelayed ? .green : .black)
                Text("\(dataHandler.userJourneys.first!.getDepartureTime())")
                    .font(.system(size: 22))
                    //.foregroundColor(!dataHandler.userJourneys.first!.isDelayed ? .green : .black)
            }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 5, trailing: 15))
            HStack {
                Text("Status: ")
                Text("\(!dataHandler.userJourneys.first!.isDelayed ? "On Time" : "Delayed \n\(dataHandler.userJourneys.first!.delay) Minutes" )")
                    .foregroundColor(dataHandler.userJourneys.first!.isDelayed ? .red : Design.greenColor) // TODO: Find a better green! Changed to ForestGreen
                Spacer()
                
            }
                .font(.system(size: 22))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
            
            VStack {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text("\(dataHandler.userJourneys.first!.departureStation) at \(dataHandler.userJourneys.first!.getDepartureTime())")
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
                    Text("\(dataHandler.userJourneys.first!.arrivalStation) at \(dataHandler.userJourneys.first!.getArrivalTime())")
                    Spacer()
                }
            }
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
            
        }
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
            .background(Design.darkBGColor)
            .cornerRadius(25.0)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}

struct CurrentJourneyTileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentJourneyTileView().environmentObject(DataHandler())
    }
}
