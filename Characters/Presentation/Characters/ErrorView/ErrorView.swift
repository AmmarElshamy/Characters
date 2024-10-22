//
//  ErrorView.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit
import Lottie

protocol ErrorViewDelegate: AnyObject {
    func didTapRetry()
}

final class ErrorView: UIView {
    @IBOutlet private weak var animationView: LottieAnimationView!
    @IBOutlet weak var retryButton: UIButton!
    
    weak var delegate: ErrorViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadCustomViewNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadCustomViewNib()
        setupViews()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
}

// MARK: - Setup
private extension ErrorView {
    func setupViews() {
        setupAnimationView()
        setupRetryButton()
    }
    
    func setupAnimationView() {
        let animation = LottieAnimation.named("ErrorLottieAnimation")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func setupRetryButton() {
        retryButton.setTitle("Retry", for: .normal)
        retryButton.setTitleColor(.black, for: .normal)
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = UIColor.black.cgColor
        retryButton.layer.cornerRadius = 8
    }
}

// MARK: - Actions
private extension ErrorView {
    @IBAction func retryTapAction(_ sender: Any) {
        delegate?.didTapRetry()
    }
}
