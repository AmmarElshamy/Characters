//
//  CacheRepoProtocol.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol CacheRepoProtocol {
    associatedtype Local
    associatedtype Remote
    
    func getData<T: Codable>(endpoint: Endpoint, cachePolicy: CachePolicy, completion:  @escaping (Result<T, Error>) -> Void)
}
