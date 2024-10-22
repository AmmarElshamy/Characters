//
//  CharactersViewController.swift
//  Characters
//
//  Created by Ammar Elshamy on 20/10/2024.
//

import UIKit
import SwiftUI

// MARK: - Protocol
protocol CharactersViewProtocol: AnyObject {
    func updateState(_ state: ViewState)
}

// MARK: - ViewController
class CharactersViewController: UIViewController {
    
    @IBOutlet weak var filterContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CharactersPresenterProtocol!
    
    // MARK: - CustomViews
    private var filterView: FilterView?
    
    private lazy var errorView = {
        let view = ErrorView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTitle()
        setupFilterView()
        presenter?.viewDidLoad()
    }
}

// MARK: - Setup
private extension CharactersViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: CharacterTableViewCell.self)
    }
    
    func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Characters"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.sizeToFit()
        
        let leftTitleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftTitleItem
    }
    
    func setupFilterView() {
        var filterView = FilterView(filters: presenter.filters)
        filterView.delegate = self
        let hostingController = UIHostingController(rootView: filterView)
        
        addChild(hostingController)
        filterContainerView.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: filterContainerView.leadingAnchor),
            hostingController.view.centerXAnchor.constraint(equalTo: filterContainerView.centerXAnchor),
            hostingController.view.topAnchor.constraint(equalTo: filterContainerView.topAnchor, constant: 8),
            hostingController.view.centerYAnchor.constraint(equalTo: filterContainerView.centerYAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}

// MARK: - UITableViewDataSource
extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfCharacters
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CharacterTableViewCell = tableView.dequeue(cellFor: indexPath) else { return .init() }
        let characterViewModel = presenter.viewModel(for: indexPath)
        cell.bind(viewModel: characterViewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > presenter.numberOfCharacters - 5 {
            presenter.loadMoreCharacters()
        }
    }
}

// MARK: - FilterViewDelegate
extension CharactersViewController: FilterViewDelegate {
    func didSelectFilter(_ filter: CharacterStatus) {
        presenter.filterCharacters(by: filter)
    }
}

// MARK: - ViewProtocol
extension CharactersViewController: CharactersViewProtocol {
    func updateState(_ state: ViewState) {
        switch state {
        case .loading:
            tableView.backgroundView = nil
            tableView.isScrollEnabled = false
        case .success:
            tableView.backgroundView = nil
            tableView.isScrollEnabled = true
        case .failure:
            tableView.backgroundView = errorView
            break
        }
        
        tableView.reloadData()
    }
}

// MARK: - ErrorViewDelegate
extension CharactersViewController: ErrorViewDelegate {
    func didTapRetry() {
        presenter.retry()
    }
}
