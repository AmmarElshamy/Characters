//
//  LocalStorageKey.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol LocalStorageKey {
    var rawValue: String { get }
}

extension String: LocalStorageKey {
    var rawValue: String {
        self
    }
}
