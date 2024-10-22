//
//  CacheRepo.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

class CacheRepo: CacheRepoProtocol {
    typealias Local = LocalDataSourceProtocol
    typealias Remote = RemoteDataSourceProtocol
    
    private let local: Local
    private let remote: Remote
    
    init(local: Local = LocalDataSource(), remote: Remote = RemoteDataSource()) {
        self.local = local
        self.remote = remote
    }
    
    final func getData<T: Codable>(endpoint: Endpoint, cachePolicy: CachePolicy = .never, completion: @escaping (Result<T, Error>) -> Void) {
        switch cachePolicy {
        case .never:
            remote.getData(endpoint: endpoint, completion: completion)
        case .always:
            getCachedFirst(endpoint: endpoint, completion: completion)
        case .remoteFirst:
            fetchRemoteFirst(endpoint: endpoint, completion: completion)
        }
    }
}

// MARK: - Fetching Variants
private extension CacheRepo {
    func getCachedFirst<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        local.getData(endpoint: endpoint) {[weak self] (result: Result<T, Error>)  in
            switch result {
            case let .success(data):
                completion(.success(data))
            case .failure:
                self?.fetchData(endpoint: endpoint, completion: completion)
            }
        }
    }
    
    func fetchData<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        remote.getData(endpoint: endpoint) {[weak self] (result: Result<T, Error>)  in
            switch result {
            case let .success(data):
                self?.local.saveData(endpoint: endpoint, data: data, completion: completion)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchRemoteFirst<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        remote.getData(endpoint: endpoint) {[weak self] (result: Result<T, Error>)  in
            switch result {
            case let .success(data):
                self?.local.saveData(endpoint: endpoint, data: data, completion: completion)
            case .failure:
                self?.local.getData(endpoint: endpoint, completion: completion)
            }
        }
    }
}
