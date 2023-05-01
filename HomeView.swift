//
//  HomeView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 08/06/22.
//

import SwiftUI
import Firebase

struct HomeView : View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().poppinsSemiBold, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    
    var emergencyContacts = [
    Contact(title: "Women's Safety", number: 18008890808),
    Contact(title: "Police", number: 100),
    Contact(title: "Fire Emergency", number: 101),
    Contact(title: "Ambulance", number: 102),
    Contact(title: "Mumbai Metro One", number: 02233789895),
    Contact(title: "Line 2A & 7", number: 18008890505)
    ]
    
    var body: some View{
            NavigationView {
                VStack{
                    ZStack(alignment:.topLeading){
                        Rectangle()
                            .foregroundColor(Color("MainColor"))
                            .padding([.bottom], 60)
                            .ignoresSafeArea()
                        Rectangle()
                            .cornerRadius(60)
                            .foregroundColor(Color("MainColor"))
                        VStack(alignment:.leading){
                            Text("Operational Lines")
                                .font(Font.custom(Constants().poppinsRegular, size: 20))
                                .foregroundColor(.white)
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack(spacing:20) {
                                    ForEach(linesPublished){ line in
                                        LineCardView(line: line)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .onAppear(){
                        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
                            AnalyticsParameterScreenName: "\(HomeView.self)",
                            AnalyticsParameterScreenClass: "\(HomeView.self)",
                        ])
                    }
                    ZStack(alignment:.topLeading){
                        Rectangle()
                            .foregroundColor(Color("bgAdaptive"))
                        VStack(alignment:.leading){
                            Text("Emergency Contacts")
                                .font(Font.custom(Constants().poppinsRegular, size: 20))
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing:5){
                                    ForEach(emergencyContacts){ contact in
                                        EmergencyContactView(title: contact.title, number: contact.number)
                                    }
                                }
                            }
                            BannerAd(unitID: "ca-app-pub-6446002050162602/8554424042")
                            HStack {
                                Spacer()
                                VStack {
                                    Text("mumbai metro v1.1.1")
                                        .font(Font.custom(Constants().poppinsRegular, size: 13))
                                    Text("designed and developed by kevin thomas")
                                        .font(Font.custom(Constants().poppinsRegular, size: 10))
                                    .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showOnboarding.toggle()
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.white)
                        }

                    }
                }
            }
            .background {
                Color.white
                    .ignoresSafeArea()
            }
            .onAppear{
                TimeCalculateManager().calculateTime(line: line7, stationID: 7)
            }
    }
}

struct LineCardView : View {
    
    var line : Line
    
    var body: some View {
        ZStack(alignment:.topLeading) {
            line.bg
                .resizable()
                .mask {
                    RoundedRectangle(cornerRadius: 20)
                }
            VStack(alignment:.leading, spacing:10) {
                Text("Line \(line.name)")
                    .foregroundColor(.white)
                    .font(Font.custom(Constants().poppinsRegular, size: 20))
                Text("\(line.stations.first!.name)\nto\n\(line.stations.last!.name)")
                    .foregroundColor(.white)
                    .font(Font.custom(Constants().poppinsRegular, size: 11))
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                VStack(alignment:.trailing){
                    HStack {
                        Spacer()
                        NavigationLink(destination: LineView(line: line)) {
                            ZStack {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                .shadow(color: .black, radius: 2, x: 0, y: 0)
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.black)
                                    .padding(20)
                            }
                        }
                    }
                }
            }
            .padding([.top, .leading, .trailing])
        }
        .frame(width:140, height: 170, alignment: .center)

    }
}

struct EmergencyContactView : View {
    
    @Environment(\.openURL) private  var openURL
    
    var title : String
    var number : Int
    
    var body: some View {
        Button {
            openURL(URL(string: "tel:\(number)")!)
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("MainColor"))
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.custom(Constants().poppinsSemiBold, size: 10))
                    .foregroundColor(.white)
                    .padding(1)
            }
            .frame(width: 70, height: 70)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 3)
        }
        .padding(10)
    }
}


struct HomeView_Preview : PreviewProvider {
    static var previews: some View {
        HomeView()
            .colorScheme(.light)
            .previewDevice("")
    }
}
