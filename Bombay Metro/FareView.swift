//
//  FareView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 11/04/22.
//

import SwiftUI
import MapKit
import WebKit
import Firebase

struct FareView: View {
    
    let generator = UINotificationFeedbackGenerator()
    
    init(){
        UIPickerView.appearance().tintColor = .white
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().poppinsSemiBold, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named:"MainColor")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "DarkBlue")
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: Constants().poppinsRegular, size: 20)!, .foregroundColor: UIColor(Color(hue: 0, saturation: 0, brightness: 1))], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: Constants().poppinsSemiBold, size: 20)!], for: .selected)
    }
    
    @State var line = 0
    @State var departure = 1
    @State var arrival = 1
    @State var returnTrip : Bool = false
    
    
    @State private var showingAlert = false
    @State private var showingFare = false
    
    @State var fare = 0
    @State var distance = 0
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("MainColor")
                    .ignoresSafeArea()
                VStack(alignment:.center, spacing:20){
                    VStack {
                        Text("Select Line")
                            .font(Font.custom(Constants().poppinsRegular, size: 20))
                            .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                        Picker("Line", selection: $line) {
                            Text("Line 1").tag(0)
                            Text("Line 2A").tag(1)
                            Text("Line 7").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                    .onAppear(){
                        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
                            AnalyticsParameterScreenName: "\(FareView.self)",
                            AnalyticsParameterScreenClass: "\(FareView.self)",
                        ])
                    }

                    Toggle(isOn: $returnTrip, label: {Text("Return Journey?")
                            .foregroundColor(.white)
                            .font(Font.custom(Constants().poppinsRegular, size: 17))
                    })
                        .padding([.leading,.trailing], 70)
                    VStack(spacing:30) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("bgAdaptive"))
                            VStack{
                                Text("Departure from")
                                    .font(Font.custom(Constants().poppinsMedium, size: 20))
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
                            }
                            .padding()
                        }
                        .frame(width: 260, height: 100, alignment: .center)
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("bgAdaptive"))
                            VStack{
                                Text("Arrival at")
                                    .font(Font.custom(Constants().poppinsMedium, size: 20))
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
                            }
                            .padding()
                        }
                        .frame(width: 260, height: 100, alignment: .center)

                        
                    }
                    Spacer()
                    Button {
                        if (departure==arrival){
                            showingAlert = true
//                            departure = 1
//                            arrival = 1
                            self.generator.notificationOccurred(.success)
                        } else if ((line==1 || line==2)&&(departure != arrival)){
                            print(departure,arrival)
                            fare = line2A7Fare[departure-1][arrival-1]
                            if returnTrip{
                                fare *= 2
                            } else {
                                fare *= 1
                            }
                            showingFare = true
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        } else {
                            print(departure-1,arrival-1)
                            fare = line1Fare[departure-1][arrival-1]
                            if returnTrip{
                                fare *= 2
                            } else {
                                fare *= 1
                            }
                            showingFare = true
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(.white)
                            HStack {
                                Text("Calculate")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .alert("Departure and Arrival Stations cannot be the same", isPresented: $showingAlert) {
                        Button("Close", role: .cancel) { }
                    }
                    .alert("\(returnTrip ? "Return" : "One-way") Journey Fare : ₹\(fare) \nPlatform No. : \(departure>arrival ? "1" : "2")", isPresented: $showingFare){
                        Button("OK", role: .cancel){
                            departure = 1
                            arrival = 1
                        }
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
            .previewDevice("iPhone 8")
    }
}



