//
//  CharactersRepoProtocol.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

protocol CharactersRepoProtocol {
    func fetchCharacters(status: CharacterStatus?,
                         page: Int,
                         cachePolicy: CachePolicy,
                         completion: @escaping (Result<CharactersResponse, Error>) -> ())
}
