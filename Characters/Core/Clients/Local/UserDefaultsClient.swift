//
//  UserDefaultsClient.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension UserDefaults: LocalStorageClient {
    func object<T: Decodable>(key: LocalStorageKey) -> T? {
        data(forKey: key.rawValue)?.decoded()
    }
    
    func write<T: Encodable>(key: LocalStorageKey, object: T?) {
        set(object?.data, forKey: key.rawValue)
    }
}
