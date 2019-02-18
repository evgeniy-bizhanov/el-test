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
    func search(query: String?)
    func didEndSearching()
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
    private var searchRepos: [Repository]?
    
    
    // MARK: - IBActions
    // MARK: - Functions
    
    func didLoad() {
        requestManager?.search(query: "stars:>0", sort: .stars, order: .desc) { [weak self] (response: RepositorySearchReponse) in
            guard let self = self else { return }
            
            self.repos = response.items
            
            DispatchQueue.main.async {
                self.output?.reloadView()
            }
        }
    }
    
    
    // MARK: - RepositoriesInput
    
    func search(query: String?) {
        
        guard let query = query, query != "" else {
            searchRepos = nil
            return
        }
        
        requestManager?.search(query: query, sort: .stars, order: .desc) { [weak self] (response: RepositorySearchReponse) in
            guard let self = self else { return }
            
            self.searchRepos = response.items
            
            DispatchQueue.main.async {
                self.output?.reloadView()
            }
        }
    }
    
    func didEndSearching() {
        searchRepos = nil
        output?.reloadView()
    }
    
    
    // MARK: - Initializers
    
    init(output: RepositoriesOutput?, requestManager: RepositoriesRequestable?) {
        self.output = output
        self.requestManager = requestManager
    }
}

extension RepositoriesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchRepos?.count ?? repos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let repo = searchRepos?[indexPath.row] ?? repos?[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as? RepositoryCell else {
            return UITableViewCell()
        }
        
        cell.model = repo
        
        return cell
    }
}
