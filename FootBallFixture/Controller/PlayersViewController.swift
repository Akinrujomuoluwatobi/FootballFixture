//
//  PlayersViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 28/08/2021.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var playersListVM = PlayersListViewModel()
    var selectedTeamVM: TeamViewModel?
    @IBOutlet weak var teamNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameLabel.text = selectedTeamVM?.name
        tableView.delegate = self
        tableView.dataSource = self
        fetchTeam()

    }
    
    func fetchTeam() {
        self.startActivityIndicator()
        WebServices().load(resource: TeamPlayersModel.getPlayers(selectedTeamVM?.position ?? 1)) {[weak self] result in
            self?.stopActivityIndicator()
            switch result.success {
            case true:
                if let fixturesObj = result.data as? TeamPlayersModel {
                    if let fixtures = fixturesObj.squad {
                        self?.playersListVM.playersLisViewModel = fixtures.map(PlayerViewModel.init)
                        //print(self?.fixturesListVM.fixturesViewModel)
                        self?.tableView.reloadData()
                    }
                    
                }
                
            default:
                self?.presentOkAlert("Error", result.errorMessage ?? "")
            }
            
        }
        
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playersListVM.playersLisViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as? CompetitionsTableViewCell else { return UITableViewCell() }
        
        cell.loadTeamView(playersListVM.playerViewModel(at: indexPath.row), vmPos: indexPath.row + 1)
        
        return cell
    }
    
}
