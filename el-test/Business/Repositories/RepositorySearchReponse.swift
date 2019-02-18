//
//  RepositorySearchReponse.swift
//  el-test
//
//  Created by Евгений Бижанов on 18/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

final class RepositorySearchReponse: Decodable {
    
    /// Total count search results
    var totalCount: Int = 0
    
    /// Indicates that the search reached the end
    var isIncomplete: Bool = false
    
    /// Repository items
    var items: [Repository] = []
}

extension RepositorySearchReponse {
    
    enum DecodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case isIncomplete = "incomplete_results"
        case items
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        isIncomplete = try container.decode(Bool.self, forKey: .isIncomplete)
        items = try container.decode([Repository].self, forKey: .items)
    }
}
