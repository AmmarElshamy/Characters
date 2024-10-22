//
//  RemoteDataSourceSpy.swift
//  CharactersTests
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import Foundation
@testable import Characters

final class RemoteDataSourceSpy<U> {
    private(set) var getDataCallsCount = 0
    private(set) var endpoint: Endpoint?
    
    var result: Result<U, Error>?
}

extension RemoteDataSourceSpy: RemoteDataSourceProtocol {
    func getData<T: Encodable>(endpoint: Characters.Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        getDataCallsCount += 1
        self.endpoint = endpoint
        
        if let result = result as? Result<T, Error> {
            completion(result)
        }
    }
}
