//
//  InformationView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 03/05/22.
//

import SwiftUI

struct InformationView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().font, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.topLeading){
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack(alignment:.leading, spacing: 30){
                    Text("This app or its creator is not affiliated with any metro operator or governing agency. This is purely an app created for the purpose of assiting commuters with travelling in Mumbai.")
                        .foregroundColor(.white)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 45, alignment: .center)
                            .foregroundColor(Constants().lightBlue)
                        HStack {
                            Text("Privacy Policy")
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                        }
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 45, alignment: .center)
                            .foregroundColor(Constants().lightBlue)
                        HStack {
                            Text("T&C")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                        }
                    }

                }
                .padding()
            }
            .navigationTitle("Information")
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
