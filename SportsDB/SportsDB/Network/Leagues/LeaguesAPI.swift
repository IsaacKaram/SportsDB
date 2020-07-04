//
//  LeaguesAPI.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/4/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import Foundation

protocol LeaguesAPIProtocol {
    func getLeagues(completion: @escaping (Result<LeaguesResponse?, Error>) -> Void)
    func getLeagueDetailes(by id : String, completion: @escaping (Result<LeagueDetails?, Error>) -> Void)
}


class LeaguesAPI: BaseAPI<LeaguesNetworking>, LeaguesAPIProtocol {
    //MARK:- Requests
    
    func getLeagues(completion: @escaping (Result<LeaguesResponse?, Error>) -> Void) {
        self.fetchData(target: .getLeagues, responseClass: LeaguesResponse.self) { (result) in
            completion(result)
        }
    }
    
    func getLeagueDetailes(by id: String, completion: @escaping (Result<LeagueDetails?, Error>) -> Void) {
         self.fetchData(target: .getDetailedLeague(id: id), responseClass: LeagueDetails.self) { (result) in
             completion(result)
         }
     }
}
