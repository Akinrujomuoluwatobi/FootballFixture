//
//  TeamsViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import UIKit

class TeamsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var teamsListVM = TeamsListViewModel()
    var selectedTeamVM: TeamViewModel?
    var competitionID: Int?
    var parentController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        fetchTeams()
        
        // Do any additional setup after loading the view.
    }
    
    
    func fetchTeams() {
        self.startActivityIndicator()
        WebServices().load(resource: TeamsModel.getStandings(competitionID ?? 2021)) {[weak self] result in
            self?.stopActivityIndicator()
            switch result.success {
            case true:
                if let fixturesObj = result.data as? TeamsModel {
                    if let fixtures = fixturesObj.teams {
                        print(fixtures)
                        self?.teamsListVM.teamsLisViewModel = fixtures.map(TeamViewModel.init)
                        self?.collectionView.reloadData()
                    }
                    
                }
                
            default:
                self?.presentOkAlert("Error", result.errorMessage ?? "")
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? PlayersViewController {
            destVC.selectedTeamVM = selectedTeamVM
        }
    }
}

extension TeamsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsListVM.teamsLisViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as? TeamCollectionViewCell else { fatalError("Error dequeing collectionView reusable cell") }
        
        cell.setupView(teamsListVM.standingViewMode(at: indexPath.row))
        
        //cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedTeamVM = teamsListVM.standingViewMode(at: indexPath.row)
        performSegue(withIdentifier: "LaunchTeamPlayersControllerSegue", sender: nil)
    }
    
}

