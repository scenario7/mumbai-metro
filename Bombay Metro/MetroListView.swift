//
//  MetroListView.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 07/04/22.
//

import SwiftUI

struct MetroListView: View {
    
    @State var showingContacts = false
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: Constants().font, size: 30)!, .foregroundColor : UIColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0))]
        
    }
    
    var body: some View {
        NavigationView {
            let columns = [
                    GridItem(.adaptive(minimum: 200)),
                ]
            ZStack(alignment:.topLeading) {
                LinearGradient(colors: [Color(red: 0.004, green: 0.02, blue: 0.206),Color(red: 0.006, green: 0.343, blue: 0.69)], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack {
                    LazyVGrid(columns: columns,alignment: .leading, spacing: 60) {
                            ForEach(linesPublished){ line in
                                ZStack(alignment:.leading) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.white)
                                    HStack(spacing:20){
                                        ZStack{
                                            Circle()
                                                .frame(width: 35, height: 50, alignment: .leading)
                                                .foregroundColor(line.color)
                                            Text(line.name)
                                                .font(.system(size: 15, weight: .black, design: .default))
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
                                    .sheet(isPresented: $showingContacts) {
                                                EmergencyNumbers()
                                            }
                                }
                                .frame(width: 250, height: 50, alignment: .center)

                            }
                        }
                    .padding()
                .padding(.top, 40)
                }
            }
            .toolbar(content: {
                Button {
                    showingContacts.toggle()
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                } label: {
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.red)
                        Image(systemName: "exclamationmark.shield.fill")
                            .foregroundColor(.red)
                    }
                }

            })
            .navigationBarTitle("Operational Lines")

        }
    }
}

struct MetroListView_Previews: PreviewProvider {
    static var previews: some View {
        MetroListView()
            .colorScheme(.dark)
    }
}
