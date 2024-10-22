//
//  Endpoint.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var params: [String: String]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }

    var urlRequest: URLRequest? { get }
    var cachingKey: String { get }
}

extension Endpoint {
    var baseURL: String { NetworkConstants.baseURL }
    var method: HTTPMethod { .GET }
    var params: [String: String]? { nil }
    var headers: [String: String]? { nil }
    var body: Data? { nil }
    
    var urlRequest: URLRequest? {
        guard var urlComponents = URLComponents(string: "\(baseURL)") else {
            return nil
        }

        let queryItems = params?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        } ?? []
        urlComponents.queryItems = queryItems
        urlComponents.path = urlComponents.path + path
        
        guard let url = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = body
        
        return urlRequest
    }
    
    var cachingKey: String {
        let paramsKey = params?.values.joined(separator: "_") ?? "_"
        return "\(baseURL)\(path)\(paramsKey)"
    }
}
