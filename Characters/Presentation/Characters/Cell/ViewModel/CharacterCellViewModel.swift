//
//  CharacterCellViewModel.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

typealias CharacterViewModel = CharacterTableViewCell.ViewModel

// MARK: - Model
extension CharacterTableViewCell {
    struct ViewModel: Equatable {
        let name: String
        let species: String
        let image: String?
    }
}

// MARK: - Wrapper
extension CharacterViewModel {
    var wrapped: ViewModelState<Self> {
        .data(self)
    }
}
