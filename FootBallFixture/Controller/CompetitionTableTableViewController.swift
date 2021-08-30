//
//  CompetitionTableTableViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import UIKit

class CompetitionTableTableViewController: UITableViewController {

    var standingsListViewModel = StandingsListViewModel()
    var competitionID: Int?
    var parentController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCompetitionTable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return standingsListViewModel.standingsLisViewModel.count
    }
    
    func fetchCompetitionTable() {
        self.startActivityIndicator()
        WebServices().load(resource: StandingsModel.getStandings(competitionID ?? 2021)) {[weak self] result in
            self?.stopActivityIndicator()
            switch result.success {
            case true:
                if let fixturesObj = result.data as? StandingsModel {
                    if let fixtures = fixturesObj.standings?[0].table {
                        print(fixtures)
                        self?.standingsListViewModel.standingsLisViewModel = fixtures.map(StandingViewModel.init)
                        self?.tableView.reloadData()
                    }
                    
                }
                
            default:
                self?.presentOkAlert("Error", result.errorMessage ?? "")
            }
            
        }
        
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsTableViewCell", for: indexPath) as? StandingsTableViewCell else { return UITableViewCell() }
        
        cell.loadView(standingsListViewModel.standingViewMode(at: indexPath.row))
     
        return cell
    }

}
