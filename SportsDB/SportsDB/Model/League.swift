//
//  League.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import Foundation

struct League : Decodable {
    var leagueId : String
    var leagueName : String?
    var leagueSport : String?
    var leagueShortName : String?
    
    enum CodingKeys : String, CodingKey {
        case leagueId = "idLeague"
        case leagueName = "strLeague"
        case leagueSport = "strSport"
        case leagueShortName = "strLeagueAlternate"
    }
}
