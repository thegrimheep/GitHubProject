//
//  RepoViewController.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UISearchBarDelegate { //implement the delegate here see docs for more options
    @IBOutlet weak var searchBarButton: UISearchBar!
    @IBOutlet weak var listReops: UITableView!
    
    var allRepos = [Repository]()
//    var searchedRepos = [Repository]?()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarButton.delegate = self
        self.listReops.delegate = self
        self.listReops.dataSource = self
        update()

        // Do any additional setup after loading the view.
    }

    func update() {
        GitHub.shared.getRepos { (repositories) in
            
            if let repositories = repositories {
                self.allRepos = repositories
//                self.searchedRepos = repositories
            }
            self.listReops.reloadData()
        }
    }

}

//MARK: UITableViewDelegate
extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRepos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoItems", for: indexPath) as! RepoTableViewCell
        cell.repoNameLabel.text = allRepos[indexPath.row].name
        //cell.repoDescriptionLabel.text = allRepos[indexPath.row].description
        //cell.languageDescriptionLabel.text = allRepos[indexPath.row].language
        return cell
    }
}

