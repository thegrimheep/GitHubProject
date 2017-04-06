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
    let description: String
    let language: String
    let stars: NSNumber
//    let isFork: Bool
//    let createdAt: Date
    
    
    init?(json: [String: Any]) {
        print("complete this for lab, good luck")
        if let name = json["name"] as? String, let description = json["description"] as? String, let language = json["language"] as? String, let stars = json["stargazer_count"] as? NSNumber, let repoUrlString = json["html_url"] as? String {
        
        self.repoUrlString = repoUrlString
        self.name = name
        self.description = description
        self.language = language
        self.stars = stars
        print(json)
        }
        
        else {
         return nil   
        }
    }
    
}

