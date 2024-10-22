//
//  Decoder.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension JSONDecoder {
    static var standard: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
