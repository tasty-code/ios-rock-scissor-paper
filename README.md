# Tasty Code

### 묵찌빠 프로젝트 저장소

## STEP 2 [SiDi, Matthew]

### 코드 설명

- GamePlayer : `Stack` 에 게임이 담긴 경우 담긴 게임을 `pop`해 진행
- RockPaperScissorsModel : `Circular Queue`를 활용한 가위바위보 게임 로직 구현
- MVC Pattern : 요청 처리(`Controller`), 비즈니스 로직(`Model`), 화면(`View`) 별 분리

### 고민 되었던 점

- 함수를 기능 단위로 분리해 작성해봤습니다. 코드가 간결해지고 재사용성이 높아지는 점은 좋았지만 너무 많은 함수가 생성된건 아닌가 라는 생각이 들었습니다.
- 변수, 함수 등 네이밍 할 때 지난 번에 공유해주신 가이드를 적용해 보는 과정이 생각보다 어려웠습니다.
- MVC 구조를 나눌 때 `print`함수를 실행하는 부분이 `View`라고 생각했습니다. 로직과 데이터를 처리하는 영역은 `Model`로 분리 했습니다. 구조를 나누는 과정에 고민이 많이 되었습니다.

### 궁금했던 점

- 가위바위보 승무패 별 로직을 `switch`나 `if`문을 사용한 분기처리를 할 경우 너무 많은 분기가 생겨 `Dictionary`에 `closure`를 담아 해당하는 `closure`를 실행하는 방법으로 코드를 작성해 봤습니다. 실무에서도 `closure`를 어떤 식으로 사용하는지 궁금 합니다!

Ex) `Dictionary` 사용

```swift
// 글로벌 영역
private var rockPaperScissorsResultDict: Dictionary<Match, () -> ()>

rockPaperScissorsResultDict[.win] = rockPaperScissorsWin
rockPaperScissorsResultDict[.draw] = rockPaperScissorsDraw
rockPaperScissorsResultDict[.lose] = rockPaperScissorsLose

// 로컬 영역
let result = model.matchResult(firstPlayer: userSelect, secondPlayer: computerSelect)

guard let process = mukJjiBbaResultDict[result] else { return }
process()

```

Ex) `Switch` 사용

```swift
// 로컬 영역
let result = model.matchResult(firstPlayer: userSelect, secondPlayer: computerSelect)

switch result{
case .win:
		rockPaperScissorsWin()
case .draw:
		rockPaperScissorsDraw()
case .lose:
		rockPaperScissorsLose()
}
```
PR 링크 : https://github.com/tasty-code/ios-rock-scissor-paper/pull/55

### 스크린샷

![step2스샷](https://github.com/jus1234/ios-rock-scissor-paper/assets/47639904/3099abfb-cd96-4ac2-934b-3827f5485bb0)


## STEP 1 [SiDi, Matthew]

가위바위보 프로그램

### 1. 순서도
![KakaoTalk_Photo_2023-11-24-10-08-10](https://github.com/jus1234/ios-rock-scissor-paper/assets/130636633/4e2866b9-a7f7-4da7-9121-d5cec457b4d7)


    
### 2. 아키텍쳐
![KakaoTalk_Photo_2023-11-24-10-25-02](https://github.com/jus1234/ios-rock-scissor-paper/assets/130636633/a0188322-b630-4aa8-88dc-6a06e1983e2f)


    
### 3. 주요 Method, enum
    
| Method | 설명 |
| --- | --- |
| playRockPaperScissorsGame | 가위바위보 게임 진행 |
| getResult | 가위바위보 게임 결과처리 |

| Enum | 설명 |
| --- | --- |
| RockPaperScissors | 가위바위보 enum |
| Match | 게임 결과 enum |

### 4. 스크린샷
![KakaoTalk_Photo_2023-11-24-10-32-41](https://github.com/jus1234/ios-rock-scissor-paper/assets/130636633/1c0b0ed2-35e5-4987-8d4a-1c049eaa6596)

