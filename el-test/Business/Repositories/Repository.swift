//
//  Repository.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

// MARK: - Repository

final class Repository: Decodable {
    
    /// Identifier
    var id: Int = 0
    
    /// Name of the repository
    var name: String = ""
    
    /// Full name of the repository
    var fullName: String = ""
    
    /// Indicates that repository is private
    var isPrivate: Bool = false
    
    /// Url of the repository
    var url: String = ""
    
    var description: String? = nil
    var score: Double = 0.0
    
    /// Owner of the repository
    var owner: User? = nil
    
    var stargazersCount: Int = 0
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
        case stargazersCount = "stargazers_count"
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        fullName = try container.decode(String.self, forKey: .fullName)
        isPrivate = try container.decode(Bool.self, forKey: .isPrivate)
        url = try container.decode(String.self, forKey: .url)
        description = try? container.decode(String.self, forKey: .description)
        score = (try? container.decode(Double.self, forKey: .score)) ?? 0
        owner = try container.decode(User.self, forKey: .owner)
        stargazersCount = (try? container.decode(Int.self, forKey: .stargazersCount)) ?? 0
    }
}
