//
//  CharactersPresenter.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

// MARK: - Protocol
protocol CharactersPresenterProtocol: AnyObject {
    var filters: [CharacterStatus] { get }
    var numberOfCharacters: Int { get }
    
    func viewDidLoad()
    func loadMoreCharacters()
    func filterCharacters(by filter: CharacterStatus)
    func viewModel(for indexPath: IndexPath) -> ViewModelState<CharacterViewModel>
    func didSelectItem(at indexPath: IndexPath)
    func retry()
}

// MARK: - Presenter
class CharactersPresenter {
    private let interactor: CharactersInteractorProtocol
    private let router: CharactersRouterProtocol
    private weak var view: CharactersViewProtocol?
    private var characters = [Character]()
    private var viewModels = [ViewModelState<CharacterViewModel>]()
    var selectedFilter: CharacterStatus?
    
    
    init(view: CharactersViewProtocol, interactor: CharactersInteractorProtocol, router: CharactersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CharactersPresenter: CharactersPresenterProtocol {
    var filters: [CharacterStatus] {
        CharacterStatus.allCases
    }
    
    var numberOfCharacters: Int {
        viewModels.count
    }
    
    func viewDidLoad() {
        loadCharacters()
    }
    
    private func loadCharacters() {
        handleLoadingState()
        interactor.fetchCharacters(status: selectedFilter) { [weak self] result in
            switch result {
            case let .success(characters):
                self?.characters = characters
                self?.handleSuccessState()
            case .failure:
                self?.handleFailureState()
            }
        }
    }
    
    func loadMoreCharacters() {
        interactor.fetchMoreCharacters(status: selectedFilter) { [weak self] result in
            switch result {
            case let .success(characters):
                self?.characters.append(contentsOf: characters)
                self?.handleSuccessState()
            case .failure:
                break
            }
        }
    }
    
    func filterCharacters(by filter: CharacterStatus) {
        selectedFilter = filter
        loadCharacters()
    }
    
    func viewModel(for indexPath: IndexPath) -> ViewModelState<CharacterViewModel> {
        viewModels[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let view = view as? CharactersViewController else { return }
        let id = characters[indexPath.row].id
        router.navigateToCharacterDetails(from: view, with: id)
    }
    
    func retry() {
        loadCharacters()
    }
}

// MARK: - States Handlers
private extension CharactersPresenter {
    func handleLoadingState() {
        viewModels = .init(repeating: .skeleton, count: 6)
        view?.updateState(.loading)
    }
    
    func handleSuccessState() {
        viewModels = characters.compactMap { $0.toViewModel.wrapped }
        view?.updateState(.success)
    }
    
    func handleFailureState() {
        characters = []
        viewModels = []
        view?.updateState(.failure)
    }
}


//characters = [Character(id: 1, name: "Zephyr", species: "Elf", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Aurora", species: "Human", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Thorne", species: "Dwarf", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Lyra", species: "Faerie", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Magnus", species: "Orc", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Aurora", species: "Human", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Thorne", species: "Dwarf", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Lyra", species: "Faerie", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Magnus", species: "Orc", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Aurora", species: "Human", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Thorne", species: "Dwarf", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Lyra", species: "Faerie", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp"),
//              Character(id: 1, name: "Magnus", species: "Orc", status: .alive, image: "https://pics.craiyon.com/2024-09-24/rDZOg-r2QTGxBBTGA9j0IA.webp")]
