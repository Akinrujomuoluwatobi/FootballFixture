//
//  CompetitionsViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import UIKit

class CompetitionsViewController: UIViewController {
    
    var competitionsListVM = CompetitionsListViewModel()
    var selectedVm: CompetitionViewModel?
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fetchCompetitions()
        // Do any additional setup after loading the view.
    }
    
    func fetchCompetitions() {
        self.startActivityIndicator()
        WebServices().load(resource: Competitions.getCompetition()) {[weak self] result in
            self?.stopActivityIndicator()
            switch result.success {
            case true:
                if let fixturesObj = result.data as? Competitions {
                    if let fixtures = fixturesObj.competitions {
                        self?.competitionsListVM.competionsLisViewModel = fixtures.map(CompetitionViewModel.init)
                        //print(self?.fixturesListVM.fixturesViewModel)
                        self?.tableView.reloadData()
                    }
                    
                }
                
            default:
                self?.presentOkAlert("Error", result.errorMessage ?? "")
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? CompetitionLandingViewController {
            destVC.selectedVM = selectedVm
        }
    }

}
extension CompetitionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return competitionsListVM.competionsLisViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompetitionsTableViewCell", for: indexPath) as? CompetitionsTableViewCell else { return UITableViewCell() }
        
        cell.loadView(competitionsListVM.competitionViewMode(at: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedVm = competitionsListVM.competitionViewMode(at: indexPath.row)
        performSegue(withIdentifier: "LaunchCompetitionLandingControllerSegur", sender: nil)
    }
    
}
