//
//  CharacterDetailsDummyResponse.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

extension CharacterDetails {
    static var dummy: Self {
        .init(id: 3, name: "name", species: "species", gender: "male", status: .dead, location: .dummy, image: "dummy image")
    }
}

extension Location {
    static var dummy: Self {
        .init(name: "earth")
    }
}
