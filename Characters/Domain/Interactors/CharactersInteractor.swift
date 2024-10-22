//
//  CharactersInteractor.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

// MARK: - Protocol
protocol CharactersInteractorProtocol {
    func fetchCharacters(status: CharacterStatus?, completion: @escaping (Result<[Character], Error>) -> ())
    func fetchMoreCharacters(status: CharacterStatus?, completion: @escaping (Result<[Character], Error>) -> ())
}

// MARK: - Interactor
final class CharactersInteractor {
    private let repo: CharactersRepoProtocol
    private let pageSize = 20
    private var nextPage = 1
    private var hasMoreData: Bool = true
    private var isPaginating: Bool = false
    
    init(repo: CharactersRepoProtocol) {
        self.repo = repo
    }
}

extension CharactersInteractor: CharactersInteractorProtocol {
    func fetchCharacters(status: CharacterStatus?, completion: @escaping (Result<[Character], any Error>) -> ()) {
        nextPage = 1
        hasMoreData = true
        getCharacters(status: status, completion: completion)
    }
    
    func fetchMoreCharacters(status: CharacterStatus?, completion: @escaping (Result<[Character], any Error>) -> ()) {
        guard hasMoreData, !isPaginating else { return }
        isPaginating = true
        getCharacters(status: status, completion: completion)
    }
    
    private func getCharacters(status: CharacterStatus?, completion: @escaping (Result<[Character], any Error>) -> ()) {
        repo.fetchCharacters(status: status, page: nextPage, cachePolicy: .remoteFirst) { [weak self] result in
            guard let self else { return }
            isPaginating = false
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    if response.results?.count ?? 0 < 20 {
                        self.hasMoreData = false
                    } else {
                        self.nextPage += 1
                    }
                    completion(.success(response.results ?? []))
                    
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        }
    }
}
