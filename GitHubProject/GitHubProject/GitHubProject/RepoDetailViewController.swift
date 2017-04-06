//
//  RepoDetailViewController.swift
//  GitHubProject
//
//  Created by David Porter on 4/5/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit
import SafariServices

class RepoDetailViewController: UIViewController {
    @IBAction func moreDetailsPressed(_ sender: Any) {
        guard let repo = repo else {
            return
        }
        presentSafariViewControllerWith(urlString: repo?.repoUrlString)
    }
    
    func presentSafariViewControllerWith(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let safariController = SFSafariViewController(url: url)
        self.present(safariController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }



}
