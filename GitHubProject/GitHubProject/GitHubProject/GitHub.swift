//
//  GitHub.swift
//  GitHubProject
//
//  Created by David Porter on 4/3/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

let kOAuthBaseURL = "https://github.com/login/oauth/"

enum GitHubAuthError : Error {
    case extractingCode
}

class GitHub {
    let gitHubClientID = "7e653b85c2660205f804"
    let gitHubClientSecret = "e6830f6a4bdfac0e2c610da57ae1b9515db46430"
    static let shared = GitHub()
    
    func oAuthRequestWith(parameters: [String: String]) {
        var parametersString = ""
        
        for (key, value) in parameters {
            parametersString += "&\(key)=\(value)"
        }
        if let requestURL = URL(string: "\(kOAuthBaseURL)authorize?client_id=\(gitHubClientID)\(parametersString)") {
            print(requestURL.absoluteString)
            UIApplication.shared.open(requestURL)
        }
    }
    func getCodeFrom(url: URL) throws -> String {
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHubAuthError.extractingCode
        }
        return code
    }
}
