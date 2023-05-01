//
//  InformationView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 03/05/22.
//

import SwiftUI

struct InformationView: View {
    
    @Environment(\.openURL) private  var openURL
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().poppinsSemiBold, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.topLeading){
                Color("MainColor")
                    .ignoresSafeArea()
                VStack(alignment:.leading, spacing: 30){
                    Text("This app or its creator is not affiliated with any metro operator or governing agency. This is purely an app created for the purpose of assiting commuters with travelling in Mumbai.")
                        .foregroundColor(.white)
                        .font(Font.custom(Constants().poppinsRegular, size: 17))
                    Button {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        openURL(URL(string: "https://drive.google.com/file/d/1vWdes2tj6kB_RSWZa6tdGLLyJmo1G-5s/view?usp=sharing")!)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(.white)
                            HStack {
                                Text("Privacy Policy")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 15))
                                    .foregroundColor(.black)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                        }
                    }


                    Button {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        openURL(URL(string: "https://drive.google.com/file/d/1Xt3suMFnX7hR2goKhQluzwgKVc5xmKU9/view?usp=sharing")!)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 45, alignment: .center)
                                .foregroundColor(.white)
                            HStack {
                                Text("T&C")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 15))
                                    .foregroundColor(.black)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
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
