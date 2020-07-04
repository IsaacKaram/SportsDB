//
//  LeagueDetailsResponse.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/4/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import Foundation

struct LeagueDetailsResponse : Decodable {
    var leagues : [LeagueDetails]?
    
    enum CodingKeys: String, CodingKey {
        case leagues = "leagues"
    }
}
