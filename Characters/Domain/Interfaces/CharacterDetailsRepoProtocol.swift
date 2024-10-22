//
//  CharacterDetailsRepoProtocol.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

protocol CharacterDetailsRepoProtocol {
    func fetchCharacterDetails(id: Int,
                               cachePolicy: CachePolicy,
                               completion: @escaping (Result<CharacterDetails, any Error>) -> ())
}
