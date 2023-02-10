

import SwiftUI

struct SymbolRollerView: View {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @State var imageName = "moon"
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(imageName)
                .font(.system(size: 40, weight: .bold))
            
            Spacer()
            
            Button {
                print("button Tapped")
                imageName = symbols.randomElement()!
            } label: {
                
                // 버튼을 좌우로 나누고, 우측을 또 상하로 나눠야 함
                HStack {
                    Image(systemName: "arrow.3.trianglepath")
                        
                    
                    VStack {
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold))
                            
                        
                        Text("click me to reload")

                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRollerView()
    }
}
