//
//  DetailedLeaguesViewController.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import UIKit

class DetailedLeaguesViewController: UIViewController {

    private var leagueId : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setLeagueId(with leagueId : String) {
        self.leagueId = leagueId
    }

}
