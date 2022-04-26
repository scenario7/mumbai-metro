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
    var line : Line
    var lineOperator : String
    var latitude : Double
    var longitude : Double

    init(name : String, line : Line, lineOperator : String, latitude : Double, longitude : Double){
        UINavigationBar.appearance().barTintColor = UIColor(named: "DarkBlue")
        self.name = name
        self.line = line
        self.lineOperator = lineOperator
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var body: some View {
        
        
            ZStack {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                    ScrollView(.vertical, showsIndicators: true) {
                                VStack(alignment:.leading, spacing:40){
//                                    Text("\(name) Station")
//                                        .font(Font.custom(Constants().font, size: 25))
//                                        .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 0.1, longitudinalMeters: 0.1)))
                                        .frame(height:200)
                                        .ignoresSafeArea()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(line.color)
                                        .frame(width: 60, height: 40, alignment: .center)
                                        Text(line.name)
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                    }
                                    Text("\(name) Metro Station lies on Line \(line.name) of the Mumbai Metro Network. It is operated by \(lineOperator). The first train departs at \(line.operationBeginsAt, style: .time) and the last train departs at \(line.operationEndsAt, style: .time). Please note that the information on this app is subject to change without prior notice.")
                                        .font(.system(size: 17, weight: .regular, design: .default))
                                        .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
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
                                                .foregroundColor(Constants().lightBlue)
                                            HStack {
                                                Text("Navigate")
                                                    .font(.system(size: 20, weight: .medium, design: .default))
                                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                            }
                                        }
                                    }

                                }
                                .padding()
                }
            }
            .navigationBarTitle("\(name) Station")

    }
}

//struct StationView_Previews: PreviewProvider {
//    static var previews: some View {
//        StationView(latitude: 19.25727, longitude: 72.86590)
//    }
//}

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
