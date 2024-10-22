//
//  CharacterDetailsPresenterSpy.swift
//  Characters
//
//  Created by Ammar Elshamy on 23/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsPresenterSpy: CharacterDetailsPresenterProtocol {
    var viewDidLoadCallsCount = 0
    var backButtonTappedCallsCount = 0
    
    func viewDidLoad() {
        viewDidLoadCallsCount += 1
    }
    
    func backButtonTapped() {
        backButtonTappedCallsCount += 1
    }
}
