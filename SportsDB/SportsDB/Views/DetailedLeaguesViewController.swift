//
//  DetailedLeaguesViewController.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher

class DetailedLeaguesViewController: UIViewController {
    
    //MARK:Properties
    private var leagueId : String?
    
    //MARK:-Outlets
    @IBOutlet weak var leagueLogo: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var sportType: UILabel!
    @IBOutlet weak var leagueCountry: UILabel!
    @IBOutlet weak var leagueDescription: UILabel!
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchLeagueDetail()
    }
    
    func setLeagueId(with leagueId : String) {
        self.leagueId = leagueId
    }
    
    private func setupView(){
        activityIndicator.type = .ballClipRotatePulse
    }
    
}

extension DetailedLeaguesViewController{
    private func fetchLeagueDetail(){
        // get Leagues From Api
        guard let leagueId = leagueId else {
            return
        }
        activityIndicator.startAnimating()
        let leaguesAPI = LeaguesAPI()
        leaguesAPI.getLeagueDetailes(by: leagueId, completion: hanleLeagueDetailResponse(result:))
    }
    
    private func hanleLeagueDetailResponse(result :Result<LeagueDetailsResponse?, Error>){
        activityIndicator.stopAnimating()
        switch result {
        case .success(let leaguesDetails):
            if let leaguesDetails = leaguesDetails, let leagues = leaguesDetails.leagues {
                let leagueDetails = leagues[0]
                DispatchQueue.main.async {
                    self.leagueLogo.kf.setImage(with: URL(string: leagueDetails.leagueLogoPath!))
                    self.title = leagueDetails.leagueName
                    self.leagueName.text = leagueDetails.leagueName
                    self.sportType.text = leagueDetails.leagueSport
                    self.leagueCountry.text = leagueDetails.leagueCountry
                    self.leagueDescription.text = leagueDetails.legueDescription
                }
            }
        case .failure(let error) :
            //TODO:- Show Error Alert.
            print("error Loading league : \(error.localizedDescription)")
        }
    }
}
