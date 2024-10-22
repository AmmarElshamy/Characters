//
//  LocalDataSourceSpy.swift
//  CharactersTests
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import Foundation
@testable import Characters

final class LocalDataSourceSpy<U> {
    private(set) var saveDataCallsCount = 0
    private(set) var getDataCallsCount = 0
    private(set) var endpoint: Endpoint?
    
    var result: Result<U, Error>?
}

extension LocalDataSourceSpy: LocalDataSourceProtocol {
    func saveData<T: Codable>(endpoint: Endpoint, data: T, completion: @escaping (Result<T, Error>) -> Void) {
        saveDataCallsCount += 1
        self.endpoint = endpoint
        completion(.success(data))
    }
    
    func getData<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        getDataCallsCount += 1
        self.endpoint = endpoint
        
        if let result = result as? Result<T, Error> {
            completion(result)
        }
    }
}
