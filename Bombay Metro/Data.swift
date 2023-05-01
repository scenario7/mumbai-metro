//
//  Data.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI
import MapKit


let linesPublished = [line1, line2A, line7]
    

struct Line : Identifiable, Equatable{
    static func == (lhs: Line, rhs: Line) -> Bool {
        return lhs.id == rhs.id
    }
    
    var name : String
    var stations : [Station]
    var color : Color
    var id : String {
        return name
    }
    var operatedBy : String
    var operationBeginsAt : Date
    var operationEndsAt : Date
    var intervalAvailible : Bool
    var bg : Image
}

struct Station : Identifiable {
    var id : Int
    var name : String
    var coordinates : CLLocationCoordinate2D
    var secToNext : Int?
    var busList : [String]
}

struct Contact : Identifiable {
    var id : Int {
        return number
    }
    var title : String
    var number : Int
}

var line2AStations = [
    Station(id: 15, name: "Anand Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.25727, longitude: 72.86590), secToNext: 147, busList: ["207","C-12", "209"]),
    Station(id: 16, name: "Kanderpada", coordinates: CLLocationCoordinate2D(latitude: 19.25658, longitude: 72.85014), secToNext: 91, busList: ["A240","A245","C-12"]),
    Station(id: 17, name: "Mandapeshwar", coordinates: CLLocationCoordinate2D(latitude: 19.24983, longitude: 72.84573), secToNext: 110, busList: ["A245", "C-12"]),
    Station(id: 18, name: "Eksar Road", coordinates: CLLocationCoordinate2D(latitude: 19.24041, longitude: 72.84337), secToNext: 86, busList: ["C-12"]),
    Station(id: 19, name: "Borivali West", coordinates: CLLocationCoordinate2D(latitude: 19.23140, longitude: 72.84085), secToNext: 85, busList: ["C-12","244","A202","246","A247","277","461LTD","224","226LTD","720"]),
    Station(id: 20, name: "Pahadi Eksar", coordinates: CLLocationCoordinate2D(latitude: 19.22327, longitude: 72.84084), secToNext: 87, busList: ["A294", "A247"]),
    Station(id: 21, name: "Kandivali West", coordinates: CLLocationCoordinate2D(latitude: 19.21434, longitude: 72.83752), secToNext: 75, busList: ["223LTD", "A296", "280", "C-12"]),
    Station(id: 22, name: "Dahanukarvadi", coordinates: CLLocationCoordinate2D(latitude: 19.20600, longitude: 72.83474), busList: ["204", "223LTD", "C-12", "244","281","460LTD","207","286","A206","246"]),
    Station(id: 23, name: "Valnai", coordinates: CLLocationCoordinate2D(latitude: 19.19696, longitude: 72.83384), busList: ["210LTD","243","270","271","272","281","707LTD","A273","A345","A622"]),
    Station(id: 24, name: "Malad West", coordinates: CLLocationCoordinate2D(latitude: 19.18532, longitude: 72.83589), busList: ["79","204","210LTD","223LTD","224","241","259","459LTD","707LTD","A180","A256","A359","A456","A620","C-12"]),
    Station(id: 25, name: "Lower Malad", coordinates: CLLocationCoordinate2D(latitude: 19.17299, longitude: 72.83647), busList: ["79","182","204","205","210LTD","223LTD","224","241","259","262","454","707LTD","A180","A256","C-12"]),
    Station(id: 26, name: "Pahadi Goregaon", coordinates: CLLocationCoordinate2D(latitude: 19.16237, longitude: 72.83486), busList: ["79","182","204","205","210LTD","223LTD","224","241","259","262","454","707LTD","A180","A256","C-12"]),
    Station(id: 27, name: "Goregaon West", coordinates: CLLocationCoordinate2D(latitude: 19.15320, longitude: 72.83571), busList: ["4LTD","79","84LTD","182","205","210LTD","223LTD","224","259","290LTD","424","454","A32","A180","A202","C-12","C-33"]),
    Station(id: 28, name: "Oshiwara", coordinates: CLLocationCoordinate2D(latitude: 19.14606, longitude: 72.83394), busList: ["79","210LTD","223LTD","224","241","259","424","454","A32","A234","C-12","C-33"]),
    Station(id: 29, name: "Lower Oshiwara", coordinates: CLLocationCoordinate2D(latitude: 19.14058, longitude: 72.83170), busList: ["210LTD","223LTD","224","241","242","259","454","A32","A235","A268","C-12","C-33"]),
    Station(id: 30, name: "DN Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12911, longitude: 72.83144), busList: ["79","210LTD","223LTD","251","266","424","425","454","A32","A249","A252","A266"])
]
var line7Stations = [
    Station(id: 1, name: "Gundavali", coordinates: CLLocationCoordinate2D(latitude: 19.11490, longitude: 72.85517), busList: ["7","40EXT","182","348LTD","424","470LTD","488LTD","A72","A180","A359","A488","C-15","C-40","C-71","C-440"]),
    Station(id: 2, name: "Mogra", coordinates: CLLocationCoordinate2D(latitude: 19.12856, longitude: 72.85546), busList: ["7","40EXT","182","290LTD","348LTD","424","470LTD","488LTD","A72","A180","A488","C-15","C-40","C-71","C-440"]),
    Station(id: 3, name: "Jogeshwari East", coordinates: CLLocationCoordinate2D(latitude: 19.14297, longitude: 72.85518), busList: ["7","125AC","225","226LTD","348LTD","349","459LTD","461LTD","464LTD","469LTD","470LTD","488LTD","498LTD","523LTD","524LTD","706LTD","A72","A449","A488","C-15","C-40","C-71","C-440"]),
    Station(id: 4, name: "Goregaon East", coordinates: CLLocationCoordinate2D(latitude: 19.15232, longitude: 72.85655), busList: ["7","125AC","225","226LTD","348LTD","349","459LTD","464LTD","469LTD","470LTD","488LTD","498LTD","523LTD","524LTD","706LTD","A72","A449","A488","C-15","C-40","C-71"]),
    Station(id: 5, name: "Aarey", coordinates: CLLocationCoordinate2D(latitude: 19.16922, longitude: 72.85871), secToNext: 122, busList: ["346","343","348LTD","344","461LTD", "C-440","706LTD","7","28","125AC","225","226LTD","326","327","349","398LTD","440LTD","459LTD","460LTD","469LTD","470LTD","478LTD","488LTD","489LTD","498LTD","523LTD","524LTD","A60","A440","A449","A488","C-15","C-40","C-71"]),
    Station(id: 6, name: "Dindoshi", coordinates: CLLocationCoordinate2D(latitude: 19.17965, longitude: 72.85816), secToNext: 86, busList: ["460LTD","461LTD","705LTD","18","478LTD","440LTD","A440","470LTD","A345","C-71","28","125AC","706LTD"]),
    Station(id: 7, name: "Kurar", coordinates: CLLocationCoordinate2D(latitude: 19.18650, longitude: 72.85844), secToNext: 120, busList: ["461LTD","C-440","706LTD","478LTD","C-72","498LTD","226LTD","440LTD","A60","7","18","125AC","460LTD","470LTD","524LTD","A440","C-71"]),
    Station(id: 8, name: "Akurli", coordinates: CLLocationCoordinate2D(latitude: 19.19849, longitude: 72.86058), secToNext: 65, busList: ["C-718","226LTD","524LTD","C-440","461LTD","7","18","28","125AC","440LTD","470LTD","478LTD","498LTD","705LTD","706LTD","A60","A440","C-71","C-72"]),
    Station(id: 9, name: "Poisar", coordinates: CLLocationCoordinate2D(latitude: 19.20387, longitude: 72.86332), secToNext: 123, busList: ["C-718","226LTD","A287","524LTD","A300","C-440","7","18","28","125AC","440LTD","461LTD","470LTD","478LTD","498LTD","701LTD","705LTD","706LTD","A60","A440","C-71","C-72"]),
    Station(id: 10, name: "Magathane", coordinates: CLLocationCoordinate2D(latitude: 19.21711, longitude: 72.86674), secToNext: 70, busList: ["C-718","226LTD","524LTD","C-440","703LTD","209","7","18","28","125AC","223LTD","440LTD","461LTD","470LTD","478LTD","498LTD","701LTD","705LTD","A60","A440","A479","A629","C-71","C-72"]),
    Station(id: 11, name: "Devipada", coordinates: CLLocationCoordinate2D(latitude: 19.22418, longitude: 72.86424), secToNext: 110, busList: ["709LTD","C-718","C-700","524LTD","7","18","28","125AC","209","440LTD","470LTD","478LTD","498LTD","701LTD","702LTD","703LTD","705LTD","706LTD","710LTD","A60","A293","A440","A629","C-71","C-72","C440"]),
    Station(id: 12, name: "Rashtriya Udyan", coordinates: CLLocationCoordinate2D(latitude: 19.23468, longitude: 72.86314), secToNext: 110, busList: ["A297","A298","C-718","700LTD","C-700","7","28","65AC","66","131AC","706LTD","A293","A301","A477","A698","C-71","C-72"]),
    Station(id: 13, name: "Ovaripada", coordinates: CLLocationCoordinate2D(latitude: 19.24335, longitude: 72.86412), secToNext: 85, busList: ["A298","C-718","A297","700LTD","C-700","7","28","65AC","66","131AC","706LTD","A293","A301","A477","A698","C-71","C-72"]),
    Station(id: 14, name: "Dahisar East", coordinates: CLLocationCoordinate2D(latitude: 19.25112, longitude: 72.86711), secToNext: 97, busList: ["C-718", "C-700","700LTD","66","7","28","706LTD", "65AC","131AC","C-71","C-72","A297","A696"])
]

var line2A7Stations = line7Stations + line2AStations

var line1Stations = [
    Station(id: 1, name: "Ghatkopar", coordinates: CLLocationCoordinate2D(latitude: 19.08680, longitude: 72.90806), busList: ["340", "A340", "410", "387", "A416", "386", "470LTD", "A334"]),
    Station(id: 2, name: "Jagruti Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.09245, longitude: 72.90188), busList: ["A340", "340", "410", "A421", "331", "470LTD", "A334"]),
    Station(id: 3, name: "Asalpha", coordinates: CLLocationCoordinate2D(latitude: 19.09634, longitude: 72.89479), busList: ["340", "A340", "226LTD", "321LTD", "A334", "A325", "331", "410", "470LTD"]),
    Station(id: 4, name: "Saki Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10346, longitude: 72.88801), busList: ["340", "A340", "226LTD", "321LTD", "A334", "A325", "331", "410", "470LTD"]),
    Station(id: 5, name: "Marol Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10808, longitude: 72.87940), busList: ["A884", "340", "332", "A340", "422", "308", "226LTD", "321LTD", "331", "335", "365", "392", "396LTD", "409LTD", "410", "424", "470LTD", "488LTD", "533LTD", "A185", "A332", "A359", "A382", "A488"]),
    Station(id: 6, name: "Airport Road", coordinates: CLLocationCoordinate2D(latitude: 19.11030, longitude: 72.87424), busList: ["332", "340", "A340", "335", "A443", "410", "226LTD", "290LTD", "328", "392", "396LTD", "422", "424", "470LTD", "488LTD", "533LTD", "A185", "A186", "A332", "A359", "A488"]),
    Station(id: 7, name: "Chakala", coordinates: CLLocationCoordinate2D(latitude: 19.11218, longitude: 72.86710), busList: ["340", "332", "A340", "422", "355", "226LTD", "290LTD", "328", "392", "396LTD", "410", "424", "470LTDD", "488LTD", "533LTD", "A185", "A186", "A332", "A359", "A443", "A488"]),
    Station(id: 8, name: "Western Express Highway", coordinates: CLLocationCoordinate2D(latitude: 19.11592, longitude: 72.85640), busList: ["348LTD", "A180", "C-15", "424", "C-440", "A488", "488LTD", "7", "28", "182", "440LTD", "470LTD", "A359", "A440", "C-40", "C-71", "C-17"]),
    Station(id: 9, name: "Andheri", coordinates: CLLocationCoordinate2D(latitude: 19.12058, longitude: 72.84874), busList: ["332", "A340", "333", "496LTD", "7", "28", "144-EL", "392", "A186", "A332"]),
    Station(id: 10, name: "Azad Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12690, longitude: 72.83760), busList: ["251", "A249", "259", "A254", "254", "A252", "266", "A235", "242", "424", "425", "A266", "A268"]),
    Station(id: 11, name: "D.N. Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12828, longitude: 72.83028), busList: ["266","251","A249","A252","210LTD","A32","425","A266","79","223LTD","424","454"]),
    Station(id: 12, name: "Versova", coordinates: CLLocationCoordinate2D(latitude: 19.13051, longitude: 72.82144), busList: ["425","454","223LTD","251","A251","A249","210LTD","A234","A32","200"])
]

//var allStations = [
//    Station(id: 30, name: "Ghatkopar", coordinates: CLLocationCoordinate2D(latitude: 19.08680, longitude: 72.90806)),
//    Station(id: 29, name: "Jagruti Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.09245, longitude: 72.90188)),
//    Station(id: 28, name: "Asalpha", coordinates: CLLocationCoordinate2D(latitude: 19.09634, longitude: 72.89479)),
//    Station(id: 27, name: "Saki Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10346, longitude: 72.88801)),
//    Station(id: 26, name: "Marol Naka", coordinates: CLLocationCoordinate2D(latitude: 19.10808, longitude: 72.87940)),
//    Station(id: 25, name: "Airport Road", coordinates: CLLocationCoordinate2D(latitude: 19.11030, longitude: 72.87424)),
//    Station(id: 24, name: "Chakala", coordinates: CLLocationCoordinate2D(latitude: 19.11218, longitude: 72.86710)),
//    Station(id: 23, name: "Western Express Highway", coordinates: CLLocationCoordinate2D(latitude: 19.11592, longitude: 72.85640)),
//    Station(id: 22, name: "Andheri", coordinates: CLLocationCoordinate2D(latitude: 19.12058, longitude: 72.84874)),
//    Station(id: 21, name: "Azad Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12690, longitude: 72.83760)),
//    Station(id: 20, name: "D.N. Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.12828, longitude: 72.83028)),
//    Station(id: 19, name: "Versova", coordinates: CLLocationCoordinate2D(latitude: 19.13051, longitude: 72.82144)),
//    Station(id: 18, name: "Dahanukarvadi", coordinates: CLLocationCoordinate2D(latitude: 19.20600, longitude: 72.83474)),
//    Station(id: 17, name: "Kandivali West", coordinates: CLLocationCoordinate2D(latitude: 19.21434, longitude: 72.83752)),
//    Station(id: 16, name: "Pahadi Eksar", coordinates: CLLocationCoordinate2D(latitude: 19.22327, longitude: 72.84084)),
//    Station(id: 15, name: "Borivali West", coordinates: CLLocationCoordinate2D(latitude: 19.23140, longitude: 72.84085)),
//    Station(id: 14, name: "Eksar Road", coordinates: CLLocationCoordinate2D(latitude: 19.24041, longitude: 72.84337)),
//    Station(id: 13, name: "Mandapeshwar", coordinates: CLLocationCoordinate2D(latitude: 19.24983, longitude: 72.84573)),
//    Station(id: 12, name: "Kanderpada", coordinates: CLLocationCoordinate2D(latitude: 19.25658, longitude: 72.85014)),
//    Station(id: 11, name: "Anand Nagar", coordinates: CLLocationCoordinate2D(latitude: 19.25727, longitude: 72.86590)),
//    Station(id: 10, name: "Dahisar East", coordinates: CLLocationCoordinate2D(latitude: 19.25112, longitude: 72.86711)),
//    Station(id: 9, name: "Ovaripada", coordinates: CLLocationCoordinate2D(latitude: 19.24335, longitude: 72.86412)),
//    Station(id: 8, name: "Rashtriya Udyan", coordinates: CLLocationCoordinate2D(latitude: 19.23468, longitude: 72.86314)),
//    Station(id: 7, name: "Devipada", coordinates: CLLocationCoordinate2D(latitude: 19.22418, longitude: 72.86424)),
//    Station(id: 6, name: "Magathane", coordinates: CLLocationCoordinate2D(latitude: 19.21711, longitude: 72.86674)),
//    Station(id: 5, name: "Poisar", coordinates: CLLocationCoordinate2D(latitude: 19.20387, longitude: 72.86332)),
//    Station(id: 4, name: "Akurli", coordinates: CLLocationCoordinate2D(latitude: 19.19849, longitude: 72.86058)),
//    Station(id: 3, name: "Kurar", coordinates: CLLocationCoordinate2D(latitude: 19.18650, longitude: 72.85844)),
//    Station(id: 2, name: "Dindoshi", coordinates: CLLocationCoordinate2D(latitude: 19.17965, longitude: 72.85816)),
//    Station(id: 1, name: "Aarey", coordinates: CLLocationCoordinate2D(latitude: 19.16922, longitude: 72.85871))
//]

let calendar = Calendar.current

var line1 = Line(name: "1", stations: line1Stations, color: .blue, operatedBy: "Reliance", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 30, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 23, minute: 25, second: 0, of: Date())!, intervalAvailible: false, bg: Image("BlueLineBG"))

var line2A = Line(name: "2A", stations: line2AStations, color: .yellow, operatedBy: "MMMOCL", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 20, minute: 36, second: 0, of: Date())!, intervalAvailible: false, bg: Image("YellowLineBG"))

var line7 = Line(name: "7", stations: line7Stations, color: .red, operatedBy: "MMMOCL", operationBeginsAt: calendar.date(bySettingHour: 6, minute: 24, second: 0, of: Date())!, operationEndsAt: calendar.date(bySettingHour: 21, minute: 24, second: 0, of: Date())!, intervalAvailible: false, bg: Image("RedLineBG"))

//var allLines = Line(name: "All", stations: allStations, color: .black, operatedBy: "Mumbai Metro", operationBeginsAt: Date(), operationEndsAt: Date(), intervalAvailible: false, bg: Image("BlueLineBG"))

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
/*Gundavali*/               [10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40,40,40,50,50,50,50,50,60,60,60,60],
/*Mogra*/                   [10,10,10,10,20,20,20,20,20,20,20,30,30,30,30,30,30,40,40,40,40,40,40,50,50,50,50,50,60,60],
/*Jogeshwari East*/         [20,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40,40,40,50,50,50,50,50,60],
/*Goregaon East*/           [20,10,10,10,10,20,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40,40,40,50,50,50,50,50],
/*Aarey*/                   [20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,30,40,40,40,40,40,50,50,50,50],
/*Dindoshi*/                [20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40,40,50,50,50],
/*Kurar*/                   [20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,30,40,40,40,40,40,50,50],
/*Akurli*/                  [20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,30,40,40,40,40,40,50],
/*Poisar*/                  [20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40,40,40],
/*Magathane*/               [20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40,40],
/*Devipada*/                [30,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40,40],
/*Rashtriya Udyan*/         [30,30,20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,40,40],
/*Ovaripada*/               [30,30,20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,20,30,30,30,30,30,40],
/*Dahisar East*/            [30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30,30],
/*Anand Nagar*/             [30,30,30,30,20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30,30],
/*Kanderpada*/              [40,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30,30],
/*Mandapeshwar*/            [40,30,30,30,30,20,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,30,30,30],
/*Eksar*/                   [40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20,20,30],
/*Borivali West*/           [40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20,20,30],
/*Pahadi Eksar*/            [40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20,20],
/*Kandivali West*/          [40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20,20,20],
/*Dahanukarwadi*/           [50,40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,10,20,20,20,20,20,20],
/*Valnai*/                  [50,40,40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20,20],
/*Malad West*/              [50,50,40,40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20,20],
/*Lower Malad*/             [50,50,50,40,40,40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20,20,20],
/*Pahadi Goregaon*/         [50,50,50,50,40,40,40,40,40,30,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,10,20],
/*Goregaon West*/           [60,50,50,50,50,40,40,40,40,40,30,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10,20],
/*Oshiwara*/                [60,50,50,50,50,50,40,40,40,40,40,30,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10],
/*Lower Oshiwara*/          [60,60,50,50,50,50,50,40,40,40,40,40,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10,10,10],
/*DN Nagar*/                [60,60,60,50,50,50,50,50,40,40,40,40,40,30,30,30,30,30,30,20,20,20,20,20,20,20,20,10,10,10],
]


class Constants {
    let font = "RoundedEleganceNew-Regular"
    let poppinsRegular = "Poppins-Regular"
    let poppinsMedium = "Poppins-Medium"
    let poppinsSemiBold = "Poppins-SemiBold"
    let lightBlue = Color(red: 0.156, green: 0.771, blue: 0.981)
}
