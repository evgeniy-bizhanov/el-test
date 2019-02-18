//
//  RepositoriesPresenter.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Foundation
import UIKit

protocol RepositoriesInput {
    func didLoad()
}

final class RepositoriesPresenter: NSObject, RepositoriesInput {
    
    // MARK: - IBOutlets
    // MARK: - Models
    // MARK: - Services
    
    var requestManager: RepositoriesRequestable?
    
    
    // MARK: - Properties
    // MARK: - Fields
    
    private weak var output: RepositoriesOutput?
    private let group = DispatchGroup()
    private var repos: [Repository]?
    
    
    // MARK: - IBActions
    // MARK: - Functions
    
    func didLoad() {
        requestManager?.repositories { [weak self] (repositories: [Repository]) in
            guard let self = self else { return }
            self.extractStars(forRepositories: repositories)
        }
    }
    
    fileprivate func extractStars(forRepositories repos: ([Repository])) {
        
        repos.forEach { repo in
            self.group.enter()
            self.requestManager?.get(path: repo.fullName) { (detailRepo: Repository) in
                repo.stargazersCount = detailRepo.stargazersCount
                self.group.leave()
            }
        }
        
        extractedStars(repos)
    }
    
    fileprivate func extractedStars(_ repos: ([Repository])) {
        group.notify(queue: DispatchQueue.main) { [weak self] in
            
            guard let self = self else { return }
            
            self.repos = repos.sorted { (first, second) in
                first.stargazersCount > second.stargazersCount
            }
            
            self.repos?.forEach( { print($0.stargazersCount) } )
        }
    }
    
    
    // MARK: - Initializers
    
    init(output: RepositoriesOutput?, requestManager: RepositoriesRequestable?) {
        self.output = output
        self.requestManager = requestManager
    }
}
