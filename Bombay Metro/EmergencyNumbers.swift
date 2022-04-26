//
//  EmergencyNumbers.swift
//  Bombay Metro
//
//  Created by Kevin Thomas on 16/04/22.
//

import SwiftUI

struct EmergencyNumbers: View {
    
    @Environment(\.openURL) private  var openURL
    
    var emergencyContacts = [
    Contact(title: "Women's Safety Helpine", number: 103),
    Contact(title: "Mumbai Police", number: 100),
    Contact(title: "Fire Emergency", number: 101),
    Contact(title: "Ambulance", number: 102),
    Contact(title: "Mumbai Metro One", number: 02233789895)
    ]
    
    var body: some View {
        List(emergencyContacts){ contact in
            HStack {
                Text(contact.title)
                Spacer()
                Image(systemName: "phone")
                    .foregroundColor(.red)
                    .onTapGesture {
                        openURL(URL(string: "tel:\(contact.number)")!)
                    }
            }
            .navigationBarTitle("Emergency Numbers")
        }
    }
}

struct EmergencyNumbers_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyNumbers()
    }
}
