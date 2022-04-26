//
//  FareView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 11/04/22.
//

import SwiftUI
import MapKit
import WebKit

struct FareView: View {
    
    init(){
        UIPickerView.appearance().tintColor = .white
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().font, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
    }
    
    @State var line = 0
    @State var departure = 1
    @State var arrival = 1
    
    
    @State private var showingAlert = false
    @State private var showingFare = false
    
    @State var fare = 0
    @State var distance = 0
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack(alignment:.center, spacing:30){
                    HStack {
                        Text("Select Line")
                            .font(Font.custom(Constants().font, size: 20))
                            .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                        Spacer()
                        Picker("Line", selection: $line) {
                            Text("Line 1").tag(0)
                            Text("Line 2A").tag(1)
                            Text("Line 7").tag(2)
                        }
                        .pickerStyle(.menu)
                        .padding()
                    }
                    VStack {
                        HStack{
                            Text("Departing from")
                                .font(Font.custom(Constants().font, size: 20))
                                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                            Spacer()
                            Picker("Departure", selection: $departure) {
                                if(line == 0){
                                    ForEach(linesPublished[line].stations){ station in
                                        Text(station.name).tag(station.id)
                                    }
                                } else {
                                    ForEach(line2A7Stations){ station in
                                        Text(station.name).tag(station.id)
                                    }
                                }
                            }
                            .pickerStyle(.menu)
                            .padding()
                        }
                        HStack{
                            Text("Arriving at")
                                .font(Font.custom(Constants().font, size: 20))
                                .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                            Spacer()
                            Picker("Arrival", selection: $arrival) {
                                if(line == 0){
                                    ForEach(linesPublished[line].stations){ station in
                                        Text(station.name).tag(station.id)
                                    }
                                } else {
                                    ForEach(line2A7Stations){ station in
                                        Text(station.name).tag(station.id)
                                    }
                                }
                            }
                            .pickerStyle(.menu)
                            .padding()
                        }
                        
                    }
                    Button {
                        if (departure==arrival){
                            showingAlert = true
                            departure = 1
                            arrival = 1
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        } else if ((line==1 || line==2)&&(departure != arrival)){
                            print(departure,arrival)
                            fare = line2A7Fare[departure-1][arrival-1]
                            departure = 1
                            arrival = 1
                            showingFare = true
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        } else {
                            print(departure-1,arrival-1)
                            fare = line1Fare[departure-1][arrival-1]
                            departure = 1
                            arrival = 1
                            showingFare = true
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(Constants().lightBlue)
                            HStack {
                                Text("Calculate")
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                            }
                        }
                    }
                    .alert("Departure and Arrival Stations cannot be the same", isPresented: $showingAlert) {
                        Button("Close", role: .cancel) { }
                    }
                    .alert("Single Journey Fare : ₹\(fare)", isPresented: $showingFare){
                        Button("OK", role: .cancel){}
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("Calculate Fare")
            }
        }
    }
    
    func calculateFare(distance : Int) -> Int{
        if(distance<=3) {
            return 10
        } else if (distance>3 && distance<=12){
            return 20
        } else if (distance>12 && distance<=18){
            return 30
        }else if (distance>18 && distance<=24){
            return 40
        }else{
            return 50
        }
    }
    
}

struct FareView_Previews: PreviewProvider {
    static var previews: some View {
        FareView()
            .colorScheme(.light)
    }
}



