//
//  CharacterDetailsPresenter.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

protocol CharacterDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func backButtonTapped()
}

final class CharacterDetailsPresenter {
    private let id: Int
    private let interactor: CharacterDetailsInteractorProtocol
    private let router: CharacterDetailsRouterProtocol
    private weak var view: CharacterDetailsViewProtocol?
    
    init(id: Int,
         interactor: CharacterDetailsInteractorProtocol,
         router: CharacterDetailsRouterProtocol,
         view: CharacterDetailsViewProtocol) {
        self.id = id
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchCharacterDetails(id: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(character):
                view?.showCharacter(character)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func backButtonTapped() {
        guard let view = view as? CharacterDetailsViewController else { return }
        router.popViewController(view)
    }
}
