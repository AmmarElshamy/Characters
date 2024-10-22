//
//  NetworkConstantsTests.swift
//  CharactersTests
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import XCTest
@testable import Characters

final class NetworkConstantsTests: XCTestCase {
    func testNetworkConstants_baseURL() {
        let baseURL = "https://rickandmortyapi.com/api"
        XCTAssertEqual(NetworkConstants.baseURL, baseURL)
    }
}
