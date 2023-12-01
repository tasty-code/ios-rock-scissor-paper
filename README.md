# Project 01. 묵찌빠 프로그램

### 목차
> [1. Overview](#Overview)
>
> [2. Key Topics](#Key-Topics)
>
> [3. 프로그램 설명](#프로그램-설명)
>
> [4. 가위바위보(묵찌빠) 승부 평가 로직 설명](#가위바위보(묵찌빠)-승부-평가-로직-설명)
>
> [5. 프로그램 출력 예](#프로그램-출력-예)
>
> [6. 회고](#회고)

### Overview

실제 묵찌빠 프로그램을 콘솔 상에서 구현하여 Swift 언어의 기초적인 내용들을 학습하고 다뤄보는 프로젝트입니다.

### Key Topics
- 여러 타입의 활용법
    - Enumeration 활용
    - Structure 활용
- Swift의 Optional 안전하게 처리하는 법
    - guard 구문의 이해와 활용
- repeat-while 문의 사용법
- 객체지향 프로그래밍 학습
- 코딩 컨벤션 고민하기
- Git 커밋 단위 고민하기
- Git 커밋 로그 형식 학습하기

### 프로그램 설명
- GameMaster 구조체
    - 전체 프로그램의 실행과 사용자 입력, 및 종료를 처리
    - gameType에 따라 가위바위보 또는 묵찌빠 실행을 요청
- RockPaperScissors 구조체
    - 유저 입력에 따라 가위바위보를 선택하고 컴퓨터(랜덤)와 비교하여 승패 또는 무승부 판정
- MookJjiBba 구조체
    - 유저 입력에 따라 묵찌빠를 선택하고 컴퓨터(랜덤)와 비교하여 승패 판정
- RPS, MJB 열거형
    - 유저 입력에 따라 가위바위보와 묵찌빠 선택
- GameType 열거형
    - 가위바위보, 묵찌빠 2 케이스에 따른 게임 실행 요청을 각 구조체로 전달

### 가위바위보(묵찌빠) 승부 평가 로직 설명
- 가위바위보(묵찌빠) 열거형의 winningLogic 계산 프로퍼티는 두 핸드의 상성을 key:value 로 나타내는 딕셔너리를 포함
- 이를 바탕으로 두 핸드가 서로 같을 경우는 별도로 처리, 두 핸드가 서로 다를 경우는 딕셔너리의 키로 핸드를 전달하고 이를 다른 핸드와 비교하여 승부 평가

```swift
// enumerations/enumerations.swift
enum RPS: Int {
    case scissors = 1, rock = 2, paper = 3
    
    var winningLogic: [RPS:RPS] {
        get {
            let dictionary: [RPS:RPS] = [
                .rock : .scissors,
                .scissors : .paper,
                .paper : .rock
            ]
            return dictionary
        }
    }
}
```

```swift
// structures/RockPaperScissors.swift
if userHand == computerHand {
    print("비겼습니다.")
    return (.restart, .computer)
}
        
let winningLogic = userHand.winningLogic
turn = winningLogic[userHand] == computerHand ? .user : .computer
```

### 프로그램 출력 예
##### 전체 프로그램 예시

![스크린샷 2023-12-01 오전 10.04.35](https://hackmd.io/_uploads/Bk_KW2LHp.png)

##### 오입력 및 종료 입력 예시

![스크린샷 2023-12-01 오전 10.05.03](https://hackmd.io/_uploads/BkYjW3LBa.png)

---

### 회고
- 재사용할 수 있고 기능을 쉽게 추가 또는 변경할 수 있는 프로그램을 작성하는 것이 중요하다는 점을 깨닫게 되었다.
    - Step 1 : 함수형 프로그래밍 방식
    - Step 2 : 객체지향 프로그래밍 방식 적용, (전체 로직 제외) 대부분 새로 작성
- 커밋 단위는 가능한 세분화하는 것이 좋다.
- 스위프트에서는 가능한 구조체를 활용할 것을 권장하고 있다.
- 메서드 명에는 가급적 get 을 쓰지 않는 것이 좋다. (get이 다양한 의미로 활용되기 때문)
