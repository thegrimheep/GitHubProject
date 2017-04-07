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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    
    var repo : Repository!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = repo.name
        self.descriptionLabel.text = repo.description
        self.languageLabel.text = repo.language
        self.starsLabel.text = String(describing: repo.stars)
        self.forkLabel.text = String(repo.isFork)
        
        detailsButton.layer.cornerRadius = 10
    }
    
    @IBAction func moreDetailsPressed(_ sender: Any) {
        guard let repo = repo else {
            return
        }
    
//        presentSafariViewControllerWith(urlString: repo?.repoUrlString)
       presentWebViewControllerWith(urlString: repo.repoUrlString)
    }
    
    func presentSafariViewControllerWith(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let safariController = SFSafariViewController(url: url)
        self.present(safariController, animated: true, completion: nil)
    }
    func presentWebViewControllerWith(urlString: String) {
        let webController = WebViewController()
        webController.url = urlString
        
        self.present(webController, animated: true, completion: nil)
    }

}



