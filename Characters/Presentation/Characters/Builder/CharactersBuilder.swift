//
//  CharactersBuilder.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit

final class CharactersBuilder {
    static func createModule() -> UIViewController {
        let view = CharactersViewController()
        let repo = CharactersRepo()
        let interactor = CharactersInteractor(repo: repo)
        let router = CharactersRouter()
        let presenter: CharactersPresenterProtocol = CharactersPresenter(view: view,
                                                                         interactor: interactor,
                                                                         router: router)
        
        view.presenter = presenter
        return view
    }
}
