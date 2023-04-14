//
//  InformationExploreDetail.swift
//  TipAppSample
//
//  Created by 이재영 on 2023/03/19.
//

import SwiftUI

struct InformationExploreDetail: View {
    var body: some View {
        VStack {
            Image(systemName: "bolt")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding()
            
            Text("홈으로 바로 이동하기")
                .bold()
                .font(.system(size: 27))
                .padding()
            Text("홈 화면으로 이동하려면 화면 하단 가장자리를 쓸어올리세요")
                .font(.system(size: 18))
            
        }
        .navigationTitle("탐색하기")
        .toolbar {
            Button {
                // button clicked
            } label: {
                Image(systemName: "bookmark")
            }

        }
    }
}

struct InformationExploreDetail_Previews: PreviewProvider {
    static var previews: some View {
        InformationExploreDetail()
    }
}
