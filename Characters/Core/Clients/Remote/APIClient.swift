//
//  APIClient.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol APIClient {
    func perform<T: Decodable>(_ urlRequest: URLRequest?, completion: @escaping (Result<T, Error>) -> ())
}
