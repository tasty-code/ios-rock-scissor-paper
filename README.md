# 묵찌빠 프로젝트
콘솔을 통해 진행되는 묵찌빠 게임 구현 

## 팀원
[@rarlala](https://github.com/rarlala) [@KimRoks](https://github.com/kimroks)

## 작동 영상
<img src="https://private-user-images.githubusercontent.com/48057629/266529603-eedadd3a-c261-4afb-8706-f9e8850cb34a.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTQxNTcwODEsIm5iZiI6MTY5NDE1Njc4MSwicGF0aCI6Ii80ODA1NzYyOS8yNjY1Mjk2MDMtZWVkYWRkM2EtYzI2MS00YWZiLTg3MDYtZjllODg1MGNiMzRhLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFJV05KWUFYNENTVkVINTNBJTJGMjAyMzA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjMwOTA4VDA3MDYyMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWMzOGQ5MTM3ZGRiYzY3NjExOTE4YTU4YTAzZjNjNTBkZDE3ZDdmMTliYmQzNDI3NDA3NzM1OTdiYzI3ZmYxNDQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.EnRoX_Bf1Feozb-aShaDQ--hKF9xkolx0eZQBfVbdI0">



## 순서도
### STEP1 가위바위보 순서도
<img src="https://private-user-images.githubusercontent.com/48057629/266540891-33ada54b-8298-4343-b795-396eb93ef8e6.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE2OTQxNTk4MjAsIm5iZiI6MTY5NDE1OTUyMCwicGF0aCI6Ii80ODA1NzYyOS8yNjY1NDA4OTEtMzNhZGE1NGItODI5OC00MzQzLWI3OTUtMzk2ZWI5M2VmOGU2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFJV05KWUFYNENTVkVINTNBJTJGMjAyMzA5MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjMwOTA4VDA3NTIwMFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTNmN2NlY2JkOWQxMGM1MDFjZDJiM2JhY2FjN2FmZWUyM2M5NGRhYmExZGU2MTViOWQ4YjQ0NWI5MmExY2FlZmEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.sYLGPg6nZqxI58oY0fFNYi8fVBn2irtuVvnCXtNKHEQ" >


## 구현한 내용
### STEP1 : 가위바위보 게임
1. 최초 실행 시 `가위(1), 바위(2), 보(3)! <종료 : 0> :` 출력
2. 사용자에게 `0, 1, 2, 3` 중 한가지를 입력받아 결과를 출력합니다.
  - 컴퓨터의 패는 임의의 패를 정하여 냅니다.
  - 비긴 경우 : `"비겼습니다!"` 출력 후 다시 최초 실행 상태로 복귀
  - 이긴 경우 : `"이겼습니다!"` 출력 후 게임 종료
  - 진 경우 : `"졌습니다"` 출력 후 게임 종료
  - 0을 입력받은 경우 : 게임 종료
  - `0~3`이 아닌 값을 입력받은 경우 : `"잘못된 입력입니다. 다시 시도해주세요."` 출력 후 최초 실행 상태로 복귀

### STEP2 : 묵찌빠 게임
1. Step 1의 게임 중 가위, 바위, 보 후에 결과에 따라 게임을 이어갑니다.
  - 바위, 보를 비긴 경우 : 다시 가위, 바위, 보 게임 진행
  - 가위, 바위, 보 게임에서 승패가 갈린 경우 : 묵찌빠로 이어서 게임 진행
2. 묵, 찌, 빠 실행 시 출력
  - `[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>` :
    - `[*** 턴]` 위치에는 현재 누구의 턴인지 표시합니다.
    - 가위, 바위, 보 게임 혹은 지난 턴에서 이긴 사람이 턴을 쥡니다.
    - 잘못된 입력을 한 경우 컴퓨터에게 턴을 넘깁니다.
  - 사용자에게 `0, 1, 2, 3` 중 한 가지를 입력받아 결과를 출력합니다.
    - 사용자의 패와 컴퓨터의 패가 동일한 경우 : 턴을 쥐고 있는 쪽이 승리합니다.
      - `“***의.승리!”` 출력 후 게임 종료
    - 사용자의 패와 컴퓨터의 패가 다른 경우 : 이긴 쪽이 턴을 쥡니다.
      - `“***의 턴입니다”` 출력 후 묵, 찌, 빠 계속 실행
    - `0`을 입력받은 경우 : 게임 종료

### 주요 메서드명과 역할
| 메서드명 | 역할 |
| :-------------: | :-------------: |
| getRandomNum() | 1부터 3까지의 랜덤한 숫자 생성 후 return하는 함수 |
| getRPSResult(userSelect:String, computerSelect:String) | 사용자와 컴퓨터의 입력값에 따른 가위바위보 결과를 처리하는 함수 |
| playMukjjibba() | 묵찌빠 게임 옵션에 대한 사용자의 입력을 받아 처리하는 함수 |
| getMukjjibbaTurn(userSelect: String, computerSelect: String) | 묵찌빠 결과에 따라 턴의 상태를 return하는 함수 |
| getMukjjibbaResult(userSelect: String,computerSelect: String) | 묵찌빠 결과를 return하는 함수 |


### 프로젝트 진행 중 고민한 점
- 명확한 표현의 네이밍을 사용하였습니다.
- 함수를 분리할 때 근거와 기준을 가지고 한가지 일만 수행하도록 처리했습니다.
- 코드의 가독성을 고려하여 if 문의 이중중첩이 되지않게끔 작성했습니다.
- 코드의 가독성을 고려하여 모듈화를 진행했습니다.
- 불필요한 코드의 반복을 제거하였습니다.
