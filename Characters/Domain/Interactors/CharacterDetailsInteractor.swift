//
//  CharacterDetailsInteractor.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

// MARK: - Protocol
protocol CharacterDetailsInteractorProtocol {
    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetails, Error>) -> ())
}

// MARK: - Interactor
final class CharacterDetailsInteractor {
    private let repo: CharacterDetailsRepoProtocol
    
    init(repo: CharacterDetailsRepoProtocol) {
        self.repo = repo
    }
}

extension CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {
    func fetchCharacterDetails(id: Int, completion: @escaping (Result<CharacterDetails, any Error>) -> ()) {
        repo.fetchCharacterDetails(id: id, cachePolicy: .always) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
