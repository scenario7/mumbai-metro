//
//  MetroListView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct MetroListView: View {
    
    @State var showingContactsBar = false
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    @State var animationValue = 0
    
    @Environment(\.openURL) private  var openURL
    var emergencyContacts = [
    Contact(title: "Women's Safety", number: 18008890808),
    Contact(title: "Mumbai Police", number: 100),
    Contact(title: "Fire Emergency", number: 101),
    Contact(title: "Ambulance", number: 102),
    Contact(title: "Mumbai Metro One", number: 02233789895),
    Contact(title: "Line 1 & 7", number: 18008890505)
    ]
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().poppinsSemiBold, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView {
            let columns = [
                    GridItem(.adaptive(minimum: 200)),
                ]
            ZStack(alignment:.bottom) {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                HStack(spacing:0) {
                    Image("metroAnimation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50,alignment: .center)
                    Image("metroAnimation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50,alignment: .center)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
                .animation(.easeInOut(duration: 5))
                .offset(x: animationValue % 2==0 ? -500 : 500)
                VStack(alignment:.leading) {
                    LazyVGrid(columns: columns,alignment: .leading, spacing: 60) {
                            ForEach(linesPublished){ line in
                                ZStack(alignment:.leading) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 0)
                                        .foregroundColor(.blue)
                                        .background {
                                            LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .leading, endPoint: .trailing)
                                                .mask {
                                                    RoundedRectangle(cornerRadius: 15)
                                                }
                                        }
                                    HStack(spacing:20){
                                        ZStack{
                                            Circle()
                                                .frame(width: 35, height: 50, alignment: .leading)
                                                .foregroundColor(line.color)
                                            Text(line.name)
                                                .font(.system(size: 15, weight: .bold, design: .default))
                                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                                .foregroundColor(.white)
                                        }
                                        Text("Line \(line.name)")
                                            .font(Font.custom(Constants().font, size: 18))
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))
                                        Spacer()
                                        NavigationLink(destination: LineView(line: line)) {
                                            ZStack {
                                                Circle()
                                                    .stroke(lineWidth: 1)
                                                    .foregroundColor(Color(red: 0.156, green: 0.771, blue: 0.981))
                                                    .shadow(color: Color(red: 0.156, green: 0.771, blue: 0.981), radius: 5, x: 0, y: 0)
                                                    .frame(width: 30, height: 30, alignment: .center)
                                                    .opacity(0.7)
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                                .frame(width: 250, height: 50, alignment: .center)

                            }
                        }
                    .padding()
                .padding(.top, 40)
                    Spacer()
                    HStack(alignment:.top) {
                        Rectangle()
                            .frame(width: showingContactsBar == true ? 0 : 270)
                            .opacity(0)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment:.top,spacing:30){
                                ForEach(emergencyContacts){ contact in
                                    VStack {
                                        Button {
                                            openURL(URL(string: "tel:\(contact.number)")!)
                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .frame(height:45)
                                                    .foregroundColor(.white)
                                                Image(systemName: "phone.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:20,height: 25)
                                                    .foregroundColor(.red)
                                            }
                                        }

                                        Text(contact.title)
                                            .font(.system(size: 12, weight: .semibold, design: .default))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                    .frame(width:70, height:90)
                                }
                            }
                            .padding(.top,5)
                        }
                        .frame(width: showingContactsBar == true ? 270 : 0, height: 57)
                        
                        Button {
                            showingContactsBar.toggle()
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(height:60)
                                    .foregroundColor(showingContactsBar ? .red : .green)
                                    .shadow(color: showingContactsBar ? .red : .green, radius: 4, x: 0, y: 0)
                                Image(systemName: "phone")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:25,height: 25)
                                    .foregroundColor(.white)
                                    .rotationEffect(.degrees(showingContactsBar ? 135 : 0))
                            }
                        }
                    }
                    .animation(.easeInOut)
                    .frame(height:90, alignment: .center)
                    .edgesIgnoringSafeArea([.trailing, .leading])
                    .padding()
                }
                
            }
            .navigationBarTitle("Operational Lines")
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
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    animationValue+=1
                }
            }

        }
    }
}

struct MetroListView_Previews: PreviewProvider {
    static var previews: some View {
        MetroListView()
            .colorScheme(.dark)
    }
}
