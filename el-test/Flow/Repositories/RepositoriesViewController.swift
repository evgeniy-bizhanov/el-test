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
    // MARK: - IBActions
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input?.didLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = input as? UITableViewDataSource
    }
    
    func reloadView() {
        tableView.reloadData()
    }
    
    
    // MARK: - Initializers
}
