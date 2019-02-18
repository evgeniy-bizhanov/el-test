//
//  RepositoriesViewController.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

protocol RepositoriesOutput: class {
    
    /// Reloads view, e.g. table view, collection view etc
    func reloadView()
}

final class RepositoriesViewController: UIViewController, RepositoriesOutput {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Models
    // MARK: - Services
    // MARK: - Properties
    
    var input: RepositoriesInput?
    var router: RepositoriesRouter?
    
    
    // MARK: - Fields
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: - IBActions
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input?.didLoad()
        
        setupTableView()
        setupSearchController()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = input as? UITableViewDataSource
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.prepare(for: segue, sender: sender)
    }
    
    
    // MARK: - RepositoriesOutput
    
    func reloadView() {
        tableView.reloadData()
    }
    
    
    // MARK: - Initializers
}


// MARK: - UISearchResultsUpdating

extension RepositoriesViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        input?.search(query: searchController.searchBar.text)
    }
}


// MARK: - UISearchControllerDelegate

extension RepositoriesViewController: UISearchControllerDelegate {

    func didDismissSearchController(_ searchController: UISearchController) {
        input?.didEndSearching()
    }
}


// MARK: - UITableViewDelegate

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repo = input?.repository(at: indexPath.row) else {
            return
        }
        
        router?.toDetailView(of: repo)
    }
}
