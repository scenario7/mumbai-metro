//
//  LineView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct LineView: View {
    
    var line : Line
    
    var isOperating : Bool {
        if (Date() >= line.operationBeginsAt && Date() <= line.operationEndsAt) {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
            ZStack(alignment:.topLeading) {
                    LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                        .ignoresSafeArea()
                    GeometryReader { geometry in
                            ScrollView(.vertical, showsIndicators: false) {
                                ZStack(alignment:.topLeading) {
                                    Image("wavy_lines")
                                        .resizable()
                                        .scaledToFill()
                                        .foregroundColor(.blue)
                                        .opacity(0.3)
                                    VStack(spacing:40){
                                        HStack(alignment:.center) {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 50, height: 50, alignment: .center)
                                                .foregroundColor(line.color)
                                                Text(line.name)
                                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(.gray)
                                                .opacity(0.5)
                                                HStack {
                                                    Text("Operational Status")
                                                        .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                                                    Spacer()
                                                    Circle()
                                                        .frame(width: 10, height: 10, alignment: .center)
                                                        .foregroundColor(isOperating ? .green : .red)
                                                        .shadow(color: (isOperating ? .green : .red), radius: 10, x: 0, y: 0)
                                                }
                                                .padding(10)
                                            }
                                            .frame(width: 200, height: 30, alignment: .center)
                                        }
                                        .padding()
                                        

                                        
                                        HStack(spacing:40) {
                                            VStack(alignment:.trailing, spacing: 73){
                                                ForEach(line.stations) { station in
                                                        HStack {
                                                            Text(station.name)
                                                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                                                .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 1))
                                                            NavigationLink {
                                                                StationView(name: station.name, line: line, lineOperator: line.operatedBy, latitude: station.coordinates.latitude, longitude: station.coordinates.longitude)
                                                            } label: {
                                                                Image(systemName: "chevron.right")
                                                                    .foregroundColor(.white)
                                                            }

                                                        }
                                                }
                                            }
                                            VStack(spacing:-10){
                                                ForEach(line.stations) { station in
                                                    if(station.id == 1){
                                                        VStack(spacing:-10) {
                                                            ZStack {
                                                                Circle()
                                                                    .foregroundColor(Constants().lightBlue)
                                                                .frame(width: 50, height: 50, alignment: .center)
                                                                Circle()
                                                                    .stroke(lineWidth: 3)
                                                                    .frame(width: 25, height: 25, alignment: .center)
                                                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                                            }
                                                            Rectangle()
                                                                .frame(width: 30, height: 30, alignment: .center)
                                                                .foregroundColor(Constants().lightBlue)
                                                        }
                                                    }
                                                    else if(station.id == line.stations.endIndex) {
                                                        VStack(spacing:-10) {
                                                            Rectangle()
                                                                .frame(width: 30, height: 35, alignment: .center)
                                                                .foregroundColor(Constants().lightBlue)
                                                            ZStack {
                                                                Circle()
                                                                    .foregroundColor(Constants().lightBlue)
                                                                .frame(width: 50, height: 50, alignment: .center)
                                                                Circle()
                                                                    .stroke(lineWidth: 3)
                                                                    .frame(width: 25, height: 25, alignment: .center)
                                                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                                            }
                                                            
                                                        }
                                                    }
                                                    else {
                                                        ZStack {
                                                            Rectangle()
                                                                .foregroundColor(Constants().lightBlue)
                                                            .frame(width: 30, height: 100, alignment: .center)
                                                            Circle()
                                                                .frame(width: 20, height: 20, alignment: .center)
                                                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                            HStack {
                                                VStack(alignment:.leading) {
                                                    Text("Mumbai Metro")
                                                    .font(.system(size: 12, weight: .regular, design: .default))
                                                    .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 1))
                                                    Text("Version 1.0.0")
                                                        .foregroundColor(.gray)
                                                    .font(.system(size: 10, weight: .regular, design: .default))
                                                }
                                                Spacer()
                                                VStack(alignment:.trailing) {
                                                    Text("Designed and Developed by")
                                                    .font(.system(size: 12, weight: .regular, design: .default))
                                                    .foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 1))
                                                    Text("Kevin Thomas")
                                                        .foregroundColor(.gray)
                                                    .font(.system(size: 10, weight: .regular, design: .default))
                                                }
                                            }
                                            .navigationBarTitle("Line \(line.name)")
                                            .padding()
                                    }
                            }
                            .frame(width: geometry.size.width, alignment: .center)
                        }
                    }
            }
        }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(line: line1)
            .colorScheme(.light)
    }
}

