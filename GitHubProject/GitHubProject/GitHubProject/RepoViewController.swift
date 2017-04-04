//
//  RepoViewController.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UISearchBarDelegate { //implement the delegate here see docs for more options

    override func viewDidLoad() {
        super.viewDidLoad()
        update()

        // Do any additional setup after loading the view.
    }

    func update() {
        print("update repo controller here")
        GitHub.shared.getRepos { (repositories) in
            //update tableview
        }
    }

}
// workflow 1. add a search bar in storyboard. 2. create and outlet 3. assign the delegate to self 4. then conform to the protocol. 5. implement the options you need, searhbar search button clicked or searchbar text did change.  Also get the searchbar cancel button clicked. slef.view resign firstResponder
