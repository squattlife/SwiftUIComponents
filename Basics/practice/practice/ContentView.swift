//
//  ContentView.swift
//  practice
//
//  Created by 이재영 on 2023/02/19.
//

import SwiftUI

struct Friend {
    let name: String
    let pet: myPet?
}

enum myPet {
    case cat(String)
    case dog(String)
}

struct ContentView: View {
    var a: Friend = Friend(name: "jay", pet: myPet.cat("mori"))
    var b: Friend = Friend(name: "juno", pet: nil)
    
    @State var pet: String = "What's your pet?"
    
    var body: some View {
        VStack {
            Text(pet)
            Button {
                if let petName = a.pet {
                    switch petName {
                    case .dog(let nickName):
                        pet = nickName
                    case .cat(let nickName):
                        pet = nickName
                    }
                } else {
                    pet = "no pet"
                }
                
            } label: {
                Text("Push")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
