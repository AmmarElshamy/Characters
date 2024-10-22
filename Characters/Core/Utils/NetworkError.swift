//
//  NetworkError.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

enum NetworkError {
    case noData
    case networkError
    case invalidAPIKey
    case badURL
    case unKnown
}

extension NetworkError: Error {
    public var localizedDescription: String {
        switch self {
        case .noData:
            return NSLocalizedString("The resource you requested could not be found.",
                                     comment: "No Data")
            
        case .networkError:
            return NSLocalizedString("Generic Network Error.",
                                     comment: "Network Error")
            
        case .invalidAPIKey:
            return NSLocalizedString("Invalid API key: You must be granted a valid key.",
                                     comment: "Invalid API Key")
            
        case .badURL:
            return NSLocalizedString("Invalid URL.",
                                     comment: "Invalid URL")
            
        case .unKnown:
            return NSLocalizedString("Something Went Wrong",
                                     comment: "Unknow Error")
        }
    }
}
