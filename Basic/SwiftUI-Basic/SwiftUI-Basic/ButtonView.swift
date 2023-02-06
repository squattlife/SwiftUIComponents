//
//  ButtonView.swift
//  SwiftUI-Basic
//
//  Created by 이재영 on 2023/02/06.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("button Tapped")
        } label: {
            Text("click me")
        }

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
