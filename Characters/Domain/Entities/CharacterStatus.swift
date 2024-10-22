//
//  CharacterStatus.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

enum CharacterStatus: String, Equatable, CaseIterable, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
