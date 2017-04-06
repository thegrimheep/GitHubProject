//
//  RepoTableViewCell.swift
//  GitHubProject
//
//  Created by David Porter on 4/4/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoLanguageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
