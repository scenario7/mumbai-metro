//
//  StationView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 08/04/22.
//

import SwiftUI
import MapKit

struct StationView: View {
    
    var name : String
    var stationID : Int
    var line : Line
    var lineOperator : String
    var latitude : Double
    var longitude : Double
    var busList : [String]
    
    init(name : String, line : Line, lineOperator : String, latitude : Double, longitude : Double, stationID : Int, busList : [String]){
        UINavigationBar.appearance().barTintColor = UIColor(named: "DarkBlue")
        self.name = name
        self.line = line
        self.lineOperator = lineOperator
        self.latitude = latitude
        self.longitude = longitude
        self.stationID = stationID
        self.busList = busList.sorted()
    }
    
    var isOperating : Bool {
        if (Date() >= line.operationBeginsAt && Date() <= line.operationEndsAt) {
            return true
        } else {
            return false
        }
    }
    let timeCalculateManager = TimeCalculateManager()
    var stationArrivals : [Date] = []
    
    
    var body: some View {
        
        
        ZStack {
            Color("MainColor")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment:.leading, spacing:40){
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 100, longitudinalMeters: 100)))
                        .frame(height:250)
                        .mask {
                            ZStack(alignment:.top) {
                                Rectangle()
                                    .frame(height:100)
                                RoundedRectangle(cornerRadius: 30)
                            }
                        }
                    
                    VStack(alignment:.leading, spacing: 30) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(line.color)
                                .frame(width: 95, height: 50, alignment: .center)
                            Text(line.name)
                                .font(Font.custom(Constants().poppinsMedium, size: 30))
                            
                        }
                        BannerAd(unitID:"ca-app-pub-6446002050162602/7145785598").frame(width: 320, height: 50)
                        
                        if (line.intervalAvailible && isOperating){
                            HStack {
                                Text("Next train from \(line == line2A ? line.stations.last!.name : line.stations.first!.name) expected in")
                                    .foregroundColor(.white)
                                    .font(Font.custom(Constants().poppinsMedium, size: 15))
                                Spacer()
                                VStack(spacing:5) {
                                    Text("\(timeCalculateManager.returnMinutes(currentTime: Date(), expectedTime: timeCalculateManager.calculateTime(line: line, stationID: stationID)))")
                                        .font(Font.custom(Constants().poppinsMedium, size: 20))
                                        .foregroundColor(.white)
                                    ZStack(alignment:.leading) {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(.gray)
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width:timeCalculateManager.returnInt(currentTime: Date(), expectedTime: timeCalculateManager.calculateTime(line: line, stationID: stationID))*100)
                                            .foregroundColor(Color(red: 0, green: 224/255, blue: 255))
                                            .shadow(color: .blue, radius: 3, x: 0, y: 0)
                                    }
                                    .frame(width: 100, height: 5, alignment: .center)
                                }
                                
                            }
                        } else if (line.intervalAvailible && (isOperating == false)){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                HStack{
                                    Image(systemName: "clock")
                                        .foregroundColor(.red)
                                    Spacer()
                                    Text("Train timings will be availible when operations resume.")
                                        .font(Font.custom(Constants().poppinsRegular, size: 14))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                            }
                            .frame(height:75)
                        }
                        Text("\(name) Metro Station lies on Line \(line.name) of the Mumbai Metro Network. It is operated by \(lineOperator). The first train departs at \(line.operationBeginsAt, style: .time) and the last train departs at \(line.operationEndsAt, style: .time). Please note that train timings are only an estimate and the service may be subject to delays.")
                            .font(Font.custom(Constants().poppinsRegular, size: 17))
                            .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                        
                        Text("Buses operating near this station")
                            .foregroundColor(.white)
                            .font(Font.custom(Constants().poppinsMedium, size: 15))
                        
                        let columns = [
                            GridItem(.adaptive(minimum: 80))
                        ]
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0 ..< busList.count) { bus in
                                HStack {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(width: 70, height: 30, alignment: .center)
                                            .foregroundColor(bgColorDecider(number: busList[bus]))
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: 2)
                                                .frame(width: 70, height: 30, alignment: .center)
                                                .foregroundColor(.red)
                                            Text(busList[bus])
                                                .foregroundColor(fgColorDecider(number: busList[bus]))
                                                .font(Font.custom(Constants().poppinsSemiBold, size: 13))
                                        }
                                    }
                                    .ignoresSafeArea()
                                }                                    }
                            .padding(.horizontal)
                        }
                        
                        
                        Button {
                            let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
                            if UIApplication.shared.canOpenURL(url!) {
                                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                            }
                            else{
                                let urlBrowser = URL(string: "https://www.google.com/maps/dir/?api=1&destination=\(name.addingPercentEncoding(withAllowedCharacters:.urlHostAllowed)!)+Metro+Station&travelmode=driving")
                                
                                UIApplication.shared.open(urlBrowser!, options: [:], completionHandler: nil)
                            }
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 45, alignment: .center)
                                    .foregroundColor(.white)
                                HStack {
                                    Text("Navigate")
                                        .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                        .foregroundColor(.black)
                                    Image(systemName: "location")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
        .navigationBarTitle("\(name) Station")
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(name: "Kanderpada", line : line2A, lineOperator: "MMRDA",latitude: 19.25727, longitude: 72.86590, stationID: 12, busList: ["240", "280"])
            .previewDevice("iPhone 12 Pro")
    }
}

final class ContentViewModel2 : NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.08679, longitude: 72.87370), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var locationManager : CLLocationManager?
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show alert")
        }
    }
    private func checkLocationAuth(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways,.authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
    
}


func bgColorDecider(number : String) -> Color{
    if (number.contains("C-")){
        return .yellow
    } else if (number.contains("LTD")) {
        return .red
    } else if (number.contains("AC")){
        return .white
    } else {
        return Color("MainColor")
    }
}

func fgColorDecider(number : String) -> Color{
    if (number.contains("C-")){
        return .red
    } else if (number.contains("LTD")) {
        return .white
    } else if (number.contains("AC")){
        return Color("MainColor")
    } else {
        return .white
    }
}
