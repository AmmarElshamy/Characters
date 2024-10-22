//
//  DataSourceProtocol.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol DataSourceProtocol {
    func getData<T: Codable>(endpoint: Endpoint, completion:  @escaping (Result<T, Error>) -> Void)
}
