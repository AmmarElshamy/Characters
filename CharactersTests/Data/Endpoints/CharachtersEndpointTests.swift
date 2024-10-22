//
//  CharactersEndpointTests.swift
//  CharactersTests
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class CharactersEndpointTests: XCTestCase {
    private let allCharactersEndpoint = CharactersEndpoint.all(status: .alive, page: 3)
    private let singleCharacterEndpoint = CharactersEndpoint.single(id: 5)
    
    func testAllCharactersEndpoint_usesCorrectBaseURL() {
        // Given
        let baseURL = allCharactersEndpoint.baseURL
        
        // Then
        XCTAssertEqual(baseURL, NetworkConstants.baseURL)
    }
    
    func testAllCharactersEndpoint_usesCorrectPath() {
        // Given
        let allCharactersPath = "/character/"
        let path = allCharactersEndpoint.path
        
        // Then
        XCTAssertEqual(path, allCharactersPath)
    }
    
    func testAllCharactersEndpoint_usesCorrectQueryPrameters() {
        // Given
        let allCharactersParams = ["status": "Alive",
                                   "page": "3"]
        let parameters = allCharactersEndpoint.params
        
        // Then
        XCTAssertEqual(parameters, allCharactersParams)
    }
    
    func testAllCharactersEndpoint_usesGetMethod() {
        // Given
        let method = allCharactersEndpoint.method
        
        // Then
        XCTAssertEqual(method, .GET)
    }
    
    func testSingleCharacterEndpoint_usesCorrectBaseURL() {
        // Given
        let baseURL = singleCharacterEndpoint.baseURL
        
        // Then
        XCTAssertEqual(baseURL, NetworkConstants.baseURL)
    }
    
    func testSingleCharacterEndpoint_usesCorrectPath() {
        // Given
        let singleCharacterPath = "/character/5"
        let path = singleCharacterEndpoint.path
        
        // Then
        XCTAssertEqual(path, singleCharacterPath)
    }
    
    func testSingleCharacterEndpoint_usesNoQueryPrameters() {
        // Given
        let parameters = singleCharacterEndpoint.params
        
        // Then
        XCTAssertNil(parameters)
    }
    
    func testSingleCharacterEndpoint_usesGetMethod() {
        // Given
        let method = singleCharacterEndpoint.method
        
        // Then
        XCTAssertEqual(method, .GET)
    }
    
}
