//
//  RepositoriesPresenter.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

protocol RepositoriesInput {
    func didLoad()
}

final class RepositoriesPresenter: RepositoriesInput {
    
    // MARK: - IBOutlets
    // MARK: - Models
    // MARK: - Services
    
    var requestManager: RepositoriesRequestable?
    
    
    // MARK: - Properties
    // MARK: - Fields
    
    private weak var output: RepositoriesOutput?
    
    
    // MARK: - IBActions
    // MARK: - Functions
    
    func didLoad() {
        requestManager?.get { (repositories: [Repository]) in
            print(repositories)
        }
    }
    
    
    // MARK: - Initializers
    
    init(output: RepositoriesOutput?, requestManager: RepositoriesRequestable?) {
        self.output = output
        self.requestManager = requestManager
    }
}
