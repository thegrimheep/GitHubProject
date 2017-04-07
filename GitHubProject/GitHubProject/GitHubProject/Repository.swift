//
//  Repository.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class Repository {
    let repoUrlString: String
    let name: String
    let description: String?
    let language: String?
    var stars: Int? = 0
    let isFork: Bool
    let createdAt: String
    
    
    init?(json: [String: Any]) {
//        if let name =
//            let description =
//            let language =
//            let stars =
//            let repoUrlString =
//            let isFork =
//            let createdAt =
        self.repoUrlString = json["html_url"] as? String ?? "https://www.github.com"
        self.name = json["name"] as! String
        self.description = json["description"] as? String
        self.language = json["language"] as? String
        
        self.isFork = json["fork"] as! Bool
        self.createdAt = json["created_at"] as! String
        
        if let stars = json["stargazer_count"] as? Int {
            self.stars = stars
        }
        }
    }


