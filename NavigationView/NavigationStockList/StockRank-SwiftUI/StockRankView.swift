//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct StockRankView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        NavigationView {
            List($list) { $item in
                ZStack {
                    NavigationLink {
                        // 클릭이 되었을때 어디로 보낼건지
                        StockDetailView(stock: $item)
                    } label: {
                        EmptyView() // 투명한 버튼 느낌
                    }
                    // 레이블을 어떻게 표시할것인지
                    StockRankRow(stock: $item)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 80)
                
            }
            .listStyle(.plain)
            .navigationTitle("Stock Rank")
            //.background(.red)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
            .preferredColorScheme(.dark)
    }
}
