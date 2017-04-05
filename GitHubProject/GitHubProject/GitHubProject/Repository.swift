//
//  Repository.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class Repository {
    let name: String
    let description: String
    let language: String
    
    init?(json: [String: Any]) {
        print("complete this for lab, good luck")
        if let name = json["name"] as? String, let description = json["description"] as? String, let language = json["language"] as? String {
        
        self.name = name
        self.description = description
        self.language = language
        print(json)
        
        } else {
         return nil   
        }
    }
}

