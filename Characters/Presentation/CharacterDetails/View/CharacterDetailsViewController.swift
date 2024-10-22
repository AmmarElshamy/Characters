//
//  CharacterDetailsViewController.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import UIKit

protocol CharacterDetailsViewProtocol: AnyObject {
    func showCharacter(_ character: CharacterDetails)
}

class CharacterDetailsViewController: UIViewController {
    var presenter: CharacterDetailsPresenterProtocol?
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesAndGenderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusBackgroundView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        statusBackgroundView.isCircular = true
    }
    
    // MARK: - Actions
    @IBAction func didTapBackButton(_ sender: Any) {
        presenter?.backButtonTapped()
    }
}

// MARK: - Setup
private extension CharacterDetailsViewController {
    func setupUI() {
        characterImageView.layer.cornerRadius = 30
        characterImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = UIColor.black
        
        speciesAndGenderLabel.textColor = UIColor.lightGray
        speciesAndGenderLabel.font = UIFont.systemFont(ofSize: 16)
        
        locationLabel.textColor = UIColor.darkText
        locationLabel.font = UIFont.systemFont(ofSize: 18)
        
        statusBackgroundView.backgroundColor = UIColor.systemBlue
        statusLabel.textColor = .black
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 16)
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewProtocol {
    func showCharacter(_ character: CharacterDetails) {
        characterImageView.loadImage(with: character.image)
        nameLabel.text = character.name
        speciesAndGenderLabel.text = "\(character.species ?? "") • \(character.gender ?? "")"
        locationLabel.text = "Location: \(character.location?.name ?? "")"
        statusLabel.text = character.status?.displayName
    }
}
