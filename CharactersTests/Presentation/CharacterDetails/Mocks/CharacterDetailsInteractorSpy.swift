//
//  CharacterDetailsInteractorSpy.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsInteractorSpy: CharacterDetailsInteractorProtocol {
    var fetchCharacterDetailsCallsCount = 0
    var resultToReturn: Result<CharacterDetails, Error>?
    
    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetails, Error>) -> Void) {
        fetchCharacterDetailsCallsCount += 1
        if let result = resultToReturn {
            completion(result)
        }
    }
}
