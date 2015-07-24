//
//  TeamsTableViewCell.swift
//  27 -- SwiftTeams -- John Holsapple
//
//  Created by John Holsapple on 7/21/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell
{

    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
