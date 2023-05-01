//
//  ContentView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    @State private var selection = 3
    
    init(){
        UITabBar.appearance().isOpaque = false
        UITabBar.appearance().backgroundColor = UIColor(.black)
        UITabBar.appearance().tintColor = UIColor(named: "bgAdaptive")
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
    }
    
    var body: some View {
        TabView(selection:$selection){
            CardRechargeView()
                .tabItem {
                    VStack{
                        Image(systemName: "train.side.front.car")
                        Text("Travel")
                    }
                }
                .tag(1)
            StationMapView()
                .tabItem {
                    VStack{
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
                .tag(2)
            HomeView()
                .tabItem{
                    VStack{
                        Image(systemName:"house")
                        Text("Home")
                    }
                }
                .tag(3)
            FareView()
                .tabItem {
                    VStack{
                        Image(systemName: "indianrupeesign.square")
                        Text("Fare")
                    }
                }
                .tag(4)
            InformationView()
                .tabItem {
                    VStack{
                        Image(systemName: "info.circle.fill")
                        Text("Info")
                    }
                }
                .tag(5)
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
            .preferredColorScheme(.dark)
    }
}
