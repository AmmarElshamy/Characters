//
//  CharactersEndpoint.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

enum CharactersEndpoint: Equatable {
    case all(status: CharacterStatus?, page: Int)
    case single(id: Int)
}

extension CharactersEndpoint: Endpoint {
    var path: String {
        switch self {
        case .all:
            return "/character/"
            
        case let .single(id):
            return "/character/\(id)"
        }
    }
    
    var params: [String : String]? {
        switch self {
        case let .all(status, page):
            var params = ["page": "\(page)"]
            if let status {
                params["status"] = status.rawValue
            }
            return params
            
        case .single:
            return nil
        }
    }
}
