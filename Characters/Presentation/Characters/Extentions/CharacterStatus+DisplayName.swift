//
//  CharacterStatus+DisplayName.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

extension CharacterStatus {
    var displayName: String {
        rawValue.firstUppercased
    }
}
