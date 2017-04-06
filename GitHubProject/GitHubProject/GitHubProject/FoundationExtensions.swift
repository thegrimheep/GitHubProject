//
//  FoundationExtensions.swift
//  GitHubProject
//
//  Created by David Porter on 4/3/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import Foundation

extension UserDefaults {
    func getAccessToken() -> String? {
        guard let token = UserDefaults.standard.string(forKey: "access_token") else {
            return nil
        }
        return token
    }
    func save(accessToken: String) -> Bool {
        UserDefaults.standard.set(accessToken, forKey: "access_token")
        return UserDefaults.standard.synchronize()
    }
}

extension Date {
    var shortStyle : String {
        return formatterWith(style: .short).string(from: self)
    }
    
    var mediumStyle : String {
        return formatterWith(style: .medium).string(from: self)
    }
    
    var longStyle : String {
        return formatterWith(style: .long).string(from: self)
    }
    
    private func formatterWith(style: DateFormatter.Style) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter
    }
}
