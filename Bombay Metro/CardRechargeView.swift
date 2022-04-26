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
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().font, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                WebView(url: URL(string: "https://www.reliancemumbaimetro.com/home-instacharge")!)
                    .navigationBarTitle("Card Recharge")
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
