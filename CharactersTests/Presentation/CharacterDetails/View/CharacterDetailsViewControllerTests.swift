//
//  CharacterDetailsViewControllerTests.swift
//  Characters
//
//  Created by Ammar Elshamy on 23/10/2024.
//

import XCTest
@testable import Characters

class CharacterDetailsViewControllerTests: XCTestCase {
    var viewController: CharacterDetailsViewController!
    var mockPresenter: CharacterDetailsPresenterSpy!

    override func setUp() {
        super.setUp()
        viewController = CharacterDetailsViewController()
        mockPresenter = .init()
        viewController.presenter = mockPresenter
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testViewDidLoad_callsPresenter() {
        // Then
        XCTAssertEqual(mockPresenter.viewDidLoadCallsCount, 1)
    }
    
    func testShowCharacter_updatesUI() {
        // Given
        let character = CharacterDetails(
            id: 1,
            name: "Rick Sanchez",
            species: "Human",
            gender: "Male",
            status: .alive,
            location: Location(name: "Earth"),
            image: "https://rickandmortyapi.com/api/character/361"
        )
        
        // When
        viewController.showCharacter(character)
        
        // Then
        XCTAssertEqual(viewController.nameLabel.text, "Rick Sanchez")
        XCTAssertEqual(viewController.speciesAndGenderLabel.text, "Human • Male")
        XCTAssertEqual(viewController.locationLabel.text, "Location: Earth")
        XCTAssertEqual(viewController.statusLabel.text, "Alive")
    }
    
    func testBackButtonTapped_callsPresenter() {
        // When
        viewController.didTapBackButton(self)
        
        // Then
        XCTAssertEqual(mockPresenter.backButtonTappedCallsCount, 1)
    }
}
