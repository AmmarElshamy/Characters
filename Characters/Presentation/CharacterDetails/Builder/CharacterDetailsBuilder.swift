//
//  CharacterDetailsBuilder.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit

final class CharacterDetailsBuilder {
    static func createModule(with id: Int) -> UIViewController {
        let view = CharacterDetailsViewController()
        let repo = CharacterDetailsRepo()
        let interactor = CharacterDetailsInteractor(repo: repo)
        let router = CharacterDetailsRouter()
        let presenter = CharacterDetailsPresenter(id: id,
                                                  interactor: interactor,
                                                  router: router,
                                                  view: view)
        
        view.presenter = presenter
        return view
    }
}
