//
//  LocalStorageClient.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

protocol LocalStorageClient {
    func object<T: Decodable>(key: LocalStorageKey) -> T?
    func write<T: Encodable>(key: LocalStorageKey, object: T?)
}
