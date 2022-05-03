//
//  OnboardingView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 03/05/22.
//

import SwiftUI


struct OnboardingView : View {
    
    @Binding var showOnboarding : Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            TabView {
                OnboardingPage(icon: "tram", image: "homeScreen", title: "Home Page", description: "This is the home page. You can find all the information relating to every operational line on the Mumbai Metro Network here.",showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "phone.fill", image: "emergencyNumbers", title: "Emergency Contacts", description: "Access all the emergency contacts tapping the phone icon and scrolling.",showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "map", image: "mapView", title: "Station Map", description: "View all the stations on a map for the selected line by visiting the Map tab.",showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "indianrupeesign.square", image: "fareCalculator", title: "Fare Calculator", description: "Calculate travel fares by entering the departure and destination on the Fare tab and then clicking calculate.", showDismissButton: true, showOnboarding : $showOnboarding)

            }
            .tabViewStyle(PageTabViewStyle())
            .navigationBarHidden(true)
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(showOnboarding: true)
//            .colorScheme(.light)
//    }
//}

struct OnboardingPage : View {
    
    var icon : String
    var image : String
    var title : String
    var description : String
    var showDismissButton : Bool
    
    @Binding var showOnboarding : Bool
        
    var body: some View {
        ZStack {
            VStack(spacing:30){
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                Text(title)
                    .font(Font.custom(Constants().font, size: 30))
                    .foregroundColor(.white)
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                if showDismissButton{
                    Button {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        showOnboarding.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(Constants().lightBlue)
                            HStack {
                                Text("Get Started")
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                            }
                        }

                    }

                }
            }
            .padding()
        }
    }
}
