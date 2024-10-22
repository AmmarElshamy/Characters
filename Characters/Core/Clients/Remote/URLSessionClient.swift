//
//  URLSessionClient.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import Foundation

extension URLSession: APIClient {
    func perform<T: Decodable>(_ urlRequest: URLRequest?, completion: @escaping (Result<T, Error>) -> ()) {
        guard let urlRequest else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        dataTask(with: urlRequest) { (data, response, error) in
            print("🌐 Request >>>", urlRequest.url!.absoluteString)
            let result: Result<T, Error>
            defer {
                completion(result)
            }
            
            if let error = error {
                result = .failure(error)
                return
            }
            
            guard let data = data else {
                result = .failure(NetworkError.noData)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    break
                case 401:
                    result = .failure(NetworkError.invalidAPIKey)
                    return
                case 404, 422:
                    result = .failure(NetworkError.noData)
                    return
                default:
                    result = .failure(NetworkError.networkError)
                    return
                }
            }
            
            do {
                let response = try JSONDecoder.standard.decode(T.self, from: data)
                print("🌐 Response >>>", response)
                result = .success(response)
            } catch {
                result = .failure(error)
            }
        }.resume()
    }
}
