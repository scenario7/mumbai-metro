//
//  ContentView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct ContentView: View {
    
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
        }
        .tint(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
