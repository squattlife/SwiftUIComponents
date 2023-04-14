//
//  ContentView.swift
//  TipAppSample
//
//  Created by 이재영 on 2023/03/08.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ZStack {
                    Text("새로운 기능")
                        .bold()
                        .font(.system(size: 23))
                    Image(systemName: "") // 새로운 기능 - [ 배경 이미지 ]
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(height: 100)
                }
                    
                
                Section {
                    NavigationLink {
                        InformationDetail()
                    } label: {
                        Image(systemName: "hand.draw")
                            .resizable()
                            .foregroundStyle(.linearGradient(Gradient(colors: [.blue, .white]), startPoint: .leading, endPoint: .trailing))
                            .scaledToFit()
                            .frame(width: 20)
                        Text("iPhone 탐색하기")
                    }
                    
                    NavigationLink {
                        Text("사용자 정보 보호하기")
                    } label: {
                        Image(systemName: "lock.shield")
                            .resizable()
                            .foregroundStyle(.linearGradient(Gradient(colors: [.green, .white]), startPoint: .leading, endPoint: .trailing))
                            .scaledToFit()
                            .frame(width: 20)
                        Text("사용자 정보 보호하기")
                    }
                    
                    NavigationLink {
                        Text("대비하기")
                    } label: {
                        Image(systemName: "heart.text.square")
                            .resizable()
                            .foregroundStyle(.linearGradient(Gradient(colors: [.yellow, .white]), startPoint: .leading, endPoint: .trailing))
                            .scaledToFit()
                            .frame(width: 20)
                        Text("대비하기")
                    }
                    
                    NavigationLink {
                        Text("필수항목 설정하기")
                    } label: {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundStyle(.linearGradient(Gradient(colors: [.orange, .white]), startPoint: .leading, endPoint: .trailing))
                            .foregroundStyle(.linearGradient(Gradient(colors: [.blue, .white]), startPoint: .leading, endPoint: .trailing))
                            .scaledToFit()
                            .frame(width: 20)
                        Text("필수항목 설정하기")
                    }
                    
                    NavigationLink {
                        Text("iPhone 개인 맞춤화하기")
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundStyle(.linearGradient(Gradient(colors: [.pink, .white]), startPoint: .leading, endPoint: .trailing))
                            .foregroundStyle(.linearGradient(Gradient(colors: [.blue, .white]), startPoint: .leading, endPoint: .trailing))
                            .scaledToFit()
                            .frame(width: 20)
                        Text("iPhone 개인 맞춤화하기")
                    }

                } header: {
                    Text("시작하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .textCase(nil)
                }
                
                Section {
                    Label("사진", systemImage: "photo.on.rectangle.angled")
                    Label("카메라", systemImage: "camera ")
                    Label("대비하기", systemImage: "bolt")
                    Label("필수항목 설정하기", systemImage: "bolt")
                    Label("iPhone 개인 맞춤화하기", systemImage: "bolt")
                } header: {
                    Text("사진 및 카메라")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .textCase(nil)
                }

            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "검색")
            .navigationTitle("모음")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
