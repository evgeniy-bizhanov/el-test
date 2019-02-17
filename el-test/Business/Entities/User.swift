//
//  User.swift
//  el-test
//
//  Created by Евгений Бижанов on 17/02/2019.
//  Copyright © 2019 Евгений Бижанов. All rights reserved.
//

// MARK: - Owner

struct User: Decodable {
    
    /// Identifier
    let id: Int
    
    /// User login
    let login: String
    
    /// Url of the user's avatar
    let avatarUrl: String
    
    /// Url of the user's profile
    let url: String
}

extension User {
    
    enum DecodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        login = try container.decode(String.self, forKey: .login)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        url = try container.decode(String.self, forKey: .url)
    }
}
