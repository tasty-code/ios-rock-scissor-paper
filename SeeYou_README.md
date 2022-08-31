# ios-rock-scissor-paper
가위바위보 프로젝트 저장소입니다.

# 목차
<ol>
  <li>프로젝트 실행 화면</li>
  <li>함수 설명</li>
  <li>프로젝트 진행 중 발생한 문제</li>
</ol>

# 프로젝트 실행 화면
<ul>
  <li>가위바위보 입력 유효성검사 및 종료</li>
  <img width="272" alt="스크린샷 2022-08-24 오후 4 42 54" src="https://user-images.githubusercontent.com/94955378/187624292-b73c89e1-8a7a-4e89-be66-0e4edc012cb8.png"><br>

  <li>가위바위보 진행 결과(패배)</li>
  <img width="277" alt="스크린샷 2022-08-24 오후 4 43 07" src="https://user-images.githubusercontent.com/94955378/187624508-ddb3c91c-b2bc-40d4-9014-41c9cbf638f5.png"><br>
  
  <li>가위바위보 진행 결과(비김)</li>
<img width="272" alt="스크린샷 2022-08-24 오후 4 43 34" src="https://user-images.githubusercontent.com/94955378/187624519-8f1c4b17-ae91-434d-bcf9-86b4ba4bdcba.png">
  <li>가위바위보 진행 결과(승리)</li>
  <img width="269" alt="스크린샷 2022-08-24 오후 4 43 49" src="https://user-images.githubusercontent.com/94955378/187624534-be30b5b4-d101-47a8-8ee0-c2d98aea2771.png"><br>
</ul>

# 함수 설명
<table>
  <tr><td>startGame()</td><td>게임을 시작하는 함수</td></tr>
    <tr><td>printMenu()</td><td>사용자에게 어떤 숫자를 입력해야 하는지 출력하는 함수</td></tr>
  <tr><td>makeComputerNumber()</td><td>상대편의 숫자를 만드는 함수로 1부터 3중의 난수를 반환</td></tr>
  <tr><td>getUserNumber()</td><td>사용자에게 게임 숫자의 입력을 받는 함수</td></tr>
  <tr><td>isValidNumber()</td><td>사용자가 입력한 숫자의 유효성을 판단하는 함수</td></tr>
  <tr><td>invalidInputHandling</td><td>사용자가 입력한 숫자가 유효하지 않을 때 재입력을 안내하는 함수</td></tr>
  <tr><td>judgeNumber()</td><td>게임의 승패를 반환하는 함수</td></tr>
  <tr><td>judgeMukjipaNumber</td><td>묵찌빠 게임의 승패를 반환하는 함수</td></tr>
  <tr><td>changeGameTypeAndWidPlayer()</td><td>가위바위보에서 묵찌빠로 게임 유형을 변경하며 승자를 저장하는 함수</td></tr>
</table>
# 프로젝트 진행 중 발생한 문제
기존 가위바위보 게임에서 묵찌빠를 진행하도록 하는 과정에서 함수의 무한반복과 승패여부 판단에 문제가 있어 결국 묵찌빠 게임은 구현하지 못했다.
