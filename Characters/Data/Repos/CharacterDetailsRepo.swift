//
//  CharacterDetailsRepo.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

final class CharacterDetailsRepo: CacheRepo { }

extension CharacterDetailsRepo: CharacterDetailsRepoProtocol {
    func fetchCharacterDetails(id: Int, cachePolicy: CachePolicy, completion: @escaping (Result<CharacterDetails, any Error>) -> ()) {
        let endPoint = CharactersEndpoint.single(id: id)
        getData(endpoint: endPoint, cachePolicy: cachePolicy, completion: completion)
    }
}
