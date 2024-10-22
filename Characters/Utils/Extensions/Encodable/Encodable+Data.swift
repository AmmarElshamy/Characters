//
//  Encodable+Data.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension Encodable {
    var data: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
