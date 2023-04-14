//
//  InformationDetail.swift
//  TipAppSample
//
//  Created by 이재영 on 2023/03/18.
//

import SwiftUI

struct InformationDetail: View {
    var body: some View {
        List {
            VStack {
                Image(systemName: "hand.draw.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("iPhone 탐색하기")
                    .bold()
                    .font(.system(size : 22))
                    .padding(.vertical, 1)
                Text("제스처 및 버튼을 찾아보고 iPhone을 손쉽게 탐색해 보세요.")
                    .font(.system(size : 12))
            }
            .padding(.leading, 35)
            .frame(height: 150)
            .listRowSeparator(.hidden)
            .listRowBackground(LinearGradient(colors: [.blue, .gray], startPoint: .leading, endPoint: .trailing)
                .mask{
                    LinearGradient(gradient: Gradient(stops: [.init(color: .black, location: 0.3),
                                                              .init(color: .clear, location: 1.0)]),
                                   startPoint: .top, endPoint: .bottom)
                })
            
            NavigationLink {
                InformationExploreDetail()
            } label: {
                HStack {
                    Image(systemName: "bolt")
                    VStack {
                        Text("홈으로 바로 이동하기")
                        Text("홈 화면으로 이동하려면 화면 하단 가장자리를 쓸어올리세요.")
                    }
                }
            }
            
            NavigationLink {
                Text("앱 전환하기 상세")
            } label: {
                HStack {
                    Image(systemName: "bolt")
                    VStack {
                        Text("앱 전환하기")
                        Text("최근에 사용한 앱으로 돌아가려면 화면을 쓸어올리세요.")
                    }
                }
            }
            
            NavigationLink {
                Text("홈으로 바로 이동하기 상세")
            } label: {
                HStack {
                    Image(systemName: "bolt")
                    VStack {
                        Text("홈으로 바로 이동하기")
                        Text("홈 화면으로 이동하려면 화면 하단 가장자리를 쓸어올리세요.")
                    }
                }
            }
            
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InformationDetail_Previews: PreviewProvider {
    static var previews: some View {
        InformationDetail()
    }
}
