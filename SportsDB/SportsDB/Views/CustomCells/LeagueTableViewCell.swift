//
//  LeagueTableViewCell.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    //MARK:- outlets
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var sportTypeLabel: UILabel!
    @IBOutlet weak var leagueShortNameLabel: UILabel!
    @IBOutlet weak var customBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customBackgroundView.layer.cornerRadius = 10.0
    }
    
    func configureCell(leagueName : String, sportType : String, leagueShortName: String){
        leagueNameLabel.text = leagueName
        sportTypeLabel.text = sportType
        leagueNameLabel.text = leagueShortName
    }
    
}
