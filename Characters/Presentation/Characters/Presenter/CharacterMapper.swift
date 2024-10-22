//
//  CharacterMapper.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

extension Character {
    var toViewModel: CharacterViewModel {
        .init(name: name ?? "", species: species ?? "", image: image)
    }
}
