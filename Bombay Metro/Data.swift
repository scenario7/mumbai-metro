//
//  Data.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI
import MapKit


let linesPublished = [line1, line2A, line7]
    

struct Line : Identifiable{
    var name : String
    var stations : [Station]
    var color : Color
    var id : String {
        return name
    }
    var operatedBy : String
    var operationBeginsAt : Date
    var operationEndsAt : Date
}

struct Station : Identifiable {
    var id : Int
    var name : String
    var coordinates : CLLocationCoordinate2D
}

struct Contact : Identifiable {
    var id : Int {
        return number
    }
    var title : String
    var number : Int
}

var line2AStations = [
    Station(id: 1, name: "Anand Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.25727, longitude: 72.86590)),
    Station(id: 2, name: "Kanderpada", coordinates: CLLocationCoordinate2D(latitude: 19.25658, longitude: 72.85014)),
    Station(id: 3, name: "I.C. Colony", coordinates: CLLocationCoordinate2D(latitude: 19.24983, longitude: 72.84573)),
    Station(id: 4, name: "Eksar Road", coordinates: CLLocationCoordinate2D(latitude: 19.24041, longitude: 72.84337)),
    Station(id: 5, name: "Don Bosco", coordinates: CLLocationCoordinate2D(latitude: 19.23140, longitude: 72.84085)),
    Station(id: 6, name: "Shimpoli", coordinates: CLLocationCoordinate2D(latitude: 19.22327, longitude: 72.84084)),
    Station(id: 7, name: "Kandivali West", coordinates: CLLocationCoordinate2D(latitude: 19.21434, longitude: 72.83752)),
    Station(id: 8, name: "Dahanukarvadi", coordinates: CLLocationCoordinate2D(latitude: 19.20600, longitude: 72.83474))
]
var line7Stations = [
    Station(id: 1, name: "Dahisar East", coordinates: CLLocationCoordinate2D(latitude: 19.25112, longitude: 72.86711)),
    Station(id: 2, name: "Ovaripada", coordinates: CLLocationCoordinate2D(latitude: 19.24335, longitude: 72.86412)),
    Station(id: 3, name: "Rashtriya Udyan", coordinates: CLLocationCoordinate2D(latitude: 19.23468, longitude: 72.86314)),
    Station(id: 4, name: "Devipada", coordinates: CLLocationCoordinate2D(latitude: 19.22418, longitude: 72.86424)),
    Station(id: 5, name: "Magathane", coordinates: CLLocationCoordinate2D(latitude: 19.21711, longitude: 72.86674)),
    Station(id: 6, name: "Poisar", coordinates: CLLocationCoordinate2D(latitude: 19.20387, longitude: 72.86332)),
    Station(id: 7, name: "Akurli", coordinates: CLLocationCoordinate2D(latitude: 19.19849, longitude: 72.86058)),
    Station(id: 8, name: "Kurar", coordinates: CLLocationCoordinate2D(latitude: 19.18650, longitude: 72.85844)),
    Station(id: 9, name: "Dindoshi", coordinates: CLLocationCoordinate2D(latitude: 19.17965, longitude: 72.85816)),
    Station(id: 10, name: "Aarey", coordinates: CLLocationCoordinate2D(latitude: 19.16922, longitude: 72.85871))
]

var line2A7Stations = [
    Station(id: 18, name: "Dahanukarvadi", coordinates: CLLocationCoordinate2D(latitude: 19.20600, longitude: 72.83474)),
    Station(id: 17, name: "Kandivali West", coordinates: CLLocationCoordinate2D(latitude: 19.21434, longitude: 72.83752)),
    Station(id: 16, name: "Shimpoli", coordinates: CLLocationCoordinate2D(latitude: 19.22327, longitude: 72.84084)),
    Station(id: 15, name: "Don Bosco", coordinates: CLLocationCoordinate2D(latitude: 19.23140, longitude: 72.84085)),
    Station(id: 14, name: "Eksar Road", coordinates: CLLocationCoordinate2D(latitude: 19.24041, longitude: 72.84337)),
    Station(id: 13, name: "I.C. Colony", coordinates: CLLocationCoordinate2D(latitude: 19.24983, longitude: 72.84573)),
    Station(id: 12, name: "Kanderpada", coordinates: CLLocationCoordinate2D(latitude: 19.25658, longitude: 72.85014)),
    Station(id: 11, name: "Anand Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.25727, longitude: 72.86590)),
    Station(id: 10, name: "Dahisar East", coordinates: CLLocationCoordinate2D(latitude: 19.25112, longitude: 72.86711)),
    Station(id: 9, name: "Ovaripada", coordinates: CLLocationCoordinate2D(latitude: 19.24335, longitude: 72.86412)),
    Station(id: 8, name: "Rashtriya Udyan", coordinates: CLLocationCoordinate2D(latitude: 19.23468, longitude: 72.86314)),
    Station(id: 7, name: "Devipada", coordinates: CLLocationCoordinate2D(latitude: 19.22418, longitude: 72.86424)),
    Station(id: 6, name: "Magathane", coordinates: CLLocationCoordinate2D(latitude: 19.21711, longitude: 72.86674)),
    Station(id: 5, name: "Poisar", coordinates: CLLocationCoordinate2D(latitude: 19.20387, longitude: 72.86332)),
    Station(id: 4, name: "Akurli", coordinates: CLLocationCoordinate2D(latitude: 19.19849, longitude: 72.86058)),
    Station(id: 3, name: "Kurar", coordinates: CLLocationCoordinate2D(latitude: 19.18650, longitude: 72.85844)),
    Station(id: 2, name: "Dindoshi", coordinates: CLLocationCoordinate2D(latitude: 19.17965, longitude: 72.85816)),
    Station(id: 1, name: "Aarey", coordinates: CLLocationCoordinate2D(latitude: 19.16922, longitude: 72.85871))

]

var line1Stations = [
    Station(id: 1, name: "Ghatkopar", coordinates: CLLocationCoordinate2D(latitude: 19.08680, longitude: 72.90806)),
    Station(id: 2, name: "Jagruti Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.09245, longitude: 72.90188)),
    Station(id: 3, name: "Asalpha", coordinates: CLLocationCoordinate2D(latitude: 19.09634, longitude: 72.89479)),
    Station(id: 4, name: "Saki Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10346, longitude: 72.88801)),
    Station(id: 5, name: "Marol Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10808, longitude: 72.87940)),
    Station(id: 6, name: "Airport Road", coordinates: CLLocationCoordinate2D(latitude: 19.11030, longitude: 72.87424)),
    Station(id: 7, name: "Chakala", coordinates: CLLocationCoordinate2D(latitude: 19.11218, longitude: 72.86710)),
    Station(id: 8, name: "Western Express Highway", coordinates: CLLocationCoordinate2D(latitude: 19.11592, longitude: 72.85640)),
    Station(id: 9, name: "Andheri", coordinates: CLLocationCoordinate2D(latitude: 19.12058, longitude: 72.84874)),
    Station(id: 10, name: "Azad Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12690, longitude: 72.83760)),
    Station(id: 11, name: "D.N. Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12828, longitude: 72.83028)),
    Station(id: 12, name: "Versova", coordinates: CLLocationCoordinate2D(latitude: 19.13051, longitude: 72.82144))
]

var allStations = [
    Station(id: 30, name: "Ghatkopar", coordinates: CLLocationCoordinate2D(latitude: 19.08680, longitude: 72.90806)),
    Station(id: 29, name: "Jagruti Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.09245, longitude: 72.90188)),
    Station(id: 28, name: "Asalpha", coordinates: CLLocationCoordinate2D(latitude: 19.09634, longitude: 72.89479)),
    Station(id: 27, name: "Saki Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10346, longitude: 72.88801)),
    Station(id: 26, name: "Marol Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10808, longitude: 72.87940)),
    Station(id: 25, name: "Airport Road", coordinates: CLLocationCoordinate2D(latitude: 19.11030, longitude: 72.87424)),
    Station(id: 24, name: "Chakala", coordinates: CLLocationCoordinate2D(latitude: 19.11218, longitude: 72.86710)),
    Station(id: 23, name: "Western Express Highway", coordinates: CLLocationCoordinate2D(latitude: 19.11592, longitude: 72.85640)),
    Station(id: 22, name: "Andheri", coordinates: CLLocationCoordinate2D(latitude: 19.12058, longitude: 72.84874)),
    Station(id: 21, name: "Azad Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12690, longitude: 72.83760)),
    Station(id: 20, name: "D.N. Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12828, longitude: 72.83028)),
    Station(id: 19, name: "Versova", coordinates: CLLocationCoordinate2D(latitude: 19.13051, longitude: 72.82144)),
    Station(id: 18, name: "Dahanukarvadi", coordinates: CLLocationCoordinate2D(latitude: 19.20600, longitude: 72.83474)),
    Station(id: 17, name: "Kandivali West", coordinates: CLLocationCoordinate2D(latitude: 19.21434, longitude: 72.83752)),
    Station(id: 16, name: "Shimpoli", coordinates: CLLocationCoordinate2D(latitude: 19.22327, longitude: 72.84084)),
    Station(id: 15, name: "Don Bosco", coordinates: CLLocationCoordinate2D(latitude: 19.23140, longitude: 72.84085)),
    Station(id: 14, name: "Eksar Road", coordinates: CLLocationCoordinate2D(latitude: 19.24041, longitude: 72.84337)),
    Station(id: 13, name: "I.C. Colony", coordinates: CLLocationCoordinate2D(latitude: 19.24983, longitude: 72.84573)),
    Station(id: 12, name: "Kanderpada", coordinates: CLLocationCoordinate2D(latitude: 19.25658, longitude: 72.85014)),
    Station(id: 11, name: "Anand Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.25727, longitude: 72.86590)),
    Station(id: 10, name: "Dahisar East", coordinates: CLLocationCoordinate2D(latitude: 19.25112, longitude: 72.86711)),
    Station(id: 9, name: "Ovaripada", coordinates: CLLocationCoordinate2D(latitude: 19.24335, longitude: 72.86412)),
    Station(id: 8, name: "Rashtriya Udyan", coordinates: CLLocationCoordinate2D(latitude: 19.23468, longitude: 72.86314)),
    Station(id: 7, name: "Devipada", coordinates: CLLocationCoordinate2D(latitude: 19.22418, longitude: 72.86424)),
    Station(id: 6, name: "Magathane", coordinates: CLLocationCoordinate2D(latitude: 19.21711, longitude: 72.86674)),
    Station(id: 5, name: "Poisar", coordinates: CLLocationCoordinate2D(latitude: 19.20387, longitude: 72.86332)),
    Station(id: 4, name: "Akurli", coordinates: CLLocationCoordinate2D(latitude: 19.19849, longitude: 72.86058)),
    Station(id: 3, name: "Kurar", coordinates: CLLocationCoordinate2D(latitude: 19.18650, longitude: 72.85844)),
    Station(id: 2, name: "Dindoshi", coordinates: CLLocationCoordinate2D(latitude: 19.17965, longitude: 72.85816)),
    Station(id: 1, name: "Aarey", coordinates: CLLocationCoordinate2D(latitude: 19.16922, longitude: 72.85871))
]

let calendar = Calendar.current

var line1 = Line(name: "1", stations: line1Stations, color: .blue, operatedBy: "Reliance", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 30, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 23, minute: 25, second: 0, of: Date())!)

var line2A = Line(name: "2A", stations: line2AStations, color: .yellow, operatedBy: "MMRDA", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 13, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 20, minute: 49, second: 0, of: Date())!)

var line7 = Line(name: "7", stations: line7Stations, color: .red, operatedBy: "MMRDA", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 50, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 21, minute: 45, second: 0, of: Date())!)

var allLines = Line(name: "All", stations: allStations, color: .black, operatedBy: "Mumbai Metro", operationBeginsAt: Date(), operationEndsAt: Date())

func colorFinder(id : Int) -> Color{
    if (id>=1 || id<=10){
        return .red
    } else if(id>10 || id<=18){
        return .yellow
    } else {
        return .blue
    }
}

var line1Fare = [
    [10,10,20,20,20,30,30,30,30,40,40,40],
    [10,10,10,20,20,20,30,30,30,30,40,40],
    [20,10,10,10,20,20,20,20,30,30,30,40],
    [20,20,10,10,10,20,20,20,20,30,30,30],
    [20,20,20,10,10,10,20,20,20,20,30,30],
    [30,20,20,20,10,10,10,10,20,20,20,30],
    [30,30,20,20,20,10,10,10,10,20,20,20],
    [30,30,20,20,20,10,10,10,10,20,20,20],
    [30,30,30,20,20,20,10,10,10,10,10,20],
    [40,30,30,30,20,20,20,20,10,10,10,10],
    [40,40,30,30,30,20,20,20,10,10,10,10],
    [40,40,40,30,30,30,20,20,20,10,10,10]
]

var line2A7Fare = [
[10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,30,40],
[10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30],
[10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30],
[20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30],
[20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30],
[20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30],
[20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,20],
[20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20],
[20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20],
[20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20],
[20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20],
[30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20],
[30,20,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20],
[30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20],
[30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,10],
[30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10],
[30,30,30,30,30,20,20,20,20,20,20,20,20,20,10,10,10,10],
[40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10]
]


class Constants {
    let font = "RoundedEleganceNew-Regular"
    let lightBlue = Color(red: 0.156, green: 0.771, blue: 0.981)
}
