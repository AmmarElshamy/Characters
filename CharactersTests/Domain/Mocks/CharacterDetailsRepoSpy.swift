//
//  CharacterDetailsRepoSpy.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import Foundation
@testable import Characters

final class CharacterDetailsRepoSpy {
    private(set) var fetchRepositoriesCallsCount = 0
    private(set) var id = 0
    private(set) var cachePolicy: CachePolicy?
    var result: Result<CharacterDetails, Error>?
}

extension CharacterDetailsRepoSpy: CharacterDetailsRepoProtocol {
    func fetchCharacterDetails(id: Int, cachePolicy: CachePolicy, completion: @escaping (Result<CharacterDetails, any Error>) -> ()) {
        fetchRepositoriesCallsCount += 1
        self.cachePolicy = cachePolicy
        self.id = id
        if let result {
            completion(result)
        }
    }
}
