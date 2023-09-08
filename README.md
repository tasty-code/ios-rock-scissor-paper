# 묵찌빠 프로젝트

### 팀원
@rarlala @KimRoks

### 작동 영상
<img src="https://private-user-images.githubusercontent.com/48057629/266529603-eedadd3a-c261-4afb-8706-f9e8850cb34a.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTQxNTcwODEsIm5iZiI6MTY5NDE1Njc4MSwicGF0aCI6Ii80ODA1NzYyOS8yNjY1Mjk2MDMtZWVkYWRkM2EtYzI2MS00YWZiLTg3MDYtZjllODg1MGNiMzRhLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFJV05KWUFYNENTVkVINTNBJTJGMjAyMzA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjMwOTA4VDA3MDYyMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWMzOGQ5MTM3ZGRiYzY3NjExOTE4YTU4YTAzZjNjNTBkZDE3ZDdmMTliYmQzNDI3NDA3NzM1OTdiYzI3ZmYxNDQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.EnRoX_Bf1Feozb-aShaDQ--hKF9xkolx0eZQBfVbdI0">

### 순서도
-> 가위바위보 관련

### 요구사항 구현내용 순서


### 주요 메서드명과 역할
| 메서드명 | 역할 |
| :-------------: | :-------------: |
| getRandomNum() | 1부터 3까지의 랜덤한 숫자 생성 후 return하는 함수 |
| getRPSResult(userSelect:String, computerSelect:String) | 사용자와 컴퓨터의 입력값에 따른 가위바위보 결과를 처리하는 함수 |
| playMukjjibba() | 묵찌빠 게임 옵션에 대한 사용자의 입력을 받아 처리하는 함수 |
| getMukjjibbaTurn(userSelect: String, computerSelect: String) | 묵찌빠 결과에 따라 턴의 상태를 return하는 함수 |
| getMukjjibbaResult(userSelect: String,computerSelect: String) | 묵찌빠 결과를 return하는 함수 |


### 개선한 내용
-  

명확한 표현의 네이밍을 사용하였습니다.
함수를 분리할 때 근거와 기준을 가지고 한가지 일만 수행하도록 처리했습니다.
코드의 가독성을 고려하여 if 문의 이중중첩이 되지않게끔 작성했습니다.
코드의 가독성을 고려하여 모듈화를 진행했습니다.
불필요한 코드의 반복을 제거하였습니다.
