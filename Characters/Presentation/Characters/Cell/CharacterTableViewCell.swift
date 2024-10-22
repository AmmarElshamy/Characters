//
//  CharacterTableViewCell.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit
import SkeletonView

final class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBorder()
        setupUI()
        setupSkeleton()
    }
}

// MARK: - Setup
private extension CharacterTableViewCell {
    func setupBorder() {
        containerView.layer.borderColor = UIColor.systemGray3.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.layer.cornerRadius = 16.0
        containerView.layer.masksToBounds = true
    }
    
    func setupUI() {
        selectionStyle = .none
        
        characterImageView.layer.cornerRadius = 8
        characterImageView.layer.masksToBounds = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        speciesLabel.font = UIFont.systemFont(ofSize: 16)
        speciesLabel.textColor = .gray
    }
    
    func setupSkeleton() {
        containerView.isSkeletonable = false
        
        nameLabel.skeletonTextLineHeight = .fixed(10)
        nameLabel.skeletonCornerRadius = 5
        
        speciesLabel.skeletonTextLineHeight = .fixed(10)
        speciesLabel.skeletonCornerRadius = 5
    }
}

// MARK: - Binding
extension CharacterTableViewCell {
    func bind(viewModel: ViewModelState<ViewModel>) {
        switch viewModel {
        case let .data(model):
            containerView.subviews.forEach { $0.hideSkeleton() }
            configureViews(with: model)
            isUserInteractionEnabled = true
        case .skeleton:
            containerView.subviews.forEach { $0.showAnimatedSkeleton() }
            isUserInteractionEnabled = false
        }
    }
    
    private func configureViews(with model: ViewModel) {
        nameLabel.text = model.name
        speciesLabel.text = model.species
        characterImageView.loadImage(with: model.image)
    }
}
