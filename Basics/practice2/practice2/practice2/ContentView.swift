//
//  ContentView.swift
//  practice2
//
//  Created by 이재영 on 2023/02/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var userID: String = ""
    @State var userPW: String = ""
    @State var hasLoggedIn: Bool = false
    @State var hasShownPassword: Bool = false

    var body: some View {
        VStack {
            HStack {
                Label {
                    
                } icon: {
                    Image(systemName: "person.fill")
                }
                TextField("enter ID", text: $userID)
            }
            Divider()
            HStack {
                Label {

                } icon: {
                    Image(systemName: "lock.fill")
                }
                if hasShownPassword {
                    TextField("enter Password", text: $userPW)
                } else {
                    SecureField("enter Password", text: $userPW)
                }
                
                Toggle(isOn: $hasShownPassword) {

                }
            }

            Button {
                if userPW == "1234" {
                    hasLoggedIn = true
                } else {
                    hasLoggedIn = false
                }
            } label: {
                Text("login")
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $hasLoggedIn, content: {
            Text("Hello Welcome \(userID)")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
