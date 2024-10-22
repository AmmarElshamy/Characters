//
//  CharacterDetails.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import Foundation

// MARK: - Detials
struct CharacterDetails: Codable, Equatable {
    let id: Int
    let name, species, gender: String?
    let status: CharacterStatus?
    let location: Location?
    let image: String?
}

// MARK: - Location
struct Location: Codable, Equatable {
    let name: String?
}
