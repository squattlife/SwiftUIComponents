

## 👋 View
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

```swift
@State var userID: String = ""
  
  var body: some View {
    VStack {
      TextField("ID를 입력하세요", text: $userID)
        .padding()
        .textFieldStyle(.roundedBorder)
      
      Text("Hi \(userID)")
    }
  }
```

<br>

### `SecureField`
**TextField**와 마찬가지로 입력을 받지만, 입력한 내용을 보여주지 않는다. 일반적으로 사용자의 암호 입력으로 사용된다.


<br>
<br>
<br>


## 👋 Image

### `Image`
이미지를 표시해주며, Image("이미지이름")을 통해 화면에 띄울 수 있다.

다음은 자주 사용하는 SF Symbols 아이콘을 사용하기 위한 코드이다.

```swift
Image(systemName: "folder.fill")
    .resizable()
    .frame(width: 100,
           height: 100)
```

<br>

### `WebImage`
웹 이미지를 다운로드하는 데 사용되며 URLSession을 사용하여 원본 이미지를 다운로드한다.

편리한 방법으로는 다음과 같이 Kingfisher 라이브러리를 사용할 수도 있다.

```swift
import Kingfisher

let url = URL(string: "https://example.com/image.png")
imageView.kf.setImage(with: url)
```

<br>
<br>
<br>

## 👋 Button
### `Button`
클릭 이벤트에 응답하는 데 사용되며 사용자는 `action`과 `label`을 제공하여 버튼을 생성한다.

```swift
Button(action: {
            print("Button is Clicked")
        }, label: {
            Text("Click Me!")
        })
```

<br>

### `NavigationLink`
상세 페이지로 이동하기 위한 컴포넌트이다. 응용하자면 `destination`에 새로 생성한 뷰를 연결시킬 수도 있다.

```swift

var body: some View {
        NavigationView {
            NavigationLink(destination: Text("상세 페이지입니다.")){
                Text("I'm Navigation")
            }
        }
    }
```

<br>
<br>
<br>




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

## 유용한 사이트, 문서

- https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
- https://github.com/Jinxiansen/SwiftUI
- https://getstream.io/blog/learn-swiftui/
- https://developer.apple.com/documentation/swiftui/building_a_document-based_app_with_swiftui

<br>

