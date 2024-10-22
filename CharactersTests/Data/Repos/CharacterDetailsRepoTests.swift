//
//  CharacterDetailsRepoTests.swift
//  CharactersTests
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsRepoTests: XCTestCase {
    
    private var sut: CharacterDetailsRepo!
    private var localDataSource: LocalDataSourceSpy<CharacterDetails>!
    private var remoteDataSource: RemoteDataSourceSpy<CharacterDetails>!
    
    override func setUp() {
        localDataSource = .init()
        remoteDataSource = .init()
        sut = .init(local: localDataSource, remote: remoteDataSource)
    }
    
    override func tearDown() {
        localDataSource = nil
        remoteDataSource = nil
        sut = nil
    }
    
    // MARK: - Always Cache Policy
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_getsDataFromLocalSourceFirst() {
        // Given
        let expectedEndpoint = CharactersEndpoint.single(id: 2)
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in }
        
        // Then
        XCTAssertEqual(localDataSource.getDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_andCachedData_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .success(.dummy)
        localDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_andNoCachedData_getsDataFromRemoteSource() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let expectedEndpoint = CharactersEndpoint.single(id: 2)

        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in }

        // Then
        XCTAssertEqual(remoteDataSource.getDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_noCachedData_andSuccessRemoteResponse_savesData() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let remoteResult: Result<CharacterDetails, Error> = .success(.dummy)
        remoteDataSource.result = remoteResult
        let expectedEndpoint = CharactersEndpoint.single(id: 2)

        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in }

        // Then
        XCTAssertEqual(localDataSource.saveDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_noCachedData_andSuccessRemoteResponse_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        let remoteResult: Result<CharacterDetails, Error> = .success(.dummy)
        remoteDataSource.result = remoteResult
        var didExcuteCompletion = false
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withAlwaysCachePolicy_noCachedData_andFailureRemoteResponse_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        localDataSource.result = result
        remoteDataSource.result = result
        var didExcuteCompletion = false

        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .always) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    // MARK: - Remote First Cache Policy
    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_getsDataFromRemoteSourceFirst() {
        // Given
        let expectedEndpoint = CharactersEndpoint.single(id: 2)

        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in }
        
        // Then
        XCTAssertEqual(remoteDataSource.getDataCallsCount, 1)
        XCTAssertEqual(remoteDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_andSuccessResponse_savesData() {
        // Given
        let result: Result<CharacterDetails, Error> = .success(.dummy)
        remoteDataSource.result = result
        let expectedEndpoint = CharactersEndpoint.single(id: 2)

        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in }

        // Then
        XCTAssertEqual(localDataSource.saveDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }

    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_andSuccessResponse_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .success(.dummy)
        remoteDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_andFailureResponse_getsDataFromLocalSourceFirst() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        let expectedEndpoint = CharactersEndpoint.single(id: 2)

        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in }

        // Then
        XCTAssertEqual(localDataSource.getDataCallsCount, 1)
        XCTAssertEqual(localDataSource.endpoint as? CharactersEndpoint, expectedEndpoint)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_failureResponse_andCachedData_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        let localResult: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        localDataSource.result = localResult
        var didExcuteCompletion = false
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
    
    func testRepo_whenFetchCharacterDetailsCalled_withRemoteFirstCachePolicy_failureResponse_andNoCachedData_excutesCompletion() {
        // Given
        let result: Result<CharacterDetails, Error> = .failure(TestingError.dummy)
        remoteDataSource.result = result
        localDataSource.result = result
        var didExcuteCompletion = false
        
        // When
        sut.fetchCharacterDetails(id: 2, cachePolicy: .remoteFirst) { _ in
            didExcuteCompletion = true
        }
        
        // Then
        XCTAssertTrue(didExcuteCompletion)
    }
}
