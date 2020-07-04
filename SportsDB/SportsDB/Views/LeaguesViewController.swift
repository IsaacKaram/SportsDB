//
//  LeaguesViewController.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LeaguesViewController: UIViewController {

    //MARKS:- Properties
    private var searchActive = false
    let leagueCellId = "LeagueTableViewCell"
    private var leagues = [League]()
    private var filterdleagues = [League]()
    
    @IBOutlet weak var leaguesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        searchBar.delegate = self
        activityIndicator.type = .ballClipRotatePulse
        registerCustomCells()
        fetchLeagues()
    }

}

//MARKS:- private Functions.
extension LeaguesViewController{
    private func registerCustomCells() {
        leaguesTableView.register(UINib(nibName: leagueCellId, bundle: nil), forCellReuseIdentifier: leagueCellId)
    }
    
    private func fetchLeagues(){
            // get Leagues From Api
        activityIndicator.startAnimating()
    let leaguesAPI = LeaguesAPI()
        leaguesAPI.getLeagues(completion: hanleLeaguesListResponse(result:))
    }
    
    private func hanleLeaguesListResponse(result :Result<LeaguesResponse?, Error>){
        activityIndicator.stopAnimating()
        switch result {
        case .success(let leaguesList):
            if let leagues = leaguesList?.leagues {
                self.leagues = leagues
            }
            DispatchQueue.main.async {
               self.leaguesTableView.reloadData()
            }
            
        case .failure(let error) :
            //TODO:- Show Error Alert.
            print("error Loading league : \(error.localizedDescription)")
        }
    }
    
    private func gotoleagueDetails(at index : Int){
        let league = searchActive ? filterdleagues[index] : leagues[index]
        let detailedLeague = DetailedLeaguesViewController()
        detailedLeague.setLeagueId(with: league.leagueId)
        self.navigationController?.pushViewController(detailedLeague, animated: true)
    }
}

// MARK: - UITableViewDataSource Functions
extension LeaguesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchActive ? filterdleagues.count : leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: leagueCellId) as! LeagueTableViewCell
        let league = searchActive ? filterdleagues[indexPath.row] : leagues[indexPath.row]
        cell.configureCell(leagueName: league.leagueName ?? "", sportType: league.leagueSport ?? "", leagueShortName: league.leagueShortName ?? "")
        return cell
    }
}

//MARK:- UITableviewDelegate Functions
extension LeaguesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoleagueDetails(at: indexPath.row)
    }
}

//MARK:- UiSearchBar Delegates
extension LeaguesViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchText = searchBar.text, !searchText.isEmpty{
            filterdleagues = leagues.filter{ ($0.leagueName?.lowercased().contains(searchText.lowercased())) == true}
            searchActive = true
        }else{
            searchActive = false
        }
        leaguesTableView.reloadData()
    }
}

