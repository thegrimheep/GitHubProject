//
//  GitHubAuthController.swift
//  GitHubProject
//
//  Created by David Porter on 4/3/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class GitHubAuthController: UIViewController {
    
    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.getAccessToken() == nil {
            loginOutlet.isEnabled = true
            loginOutlet.isHidden = false
        } else {
            loginOutlet.isEnabled = false
            loginOutlet.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginOutlet.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let parameters = ["scope" : "email,user,repo"]
        GitHub.shared.oAuthRequestWith(parameters: parameters)
    }

    func dismissAuthController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
