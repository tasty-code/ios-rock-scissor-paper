# Tasty Code 묵찌빠 프로젝트 저장소


## 팀원 
[쫑](https://github.com/shlim0), [범](https://github.com/snowy-summer)



## 기간
 23.09.04 ~ 23.09.08

 


## [step 1] 가위바위보 게임
 - 사용자의 입력을 받아 랜덤한 컴퓨터의 값과 비교해 가위바위보의 승패를 판단하는 기능


### 코드 설명

- while문을 통한 가위바위보 게임 반복
- playRockPaperScissors() : 가위바위보 게임을 실행하는 함수
- checkInput() : 사용자의 입력을 받아 처리하는 함수, 잘못된 입력의 경우 에러 메시지를 출력한다.
- getGameResult() : 가위바위보 게임의 승패 결과를 반환하는 함수
- isWin() : 사용자가 승리하는 경우만을 판단하는 함수
- flag 코드를 이용해 while문을 관리한다.






### 새롭게 알게 된 점
  - 입력값이 기존의 print 메시지 옆에 놔주기 위해서  ```swift print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "") ``` 를 사용했다. terminator는 기본값이 \n 이기 때문에 따로 설정을 안하면 자동으로 다음줄에 출력이 된다.
    https://developer.apple.com/documentation/swift/print(_:separator:terminator:)
  -  [Labeled Statement](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Labeled-Statements)를 이용해 흐름 제어가 가능하다
    


    
### 고민했던 점
  - <img width="676" alt="스크린샷 2023-09-08 오후 5 02 22" src="https://github.com/snowy-summer/ios-rock-scissor-paper/assets/118453865/57484228-6f44-4ead-9a4f-139a6270fdd4">
<img width="686" alt="스크린샷 2023-09-08 오후 5 02 14" src="https://github.com/snowy-summer/ios-rock-scissor-paper/assets/118453865/df751fa5-2b71-454d-b88e-7d02f4a50f93">






## [step 2] 묵찌빠 게임


### [step 1] 과 차이점

- 4가지 파일로 정리 RPS, MukJjiPpa, Utility, main
- 조언을 따라 flag 코드 삭제


### 코드

- main.swift
  - 2개의 while문으로 각각 가위바위보와 묵찌빠를 반복한다.

    
 - RPS.swift
    - play() : 게임을 진행하는 함수
    - checkInput() : 사용자에게 입력받은 값이 잘못된 값인지 확인하는 함수
    - getResult() : 가위바위보의 승패 결과를 확인하는 함수
    - isWin() : 사용자가 이기는 경우만을 확인하는 함수
    - startMessage() : 가위바위보 게임을 진행할시 출력하는 메시지
  
 
 - MukJjiPpa.swift
   - RPS class 를 상속 받았습니다.
   - startMessage() : 묵찌빠 게임을 진행할시 출력하는 메시지 ( 가위바위보의 메시지와는 차이가 있다.)
   - getResult() : 묵찌빠 게임의 결과를 출력하는 함수
   - isWin() : 사용자가 묵찌빠에서 이기는 경우 만을 판단하는 함수 (가위바위보와 같은 입력을 했을 때 선택되는 패가 다르기때문에 존재한다.)


- Utility.swift
  - shouldByClose() : 게임의 종료여부를 판단하는 함수
  - isRepeat() : 반복의 필요성을 확인하는 함수
 
- CasesOf.swift
  - rawValue로 가위바위보 승패 여부를 판정하는 것에서 가독성을 위해 만든 열거형

