

## 새싹 1주차 묵찌빠 프로젝트 

**버드:** <br/>

@Jin0Yun 
@suojae3


---

### 프로젝트 소개

#### 실행 예시
```
가위(1), 바위(2), 보(3)! <종료 : 0> : 1
이겼습니다!
[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 6
잘못된 입력입니다. 다시 시도해주세요.
[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
컴퓨터의 턴입니다.
[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
사용자의 턴입니다.
[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : 3
사용자의 승리!
```
#### 파일구조
<pre>  
RockScissorsPaper-iOS/
│
├── main.swift
│
├── Model/
│    ├── RPSModel.swift
│    ├── GameResultModel.swift
│    ├── TurnModel.swift
│    └── PlayerModel.swift
│   
├── GameRules/
│   └── GameRules.swift
│
└── GameView/
     └── GameView.swift
</pre>


#### Diagram

```
+----------------+
|   GameView     |
+----------------+
| -gameRules     |
+----------------+
         |
         | 
         v
+---------------------+
|     GameRules       |
+---------------------+                                    
| -computerPlayer     |                                    
| -rpsLinkedList      | 
| -gameTurn           |                                    
+---------------------+                                    
         |                                                    
         | -------------------------------------------------                                
         |                          |                      | 
         |                          |                      |
         v                          v                      v 
+---------------------+     +----------------+     +------ ---------+
|  ComputerPlayer     |     |  RPSLinkedList |     |  TurnModel     |
+---------------------+     +----------------+     +----------------+
| -choice             |     | -startNode     |     | (enum values)  |
+---------------------+     +----------------+     +----------------+
         |                          |
         |                          |
         v                          |    
+----------------+                  |
|   RPSModel     |                  |
+----------------+   < --------------
| (enum values)  |
+----------------+

```

<br/>

---

<br/>

### 고민1. 묵찌빠 게임에서 필수적인 객체는 무엇일까? <br/>
**묵찌빠 게임에서 필수적인 객체에는 4가지가 있습니다.** <br/>
- 게임참가자 -> `PlayerModel.swift`  <br/>
- 참가자가 낼 수 있는 패 -> `RPSModel.swift` <br/>
-  게임규칙 -> `GameRules.swift` <br/>
-  입력을 받고 결과를 보여주는 뷰 -> `GameView.swift` <br/>

<br/>

---

<br/>

### 고민2. 향후 기능이 추가된다면 어떻게 코드 수정을 최소화하거나 작업분리를 명확히 할 수 있을까??
**가장 바뀌기 힘든 객체를 가장 내부에 두는 방법 선택** <br/>
- 가위/바위/보 라는 선택 옵션 <br/>
- 참가자와 게임규칙 <br/>
- 뷰 <br/>
- 위 순서대로 내부에 두어 뷰를 수정하더라도 게임규칙이나 선택옵션 파일에 영향을 주지 않도록 의존성을 설정했습니다 <br/>
  따라서 참가자가 수정된다면 참가자 파일에서만, 게임규칙이 수정된다면 게임규칙 파일에서만 코드를 수정할 수 있도록 구현했습니다 <br/>

<br/>

---

<br/>

### 고민3. 게임승자 결정에 있어서 어떻게 하드코딩을 피할 수 있을까?

```
+---------+    next    +---------+    next    +---------+  
|  Rock   | ---------> |  Paper  | ---------> |Scissors | 
+---------+            +---------+            +---------+  
    ^                                              |
    |____________________next______________________|

```
**게임규칙에서 LinkedList 자료구조 활용** <br/>
- 유저가 입력한 패의 노드 탐색 <br/>
- 컴퓨터 패의 노드 탐색 <br/>
- 각 노드 위치 비교 후 결과를 return 했습니다 <br/>

<br/>

---

<br/>

### 고민4. 중복되는 로직을 어떻게 하면 더 간결하게 줄일 수 있을까?

- userChoice와 computerChoice가 같은지의 여부와 gameTurn을 튜플로 묶어 중복되는 코드를 줄일 수 있었습니다.

<br/>

**수정 후**

```swift
private func determineSecondGameWinner(userChoice: RPSModel)  {
        let computerChoice = computerPlayer.makeRandomChoice()
        
        if gameTurn == .userTurn && computerChoice == userChoice {
            onUpdateMessage?("사용자 승")
        } else if gameTurn == .userTurn && computerChoice != userChoice {
            onUpdateMessage?("컴퓨터 턴입니다.")
            onUpdateMessage?(TurnModel.computerTurn.message)
            if gameTurn == .userTurn {
                gameTurn = .computerTurn
                onRestartSecondGame?()
            } else {
                gameTurn = .computerTurn
                return
            }
        } else if gameTurn == .computerTurn && computerChoice == userChoice {
            onUpdateMessage?("컴퓨터 승")
        } else {
            onUpdateMessage?("사용자 턴입니다.")
            onUpdateMessage?(TurnModel.userTurn.message)
            if gameTurn == .computerTurn {
                gameTurn = .userTurn
                onRestartSecondGame?()
            } else {
                gameTurn = .userTurn
                return
            }
        }
    }
```

<br/>

**수정 후**
```swift
private func determineSecondGameWinner(userChoice: RPSModel)  {
        secondGameRoop: while true {
            let computerChoice = computerPlayer.makeRandomChoice()
        
            switch (gameTurn, userChoice == computerChoice) {
            case (.userTurn, true):
                onUpdateMessage?("사용자 승")
                break secondGameRoop
            case (.userTurn, false):
                onUpdateMessage?("컴퓨터 턴입니다.")
                gameTurn = .computerTurn
            case (.computerTurn, true):
                onUpdateMessage?("컴퓨터 승")
                break secondGameRoop
            default:
                onUpdateMessage?("사용자 턴입니다.")
                gameTurn = .userTurn
            }
            onRequstSecondGame?()
            break secondGameRoop
        }
    }
```

<br/>

---

<br/>

