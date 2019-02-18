//
//  RepositoryCell.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    // MARK: - Models
    
    var model: Repository? {
        didSet {
            assignModel(model)
        }
    }
    
    
    // MARK: - Services
    // MARK: - Properties
    // MARK: - Fields
    // MARK: - IBActions
    // MARK: - Functions
    
    func assignModel(_ model: Repository?) {
        
        guard let model = model else { return }
        
        title.text = model.name
        score.text = String(model.stargazersCount)
    }
    
    
    // MARK: - Initializers
}
