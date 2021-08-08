//
//  RepositoryCell.swift
//  app2021
//
//  Created by futoshi on 2021/05/12.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!

    var repository: Repository!  {
        didSet {
            nameLabel.text = repository.name
            ownerNameLabel.text = repository.owner.name
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
