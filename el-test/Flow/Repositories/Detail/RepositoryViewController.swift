//
//  RepositoryViewController.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

final class RepositoryViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Models
    
    var model: Repository?
    
    
    // MARK: - Services
    // MARK: - Properties
    // MARK: - Fields
    // MARK: - IBActions
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignModel(model)
    }
    
    func assignModel(_ model: Repository?) {
        
        guard let model = model else { return }
        
        title = model.name
        scoreLabel.text = String(model.stargazersCount)
        descriptionTextView.text = model.description
    }
    
    
    // MARK: - Initializers
}
