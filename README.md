
## 유용한 사이트, 문서

- https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
- https://github.com/Jinxiansen/SwiftUI
- https://getstream.io/blog/learn-swiftui/
- https://developer.apple.com/documentation/swiftui/building_a_document-based_app_with_swiftui

<br>

## 📍 View
### `Text`
Text("Hello")를 통해 Text를 생성할 수 있으며, 폰트, 색상, 그림자, 왼쪽 상단과 오른쪽 사이의 간격 등과 같은 여러 속성을 텍스트에 추가할 수도 있습니다.

```swift
Text("Hello World")
    .foregroundColor(.orange)
    .bold()
    .font(.system(.largeTitle))
    .fontWeight(.medium)
    .italic()
    .shadow(color: .black, radius: 1, x: 0, y: 2)
```

<br>

### `TextField`
주로 텍스트 입력을 받아오기 위한 컴포넌트이다. **TextField**의 인자 값으로 **@State**으로 선언한 변수를 넣으면 변수에 텍스트가 입력된다.














## Single Source of Truth
**SwiftUI**에서는 전에 사용하던 방식인 **Duplicated Source of Truth**이 아닌
상태를 쉽게 관리하게끔 해주는 **Single Source of Truth** 를 나타내준다.

이는 **@State** 를 사용하여 나타낼 수 있으며, **@Binding** 을 통해 
**Single Sourth of Truth**에 접근할 수 있다.

만약 상태가 업데이트 되면, **뷰 또한 자동으로 업데이트** 된다.

![](https://velog.velcdn.com/images/leejaeyoung/post/334eab0e-2e87-40e8-9d32-608b6511009f/image.png)

<br>
<br>
<br>
<br>
<br>

_전에 사용하던 방식과 비교 (데이터의 **단방향 흐름**을 확인해 볼 수 있음)_
![](https://velog.velcdn.com/images/leejaeyoung/post/aa3d86e3-17ef-497f-9e76-497b6516b374/image.png)

<br>
<br>

### 코드
다음은 간단한 인터페이스를 구성한 코드로, 기본적인 Data Flow를 이해해볼 수 있는 예제이다.

```swift
import SwiftUI

struct PlayerView: View {
    let episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(episode.title)
                .font(.largeTitle)
            Text(episode.showTitle)
                .font(.title3)
                .foregroundColor(.gray)
            
            PlayButton(isPlaying: $isPlaying)
            
            PlayingStatusView(isPlaying: $isPlaying)
            
        }
    }
}

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle": "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}

struct PlayingStatusView: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Image(systemName: isPlaying ? "sun.max.fill" : "sun.max")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(episode: Episode.list[0])
    }
}

```

**PlayerView** 구조체는 에피소드의 제목, 쇼 제목, 재생 상태를 표시하는 UI 요소를 가지고 있다. **body **속성에서는 VStack을 사용하여 제목, 쇼 제목, 재생/정지 버튼, 재생 상태 아이콘을 수직으로 배치한다.

**PlayButton** 구조체는 재생/정지 버튼입니다. isPlaying 변수는 재생/정지 상태를 나타내는 Binding 변수다. 버튼을 클릭하면 **toggle()** 메소드를 사용하여 **isPlaying** 변수의 값이 변경된다.

**PlayingStatusView** 구조체는 **재생 상태를 표시**하는 아이콘을 가지고 있습니다. **isPlaying** 변수는 재생 중인지 여부를 나타내는 **Binding** 변수다.

**PlayerView_Previews** 구조체는 PlayerView를 **미리보기** 할 때 사용하는 구조체이다.





<br>
<br>



