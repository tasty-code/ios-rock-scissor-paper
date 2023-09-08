# RockPaperScissors

[Step1] 가위바위보 게임 구현.

### 프로젝트 구조

- class
    - RockPaperScissors
        - 앱 동작의 중심이 되는 모듈
            - 가위바위보 게임 진행을 위한 Method의 모음으로 구성된 class
                - 게임 실행을 시켜주는 run Method
                - do catch문을 사용한 Error Handling

                ```swift
                func run() {
                    do {
                        let userOrder = try inputUserOrder()
                        calculateResult(userOrder: userOrder)
                    } catch {
                        print(error)
                        run()
                    }
                }
                ```

                - 승부 결과를 계산하는 calculateResult 메소드
                - 사용자와 컴퓨터의 손 모양을 비교하여 상하관계를 나타내기 위해
                각 컴퓨터 case rawValue에서 사용자 case의 rawValue 뺀 값으로 결과 계산.

                ```swift
                private func calculateResult(userOrder: Order) {
                    guard let computerHandSignRawValue = computerHandSign?.rawValue else { return }
                    let distance = computerHandSignRawValue - userOrder.rawValue
                    
                    switch distance {
                    case -1, 2:
                        print(InterfaceScript.GameResult.win)
                        return
                    case -2, 1:
                        print(InterfaceScript.GameResult.lose)
                        return
                    default:
                        print(InterfaceScript.GameResult.draw)
                        run()
                    }
                }
                ```
            
- Models
    - InterfaceScript
        - 사용자에게 print로 출력하기 위한 String타입의 Value들을 Enum으로 모아놓은 NameSpace
        - Error Handling
            - 사용자의 Input값이 올바르지 않을 때, "잘못된 입력입니다. 다시 시도해주세요."라는 메세지를 출력해주는 것이 개발자 입장에서도 Error라고 판단이 되어 Error프로토콜과 Custom한 Debug Message를 출력하기 위해 CustomDebugStringConvertible 프로토콜을 채택 함.
   
            ```swift

            enum Failure: Error, CustomDebugStringConvertible {
                case wrongInput
                
                var debugDescription: String {
                    switch self {
                    case .wrongInput: return "잘못된 입력입니다. 다시 시도해주세요."
                    }
                }
            }
            // Error Handling 
            private func inputUserOrder() throws -> Order {
                computerHandSign = makeComputerHandSign()
                print(InterfaceScript.Menu.userInput.description, terminator: "")
                
                guard let input = readLine(),
                        let intInput = Int(input),
                        let order = Order(rawValue: intInput)
                else { throw InterfaceScript.Failure.wrongInput }
                
                return order
            }
            
            ```
    
    - Order
        - 사용자의 입력할 수 있는 메뉴를 case별로 나열
        - 컴퓨터가 낸 손 모양을 랜덤하게 값을 할당하기 위해 Order의 exitProgram를 제외한 케이스들을 배열로 갖기 위해 CaseIterable 프로토콜로 채택 후 구현

        ```swift
        enum Order: Int, CaseIterable {
            case exitProgram = 0
            case scissors = 1
            case rock = 2
            case paper = 3
        }
            // allCases 사용하여 배열 선언 후 필터링하여 randomElement 반환
        private func makeComputerHandSign() -> Order? {
            guard let computer = Order.allCases.filter({ $0 != .exitProgram }).randomElement() else { return nil }
                
            return computer
        }
        ```
    
----------------------------------------------------

### Trouble Shooting

- 승부 결과를 계산하는 메소드
    - 코드 제한사항에 이중 들여쓰기를 금지한 조건이 있었다.
        - 이중 들여쓰기를 하지 않는 방법이 뭐가 있을까?
            - 승리, 패패, 무승부 이 세가지 case 별로 열거형으로 만들어서 관리하자!

                ```swift
                enum Win {
                    case rock
                    case scissors
                    case paper
                }
                enum Lose {
                    case rock
                    case scissors
                    case paper
                }
                enum Draw{
                    case rock
                    case scissors
                    case paper
                }
                ```
                - 결국 이중 들여쓰기가 되어서 실패!!
            - 가위, 바위, 보 이 세가지 case  별로 열거형으로 만들어서 관리하자!
                ```swift
                enum Rock {
                    case win
                    case lose
                    case draw
                }
                enum scissors {
                    case win
                    case lose
                    case draw
                }
                enum paper {
                    case win
                    case lose
                    case draw
                }
                ```
                - 이 방법도 위와 같은 이유로 실패!

        - 우리가 찾은 해결 방안!
            1. 입력 값이 0, 1, 2, 3이라 숫자로 비교할 수 있을 것 같은 생각이 들음.
            2. Order라는 열거형의 Int로 rawValue 할당.
            3. computer 손 모양의 rawValue에서 사용자의 손 모양의 rawValue를 뺀 값으로 결과를 도출할 수 규칙을 발견할 수 있었음.


---------------------------------------------

### 참여자

|SwainYun|밤삭|
|:--:|:--:|
|<img src="https://avatars.githubusercontent.com/u/99116619?v=4" width=300>|<img src="https://avatars.githubusercontent.com/u/114239407?v=4" width=300>|

