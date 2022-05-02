//
//  ContentView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    
    init(){
        UITabBar.appearance().isOpaque = false
        UITabBar.appearance().backgroundColor = UIColor(named: "DarkBlue")
        UITabBar.appearance().tintColor = UIColor(Constants().lightBlue)
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView{
            MetroListView()
                .tabItem{
                    VStack{
                        Image(systemName:"tram")
                        Text("Lines")
                    }
                }
            CardRechargeView()
                .tabItem {
                    VStack{
                        Image(systemName: "creditcard")
                        Text("Card Recharge")
                    }
                }
            StationMapView()
                .tabItem {
                    VStack{
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
            FareView()
                .tabItem {
                    VStack{
                        Image(systemName: "indianrupeesign.square")
                        Text("Fare")
                    }
                }
            InformationView()
                .tabItem {
                    VStack{
                        Image(systemName: "info.circle.fill")
                        Text("Info")
                    }
                }
        }
        .tint(.white)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
