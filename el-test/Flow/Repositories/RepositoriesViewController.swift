//
//  RepositoriesViewController.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

protocol RepositoriesOutput: class {
    func reloadView()
}

final class RepositoriesViewController: UIViewController, RepositoriesOutput {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Models
    // MARK: - Services
    // MARK: - Properties
    
    var input: RepositoriesInput?
    
    
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
    
    
    // MARK: - RepositoriesOutput
    
    func reloadView() {
        tableView.reloadData()
    }
    
    
    // MARK: - Initializers
}

extension RepositoriesViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        input?.search(query: searchController.searchBar.text)
    }
}

extension RepositoriesViewController: UISearchControllerDelegate {

    func didDismissSearchController(_ searchController: UISearchController) {
        input?.didEndSearching()
    }
}


