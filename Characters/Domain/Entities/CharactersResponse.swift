//
//  CharactersResponse.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

// MARK: - Response
struct CharactersResponse: Codable {
    let info: CharactersResponseInfo?
    let results: [Character]?
}

// MARK: - Info
struct CharactersResponseInfo: Codable {
    let count, pages: Int?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name, species: String?
    let status: CharacterStatus?
    let image: String?
}
