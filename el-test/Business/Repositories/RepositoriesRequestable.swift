//
//  RepositoriesRequestable.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Alamofire

// MARK: - Protocol

protocol RepositoriesRequestable {
    
    typealias Completion<T: Decodable> = (T) -> Void
    
    /// Gets list of repositories
    func get<T>(completion: Completion<T>?)
}


// MARK: - Implementation

extension RequestManager: RepositoriesRequestable {
    
    func get<T>(completion: Completion<T>?) {
        
        let urlRequest = GetRequestRouter(url: url)
        self.request(request: urlRequest, completion: completion)
    }
}


// MARK: - RequestRouter

fileprivate struct GetRequestRouter: RequestRouter {
    
    let url: URL
    let httpMethod: HTTPMethod = .get
    let apiMethod: String = "/repositories"
    
    let parameters: Parameters? = nil
}
