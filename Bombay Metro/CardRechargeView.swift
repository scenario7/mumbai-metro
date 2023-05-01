//
//  CardRechargeView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI
import WebKit

struct CardRechargeView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().poppinsSemiBold, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.topLeading) {
                Color("MainColor")
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators:false) {
                    VStack(alignment:.leading, spacing:30) {
                        VStack(alignment:.leading, spacing:20){
                        Text("Cards and Tickets")
                            .font(Font.custom(Constants().poppinsRegular, size:20))
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:20) {
                                NavigationLink {
                                    WebView(url: URL(string: "https://wa.me/+919670008889")!)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(Color(red:37/255,green:211/255,blue:102/255))
                                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 6)
                                        Text("Whatsapp Ticket Line 1")
                                            .font(Font.custom(Constants().poppinsMedium, size: 15))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                    }
                                    .frame(width: 120, height: 80, alignment: .center)
                                }
                                
                                
                                NavigationLink {
                                    WebView(url: URL(string: "https://www.reliancemumbaimetro.com/home-instacharge")!)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(.blue)
                                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 6)
                                        Text("Line 1 Card")
                                            .font(Font.custom(Constants().poppinsMedium, size: 15))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                    }
                                    .frame(width: 120, height: 80, alignment: .center)
                                }

                                NavigationLink {
                                    WebView(url: URL(string: "https://www.mmmocl.co.in/card-reload.html")!)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(.red)
                                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 6)
                                        Text("Line 2A/7 Card")
                                            .font(Font.custom(Constants().poppinsMedium, size: 15))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                    }
                                    .frame(width: 120, height: 80, alignment: .center)
                                }

                            }
                            .padding()
                        }
                        }
                        VStack(alignment:.leading, spacing:20){
                        Text("Station Layout")
                            .font(Font.custom(Constants().poppinsRegular, size:20))
                            .foregroundColor(.white)
                        VStack(spacing:10){
                            HStack{
                                Text("Level G")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                    .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.5))
                                Spacer()
                                Text("Entry/Exit via stairs, escalators and elevators")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Text("Level 1")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                    .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.75))
                                Spacer()
                                Text("Concourse and retail stores")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                Text("Level 2")
                                    .font(Font.custom(Constants().poppinsSemiBold, size: 20))
                                    .foregroundColor(Color(hue: 0, saturation: 0, brightness: 1))
                                Spacer()
                                Text("Platform")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        }
                        VStack(alignment:.leading, spacing:20){
                        Text("Do's and Dont's")
                            .font(Font.custom(Constants().poppinsRegular, size:20))
                            .foregroundColor(.white)
                        VStack(alignment:.leading){
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Do not litter the premises")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Do not spit on the platform or concourse")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Smoking is prohibited")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Stand behind the yellow line on the platform")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Take care of your belongings")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                            HStack {
                                Circle()
                                    .frame(width: 5, height: 5, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Make way for women, children and disabled")
                                    .font(Font.custom(Constants().poppinsRegular, size: 12))
                                .foregroundColor(.white)
                            }
                        }
                        }
                    }
                    .padding()
                .navigationBarTitle("Travel")
                }
            }
        }
    }
}

struct CardRechargeView_Previews: PreviewProvider {
    static var previews: some View {
        CardRechargeView()
    }
}
 
struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
