//
//  CharactersRepo.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

final class CharactersRepo: CacheRepo { }

extension CharactersRepo: CharactersRepoProtocol {
    func fetchCharacters(status: CharacterStatus?, page: Int, cachePolicy: CachePolicy, completion: @escaping (Result<CharactersResponse, any Error>) -> ()) {
        let endPoint = CharactersEndpoint.all(status: status, page: page)
        getData(endpoint: endPoint, cachePolicy: cachePolicy, completion: completion)
    }
}
