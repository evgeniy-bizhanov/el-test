//
//  RepositoriesViewController.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

protocol RepositoriesOutput: class {}

final class RepositoriesViewController: UIViewController, RepositoriesOutput {
    
    // MARK: - IBOutlets
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
    }
    
    
    // MARK: - Initializers
}
