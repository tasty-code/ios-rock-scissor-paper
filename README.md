# Tasty Code

**리뷰어:** <br/>
**@Dana** <br/>

**버드:** <br/>
**<a href="https://github.com/Jin0Yun" target="_blank"> @Yuni** <br/>
**<a href="https://github.com/suojae3" target="_blank"> @Sajae** <br/> 



안녕하세요 다나! 
첫 PR 잘부탁드립니다🤩

---

<br/>

### 프로젝트 소개
#


### 고민1. 묵찌빠 게임에서 필수적인 객체는 무엇일까? <br/>
**묵찌빠 게임에서 필수적인 객체에는 4가지가 있습니다.** <br/>
  a. 게임규칙 <br/>
  b. 게임참가자 <br/>
  c. 참가자가 낼 수 있는 패 <br/>
  d. 입력을 받고 결과를 보여주는 뷰 <br/>

<br/>

### 고민2. 향후 기능이 추가된다면 어떻게 코드 수정을 최소화하거나 작업분리를 명확히 할 수 있을까??
**가장 바뀌기 힘든 객체를 가장 내부에 두는 방법 선택** <br/>
  a. 가위/바위/보 라는 선택 옵션 <br/>
  b. 참가자와 게임규칙 <br/>
  c. 뷰 <br/>
  위 순서대로 내부에 두어 뷰를 수정하더라도 게임규칙이나 선택옵션 파일에 영향을 주지 않도록 의존성을 설정했습니다 <br/>
  따라서 참가자가 수정된다면 참가자 파일에서만, 게임규칙이 수정된다면 게임규칙 파일에서만 코드를 수정할 수 있도록 구현했습니다 <br/>

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
  a. 유저가 입력한 패의 노드 탐색 <br/>
  b. 컴퓨터 패의 노드 탐색 <br/>
  c. 각 노드 위치 비교 후 결과를 return 했습니다 <br/>

  <br/>



---
###  파일 구조

<pre>  
  
RockScissorsPaper-iOS/
│
├── View/
│   └── GameView.swift
│   
├── Player/
│   └── Players.swift
│
├── GameRules/
│   ├── GameRukes.swift
│   └── RPSLinkedList.swift
│
└── Model/
     └── RPSModel.swift
    
</pre>

---

### 의존도 다이어그램


<img width="395" alt="image" src="https://github.com/Jin0Yun/ios-rock-scissor-paper/assets/126137760/d625689b-df60-4561-9ea2-eebd1eacd3c3">


---

