//
//  UIExtensions.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

extension UIResponder {
    static var identifier : String {
        return String(describing: self)
    }
}
