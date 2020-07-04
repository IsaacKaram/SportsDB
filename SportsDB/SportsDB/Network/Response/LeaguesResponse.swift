//
//  LeaguesResponse.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/4/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import Foundation

struct LeaguesResponse : Decodable {
    var leagues : [League]?
    
    enum CodingKeys: String, CodingKey {
        case leagues = "leagues"
    }
}
