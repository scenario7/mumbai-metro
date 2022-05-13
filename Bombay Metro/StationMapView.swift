//
//  StationMapView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI
import MapKit


struct StationMapView: View {
    
    @State var locationAlert = false
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named:"LightBlue")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "DarkBlue")
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: Constants().font, size: 20)!, .foregroundColor: UIColor(Color(hue: 0, saturation: 0, brightness: 1))], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: Constants().font, size: 20)!], for: .selected)
    }
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var lineDisplayed = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.top) {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true, annotationItems: linesPublished[lineDisplayed].stations){ station in
                    MapAnnotation(coordinate: station.coordinates) {
                        NavigationLink(destination: StationView(name: station.name, line: linesPublished[lineDisplayed], lineOperator: linesPublished[lineDisplayed].operatedBy, latitude: station.coordinates.latitude, longitude: station.coordinates.longitude)) {
                            VStack {
                                ZStack{
                                    Circle()
                                        .frame(width: 16, height: 16, alignment: .center)
                                        .foregroundColor(linesPublished[lineDisplayed].color)
                                    Image(systemName: "tram")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12, alignment: .center)
                                        .foregroundColor(.white)
                                }
                                
                                Text(station.name)
                                    .font(Font.custom(Constants().font, size: 8))
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.7))
                                
                            }
                        }
                        
                    }

                    
                }
                .onAppear {
                    viewModel.checkLocationEnabled()
                }
                Picker("Line", selection: $lineDisplayed) {
                                Text("Line 1").tag(0)
                                Text("Line 2A").tag(1)
                                Text("Line 7").tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
            }
            .alert("Please grant location access to the app", isPresented: $locationAlert){
                Button("OK", role: .cancel){}
            }
            .navigationBarTitle("Station Map")
        }
    }
    func triggerAlert(){
        locationAlert.toggle()
    }
}

struct StationMapView_Previews: PreviewProvider {
    static var previews: some View {
        StationMapView()
    }
    
}


final class ContentViewModel : NSObject, ObservableObject, CLLocationManagerDelegate{
    
    var alert = UIAlertController(title: "test title",
                message: "test message",
                preferredStyle: .alert)
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.18801, longitude: 72.86574), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
    var locationManager : CLLocationManager?
    
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("error")
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
            print("error")
        case .denied:
            print("error")
        case .authorizedAlways,.authorizedWhenInUse:
            print("success")
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
    
    
}

