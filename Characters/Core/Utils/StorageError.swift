//
//  StorageError.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

enum StorageError {
    case unavailabeResources
}

extension StorageError: Error {
    public var localizedDescription: String {
        switch self {
        case .unavailabeResources:
            return NSLocalizedString("The resource you requested could not be found.",
                                     comment: "No Data")
        }
    }
}
