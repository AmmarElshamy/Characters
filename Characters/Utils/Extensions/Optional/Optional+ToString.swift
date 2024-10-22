//
//  Int+ToString.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension Optional {
    var toString: String? {
        switch self {
        case .none:
            return nil
        case let .some(value):
            return "\(value)"
        }
    }
}
