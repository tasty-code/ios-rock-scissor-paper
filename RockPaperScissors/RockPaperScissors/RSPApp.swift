//
//  RSPApp.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

final class RSPApp {
    private var isRunning: Bool = true
    
    func run() {
        while isRunning {
            // 프롬포터 출력
            printPrompt()
            // 입력 받기
            guard let input = getInput() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            print("입력: ", input)
            // 입력 > 가위바위보로 바꾸기
            
            
                // 성공 -> process
                // 실패 -> "잘못된 입력입니다. 다시 시도해주세요." 출력
        }
    }
    
    private func printPrompt() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func getInput() -> String? {
        guard let pureInput = Swift.readLine() else { return nil }
        // 문자열 가공
        let result = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        return result.isEmpty ? nil : result
    }
}
