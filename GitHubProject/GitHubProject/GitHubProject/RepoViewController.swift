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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listReops.delegate = self
        self.listReops.dataSource = self
        update()

        // Do any additional setup after loading the view.
    }

    func update() {
        GitHub.shared.getRepos { (repositories) in
            
            if let repositories = repositories {
                self.allRepos = repositories
            }
            self.listReops.reloadData()
        }
    }

}

extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRepos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoItems", for: indexPath) as! RepoTableViewCell
        cell.repoNameLabel.text = allRepos[indexPath.row].name
        return cell
    }
}
// workflow 1. add a search bar in storyboard. 2. create and outlet 3. assign the delegate to self 4. then conform to the protocol. 5. implement the options you need, searhbar search button clicked or searchbar text did change.  Also get the searchbar cancel button clicked. slef.view resign firstResponder