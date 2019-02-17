//
//  Repository.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

// MARK: - Repository

struct Repository: Decodable {
    
    /// Identifier
    let id: Int
    
    /// Name of the repository
    let name: String
    
    /// Full name of the repository
    let fullName: String
    
    /// Indicates that repository is private
    let isPrivate: Bool
    
    /// Url of the repository
    let url: String
    
    let description: String?
    let score: Double
    
    /// Owner of the repository
    let owner: User
}

extension Repository {
    
    enum DecodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case url = "html_url"
        case description
        case score
        case owner
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        fullName = try container.decode(String.self, forKey: .fullName)
        isPrivate = try container.decode(Bool.self, forKey: .isPrivate)
        url = try container.decode(String.self, forKey: .url)
        description = try? container.decode(String.self, forKey: .description)
        score = (try? container.decode(Double.self, forKey: .score)) ?? 0
        owner = try container.decode(User.self, forKey: .owner)
    }
}
