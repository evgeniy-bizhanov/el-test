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
    
    /// Search repos by query string
    ///
    /// - Parameter query: Query string to search for
    /// - Parameter sort: Response sorting criteria
    /// - Parameter order: Response ordering criteria
    func search<T>(query: String, sort: QuerySort, order: QueryOrder, completion: Completion<T>?)
}


// MARK: - Implementation

extension RequestManager: RepositoriesRequestable {
    
    func search<T>(query: String, sort: QuerySort, order: QueryOrder, completion: Completion<T>?) {
        let urlRequest = SearchRequestRouter(url: url, query: query, sort: sort, order: order)
        self.request(request: urlRequest, completion: completion)
    }
}


// MARK: - RequestRouter

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
