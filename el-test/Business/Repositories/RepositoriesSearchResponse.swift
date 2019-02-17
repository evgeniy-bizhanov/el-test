//
//  RepositoriesSearchResponse.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

// MARK: - RepositoriesSearchResponse

struct RepositoriesSearchResponse: Decodable {
    
    /// Total count search results
    let totalCount: Int
    
    /// Indicates that the search reached the end
    let isIncomplete: Bool
    
    /// Repository items
    let items: [Repository]
}

extension RepositoriesSearchResponse {
    
    enum DecodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case isIncomplete = "incomplete_results"
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        isIncomplete = try container.decode(Bool.self, forKey: .isIncomplete)
        items = try container.decode([Repository].self, forKey: .items)
    }
}
