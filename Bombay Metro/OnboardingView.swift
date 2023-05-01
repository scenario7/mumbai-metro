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
            Color("MainColor")
                .ignoresSafeArea()
            TabView {
                OnboardingPage(icon: "house", image: "homeScreen", title: "Home Page", description: "This is the home page where you can find all the important features at one place.",showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "clock", image: "stationInfo", title: "Station Info", description: "View Station related info, including arrival timing estimates and navigate to stations.",showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "indianrupeesign.square", image: "fareCalculator", title: "Fare Calculator", description: "Calculate travel fares by entering the departure and destination on the Fare tab and then clicking calculate.", showDismissButton: false, showOnboarding : $showOnboarding)
                OnboardingPage(icon: "train.side.front.car", image: "travelInfo", title: "Travel", description: "Book tickets, recharge cards and do more from the new Travel page.",showDismissButton: true, showOnboarding : $showOnboarding)

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
                    .font(Font.custom(Constants().poppinsSemiBold, size: 30))
                    .foregroundColor(.white)
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(Font.custom(Constants().poppinsRegular, size: 20))
                if showDismissButton{
                    Button {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        showOnboarding.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(.white)
                            HStack {
                                Text("Get Started")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                    .foregroundColor(.black)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                        }

                    }

                }
            }
            .padding()
        }
    }
}
