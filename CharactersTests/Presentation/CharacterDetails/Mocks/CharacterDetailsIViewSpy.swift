//  CharacterDetailsIViewSpy.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsIViewSpy: CharacterDetailsViewProtocol {
    var showCharacterCallsCount = 0
    var characterDetails: CharacterDetails?
    
    func showCharacter(_ characterDetails: CharacterDetails) {
        showCharacterCallsCount += 1
        self.characterDetails = characterDetails
    }
}
