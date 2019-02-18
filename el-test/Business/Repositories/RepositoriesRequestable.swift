//
//  RepositoriesRequestable.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

import Alamofire

// MARK: - Protocol

enum QuerySort: String {
    case stars
}

enum QueryOrder: String {
    case asc
    case desc
}

protocol RepositoriesRequestable {
    
    typealias Completion<T: Decodable> = (T) -> Void
    
    /// Gets list of repositories
    func repositories<T>(completion: Completion<T>?)
    
    /// Gets detail info about repository
    func get<T>(path: String, completion: Completion<T>?)
    
    func search<T>(query: String, sort: QuerySort, order: QueryOrder, completion: Completion<T>?)
}


// MARK: - Implementation

extension RequestManager: RepositoriesRequestable {
    
    func repositories<T>(completion: Completion<T>?) {
        let urlRequest = RepositoriesRequestRouter(url: url)
        self.request(request: urlRequest, completion: completion)
    }
    
    func get<T>(path: String, completion: Completion<T>?) {
        let urlRequest = GetRequestRouter(url: url, path: path)
        self.request(request: urlRequest, completion: completion)
    }
    
    func search<T>(query: String, sort: QuerySort, order: QueryOrder, completion: Completion<T>?) {
        let urlRequest = SearchRequestRouter(url: url, query: query, sort: sort, order: order)
        self.request(request: urlRequest, completion: completion)
    }
}


// MARK: - RequestRouter

fileprivate struct RepositoriesRequestRouter: RequestRouter {
    
    let url: URL
    let httpMethod: HTTPMethod = .get
    let apiMethod: String = "/repositories"
    
    let parameters: Parameters? = nil
}

fileprivate struct GetRequestRouter: RequestRouter {
    
    let url: URL
    let httpMethod: HTTPMethod = .get
    var apiMethod: String { return "/repos/" + path }
    
    let path: String
    
    let parameters: Parameters? = nil
}

fileprivate struct SearchRequestRouter: RequestRouter {
    
    let url: URL
    let httpMethod: HTTPMethod = .get
    let apiMethod: String = "/search/repositories"
    
    let query: String
    let sort: QuerySort
    let order: QueryOrder
    
    var parameters: Parameters? {
        return [
            "q": query,
            "sort": sort.rawValue,
            "order": order.rawValue
        ]
    }
}
