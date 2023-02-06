//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 이재영 on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageView()
            ButtonView()
            TextView()
            
            Spacer() // 빈 공간 채워넣음
        
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            
            Spacer() // 빈 공간 채워넣음
            
            ZStack {
                ImageView()
                ButtonView()
                TextView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
