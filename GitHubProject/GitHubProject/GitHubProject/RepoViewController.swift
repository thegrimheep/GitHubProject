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
        let repoXib = UINib(nibName: RepoTableViewCell.identifier, bundle: Bundle.main)
        self.listReops.register(repoXib, forCellReuseIdentifier: RepoTableViewCell.identifier)
        self.searchBarButton.delegate = self
        self.listReops.delegate = self
        self.listReops.dataSource = self
        self.listReops.estimatedRowHeight = 100
        self.listReops.rowHeight = UITableViewAutomaticDimension
        update()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetailViewController.identifier {
            segue.destination.transitioningDelegate = self
            //add if let here 
        }
    }

}

extension RepoViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CustomTransition(duration: 1.0)
    }
}

//MARK: UITableViewDelegate
extension RepoViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRepos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        cell.repoNameLabel.text = allRepos[indexPath.row].name
        cell.repoDescriptionLabel.text = allRepos[indexPath.row].description
        cell.repoLanguageLabel.text = allRepos[indexPath.row].language
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }
}

//if !searchText.validate() {
//    let lastIndex = searchText.index(before: searchText.endIndex)
//    searchBar.text = searchText.substring(to: lastIndex)
//}
//
//if let searchedText = searchBar.text {
//    self.displayRepos = self.allRepos.filter({$0.name.contains(searchedText)})
//}
