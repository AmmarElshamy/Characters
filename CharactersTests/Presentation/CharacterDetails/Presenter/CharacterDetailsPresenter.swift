//
//  CharacterDetailsPresenter.swift
//  Characters
//
//  Created by Ammar Elshamy on 23/10/2024.
//

import XCTest
@testable import Characters

class CharacterDetailsPresenterTests: XCTestCase {
    var presenter: CharacterDetailsPresenter!
    var mockInteractor: CharacterDetailsInteractorSpy!
    var mockRouter: CharacterDetailsRouterSpy!
    var mockView: CharacterDetailsIViewSpy!
    
    override func setUp() {
        super.setUp()
        mockInteractor = CharacterDetailsInteractorSpy()
        mockRouter = CharacterDetailsRouterSpy()
        mockView = CharacterDetailsIViewSpy()
        presenter = CharacterDetailsPresenter(id: 1,
                                              interactor: mockInteractor,
                                              router: mockRouter,
                                              view: mockView)
    }

    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        mockRouter = nil
        mockView = nil
        super.tearDown()
    }

    func testViewDidLoadFetchesCharacterDetails() {
        // Given
        let expectedCharacter = CharacterDetails.dummy
        mockInteractor.resultToReturn = .success(expectedCharacter)
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertEqual(mockInteractor.fetchCharacterDetailsCallsCount, 1)
        XCTAssertEqual(mockView.showCharacterCallsCount, 1)
        XCTAssertEqual(mockView.characterDetails, expectedCharacter)
    }

    func testViewDidLoadHandlesError() {
        // Given
        let expectedError = NSError(domain: "TestError", code: 1, userInfo: nil)
        mockInteractor.resultToReturn = .failure(expectedError)
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertEqual(mockInteractor.fetchCharacterDetailsCallsCount, 1)
        XCTAssertEqual(mockView.showCharacterCallsCount, 0)
    }

    func testBackButtonTappedPopsViewController() {
        // Given
        let viewController = CharacterDetailsViewController()
        presenter = .init(id: 1,
                          interactor: mockInteractor,
                          router: mockRouter,
                          view: viewController)
        
        // When
        presenter.backButtonTapped()
        
        // Then
        XCTAssertEqual(mockRouter.popViewControllerCallsCount, 1)
        XCTAssertEqual(mockRouter.viewControllerToPop, viewController)
    }
}
