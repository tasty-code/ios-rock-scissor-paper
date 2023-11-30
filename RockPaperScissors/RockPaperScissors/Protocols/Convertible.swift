//
//  Convertible.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/29.
//

import Foundation

protocol Convertible {
    associatedtype T
    
    var convertedType: T { get }
}
