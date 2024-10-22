//
//  LocalDataSource.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

class LocalDataSource: LocalDataSourceProtocol {
    
    private let client: LocalStorageClient
    
    init(client: LocalStorageClient = UserDefaults.standard) {
        self.client = client
    }
    
    func getData<T: Codable>(endpoint: Endpoint, completion:  @escaping (Result<T, Error>) -> Void) {
        guard let data: T = client.object(key: endpoint.cachingKey) else {
            completion(.failure(StorageError.unavailabeResources))
            return
        }
        
        completion(.success(data))
    }
    
    func saveData<T: Codable>(endpoint: Endpoint, data: T, completion: @escaping (Result<T, Error>) -> Void) {
        client.write(key: endpoint.cachingKey, object: data)
        completion(.success(data))
    }
}
