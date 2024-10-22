//
//  CharacterDetailsInteractorTests.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class TrendingRepositoriesUseCaseTests: XCTestCase {
    
    private var sut: CharacterDetailsInteractor!
    private var repo: CharacterDetailsRepoSpy!

    override func setUp() {
        repo = .init()
        sut = .init(repo: repo)
    }
    
    override func tearDown() {
        repo = nil
        sut = nil
    }
    
    func testInteractor_whenFetchCharacterDetailsCalled_callsRepoFetchRepositories() {
        // When
        sut.fetchCharacterDetails(id: 5) { _ in }
        
        // Then
        XCTAssertEqual(repo.fetchRepositoriesCallsCount, 1)
        XCTAssertEqual(repo.cachePolicy, .always)
        XCTAssertEqual(repo.id, 5)
    }
    
    func testInteractor_whenFetchCharacterDetailsCalled_withSuccessResponse_excutessCompletion() {
        // Given
        let expectation = expectation(description: "Use Case Success Response")
        let response: CharacterDetails = .dummy
        var expectedResponse: CharacterDetails?
        repo.result = .success(response)
        
        // When
        sut.fetchCharacterDetails(id: 3) { result in
            switch result {
            case let .success(data):
                expectedResponse = data
                expectation.fulfill()
            case .failure:
                break
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(expectedResponse, response)
    }
    
    func testInteractor_whenFetchCharacterDetailsCalled_withFailureResponse_excutessCompletion() {
        // Given
        let expectation = expectation(description: "Use Case Success Response")
        let error: TestingError = .dummy
        var expectedError: TestingError?
        repo.result = .failure(error)
        
        // When
        sut.fetchCharacterDetails(id: 3) { result in
            switch result {
            case .success:
                break
            case .failure:
                expectedError = error
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(expectedError, error)
    }
}
