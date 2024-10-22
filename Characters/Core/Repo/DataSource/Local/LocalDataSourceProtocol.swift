//
//  LocalDataSourceProtocol.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol LocalDataSourceProtocol: DataSourceProtocol {
    func saveData<T: Codable>(endpoint: Endpoint, data: T, completion: @escaping (Result<T, Error>) -> Void)
}
