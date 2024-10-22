//
//  Data+Decoded.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension Data {
    func decoded<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: self)
    }
}
