//
//  ViewModelState.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

enum ViewModelState<T: Equatable>: Equatable {
    case data(_ value: T)
    case skeleton
}

extension ViewModelState {
    var value: T? {
        guard case let .data(data) = self else { return nil }
        return data
    }
    
    var isSkeleton: Bool {
        guard case .skeleton = self else { return false }
        return true
    }
}
