//
//  ContentView.swift
//  SettingAppSample
//
//  Created by 이재영 on 2023/03/04.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAirplaneModOn : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                }
                
                Section {
                    // 비행기 모드 (토글)
                    toggleCell(imageName: "airplane",
                               iconColor: .orange,
                               cellTitle: "비행기 모드",
                               isTrue: $isAirplaneModOn)

                    // 와이파이
                    PlainCell(imageName: "wifi",
                               iconColor: .blue,
                               cellTitle: "Wi-Fi",
                               subTitle: "와이파이 이름") {
                        Text("와이파이 화면입니다")
                    }
                    
  
                }
                
                Section {
                    // 스크린 타임
                    PlainCell(imageName: "hourglass",
                              iconColor: .indigo,
                              cellTitle: "스크린 타임",
                              subTitle: "") {
                        Text("스크린 타임 화면입니다")
                    }
                }
                
                Section {
                    HStack {
                        NavigationLink("일반"){
                            Text("일반 화면입니다")
                        }
                    }
                    
                    HStack {
                        NavigationLink("손쉬운 사용"){
                            Text("손쉬운 사용 화면입니다")
                        }
                    }
                    
                    HStack {
                        NavigationLink("개인 정보 보호"){
                            Text("개인 정보 보호 화면입니다")
                        }
                    }
                    
                }
            } // List End
            .navigationTitle(Text("설정"))
        }
    }
    
    // 아이콘 콘피그
    @ViewBuilder
    private func iconImage(iconName: String, iconColor: Color) -> some View {
        Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
    
    // 프로필 화면
    @ViewBuilder
    private func profileCell() -> some View {
        // 프로필
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.all, 10)
                .background(.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text("LEE JAEYOUNG")
                    .font(.system(size: 24))
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 14))
            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 10)
    }
    
    // 토글 셀
    @ViewBuilder
    private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isTrue: Binding<Bool>) -> some View {
        HStack {
            iconImage(iconName: imageName, iconColor: iconColor)
            
            Toggle(cellTitle, isOn: isTrue)
        }
    }
    
    // 기본 셀
    @ViewBuilder
    private func PlainCell<cellView: View>(imageName: String, iconColor: Color, cellTitle: String, subTitle: String, destination: @escaping () -> cellView) -> some View {
        HStack {
            iconImage(iconName: imageName, iconColor: iconColor)
            
            // 옆에 레이블이 필요한 경우 (wifi .. )
            if let subTitle = subTitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(cellTitle) {
                    destination()
                }
            }
        }
    }
    
    
} // View End



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
