## **제목 :** 묵찌빠 프로젝트

## **소개 :** 사용자의 입력을 받아서 묵, 찌, 빠 대결을 하는 콘솔 프로그램

## **팀원**
라마: https://github.com/llamang/

Harry: https://github.com/hemil0102/

## **타임라인 :** 시간 순으로 프로젝트의 주요 진행 척도를 표시
[![타임라인1](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/RPS_TimeLine_Step1.png)](#)
[![타임라인2](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/RPS_TimeLine_Step2.png)](#)

## **시각화된 프로젝트 구조(다이어그램 등)**

### 순서도
[![순서도1](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Game_RockPaperScissors_FlowChart.drawio.png)](#)

### 클래스 다이어그램
[![클래스다이어그램](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Game_RockPaperScissors_ClassDiagram.drawio.png)](#)

## **실행 화면(기능 설명)**
- 1-1. 초기 구동 화면
  [![초기 구동 화면](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/1.png)](#)
- 1-2. 구동 종료 화면
  [![구동 종료 화면 1](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/2.png)](#)
  [![구동 종료 화면 2](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/3.png)](#)
- 1-3. 가위 바위 보 비김, 승, 패 판단 이후의 동작 화면
  [![가위바위보1](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/4.png)](#)
  [![가위바위보2](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/5.png)](#)
  [![가위바위보3](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/6.png)](#)
- 1-4 묵찌빠 수행화면
  [![묵찌빠](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/7.png)](#)
- 1-5 잘못된 입력에 대한 처리 구현
  [![오입력처리1](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/8.png)](#)
  [![오입력처리2](https://github.com/llamang/ios-rock-scissor-paper/blob/d_llama/docs/Readme%20Material/9.png)](#)

## **트러블슈팅**

1. 가위 바위 보 로직 판단 오류
    
    변경 전
    
    ```swift
    (userChoice.value + 1) % RockPaperScissors.count == computerChoice.value
    ```
    
    변경 후
    
    ```swift
    (userChoice.value + 1) % RockPaperScissors.count == computerChoice.value % RockPaperScissors.count 
    ```
    
    가위바위보 승부 판단 오류 부분입니다. 
    
    사용자가 묵을 냈을 때 값(`userChoice.value`)이 2라고 가정할 때, 1을 더해 3이 되고 % 3(`RockPaperScissors.count`)을 통해서 값이 0이 됩니다. 
    
    그러나 computer가 보를 냈을 경우 값이(`computerChoice.value`) 3으로, 결과적으로 `0 == 3`은 false가 되어 원래 원했던 `0 == 0`인 true를 반환하지 않아 승패를 잘못 판단하고 있었습니다. 
    
    원하는 결과를 위해 컴퓨터도 % 3(`RockPaperScissors.count`)으로 나누어 의도한 로직으로 구현했습니다. 
    
2. 가위(1), 바위(2), 보(3)와 묵(1), 찌(2), 빠(3)의 순서가 다르지만, 둘이 공통으로 갖는 기능인 가위, 바위, 보 승부 판단 로직을 같은 입력의 순서로 처리해서 오류가 발생했습니다.
    
    콘솔 출력으로 승패 판단에 오류가 있다는 사실을 뒤늦게 발견하여 마감할 때 오류를 수정할 수 있었습니다.
    
    향후에는 과제를 만들어가면서 기능 단위 별로 기능이 정상 구현되었는지 충분한 검토를 할 것입니다. 
    
3. 기존 InputHandler는 input 문자열 상수를 `Int()` 함수로 정수를 얻게 되면, “`-0`”이 정수 0으로 변환되어 user가 “종료”를 입력한 것처럼 작동되었습니다. 
    
    그래서 `Int(input)`을 호출하기 전에, `input == “0”` 조건을 먼저 처리해서 오직 “0”만 종료 입력으로 처리되도록 변경했습니다.
    
4. gameManager 인스턴스가 각 user와 computer 인스턴스의 `willEndGame` 변수를 확인하여 게임을 종료할지를 결정하는 로직
    
    23197b931448004bd7048d78f89e30c020603507
    
    Player 타입 인스턴스의 `willEndGame`은 변수인데 내부 구현 변경 혹은 의도치 않게 값이 변경되는 경우, 게임 종료와 관련하여 문제가 발생하거나 그 변수에 의존하고 있는 GameManager 구조체의 내부 구현을 변경해야 할 수 있습니다. 
    
    또한 gameManager 입장에서는 원하는 값을 받는 메서드 호출할 때, 해당 메서드에서 user/computer 인스턴스의 `willEndGame` 프로퍼티가 변경된다는 것 또한 문제였습니다. 
    
    해당 `willEndGame` 변수를 제거하는 리팩토링을 수행했습니다.
    
5. GamaManager에 많은 책임이 할당되어 User, Computer, Referee 객체를 생성하여 책임을 분산하였습니다. 특히 현재 Referee의 책임은 원래 GameManager가 많이 가지고 있던 것으로, 결과적으로 역할 구분이 명확해져서 기능 확인이나 코드 가독성이 향상 되었습니다.

## **[ 팀 회고 ]**
https://github.com/llamang/ios-rock-scissor-paper/blob/23b4247a94f38a26e9b46ec200623e24ab2777cc/%ED%8C%80%ED%9A%8C%EA%B3%A0.md
