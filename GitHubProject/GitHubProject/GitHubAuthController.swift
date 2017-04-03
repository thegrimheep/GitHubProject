//
//  GitHubAuthController.swift
//  GitHubProject
//
//  Created by David Porter on 4/3/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class GitHubAuthController: UIViewController {
    @IBOutlet weak var printTokenOutlet: UIButton!
    @IBOutlet weak var loginOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        printTokenOutlet.layer.cornerRadius = 10
        loginOutlet.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    @IBAction func printTokenPressed(_ sender: Any) {
        
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        let parameters = ["scope" : "email,user"]
        GitHub.shared.oAuthRequestWith(parameters: parameters)
    }


}
