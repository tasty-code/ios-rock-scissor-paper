  <h4>묵찌빠 프로젝트</h4>

<h2>소개: 컴퓨터와 가위바위로 게임을 하는 프로젝트 입니다.</h2>
<h2>팀원 소개:Mango, Mond </h2>
<h2>실행화면</h2>

 ![](https://hackmd.io/_uploads/ryLB3LdCn.png)

<h2>코드 설명:</h2>

- 사용자가 입력한 0~3의 값을 enum을 활용하여 end, rock, paper, scissor로 작성하였습니다.
- go : Bool 변수를 이용해 True면 while문을 다시 돌리고 False면 while문이 종료되도록 하였습니다.
- comNum : 컴퓨터의 선택 번호를 random 함수를 사용하여 1~3번 숫자 중에서 랜덤으로 배정되도록 하였습니다.
- print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "") : print 함수에는 자동 줄바꿈 기능이 있어 terminator: “” 를 이용해 사용자의 입력 받는 위치가 다음 줄로 넘어가지 않도록 하였습니다.
- uChoice : 사용자의 입력 값 userNum을 Int 형태로 변환하였습니다. 이때 입력이 nil일 가능성이 있어 guard let을 사용하였습니다.
- RockPaperScissors 함수 : 사용자의 입력을 받은 후 If를 사용하여 사용자의 승패를 확인합니다.
- Switch result : RockPaperScissors 함수의 return 값을 가지고 게임을 계속 진행할건지의 여부를 확인하였습니다.

 

<h3>트러블 슈팅</h3>
<h2>
겪었던 문제
</h2>

1. (!)를 사용하지 않고 readLine()으로 입력을 받으려고 하니 optional unwrapping을 하는데 어려움을 겪었다. 


<h2>
  해결방법
</h2>

1. 입력값을 guard let을 2번 사용하여서 optional unwrapping을 해결했습니다.
![](https://hackmd.io/_uploads/Hkmth8_A3.png)



<h3>[팀회고]</h3>

* 우리팀이 개선할점
   - 새롭게 배울 개념이 많았다 
* 우리팀이 궁금했던 점
   - Nil-coalescing operator방식의 defaultValue의 초기 값을 ""로 작성을 했는데 defaultValue의 초기값에는 아무 의미가 없습니다.
이러한 방식은 가독성을 해친다고 수업을 들어서 guard let 방식으로 받고 싶었는데 optional unwrapping이 어려웠습니다.

