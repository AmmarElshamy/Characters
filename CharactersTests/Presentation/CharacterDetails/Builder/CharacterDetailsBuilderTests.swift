//
//  CharacterDetailsBuilderTests.swift
//  Characters
//
//  Created by Ammar Elshamy on 23/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsBuilderTests: XCTestCase {
    func testBuilder_whenCreateModuleCalled_returnsCharachterDetailsView() {
        let view = CharacterDetailsBuilder.createModule(with: 1)
        XCTAssertNotNil(view as? CharacterDetailsViewController)
    }
}
