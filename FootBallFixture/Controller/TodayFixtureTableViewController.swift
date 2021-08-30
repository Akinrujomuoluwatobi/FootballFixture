//
//  TodayFixtureTableViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import UIKit

class TodayFixtureTableViewController: UITableViewController {
    
    var fixturesListVM = FixturesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodayFixtures()
    }
    
    func fetchTodayFixtures() {
        self.startActivityIndicator()
        WebServices().load(resource: FixturesModel.getFixtures()) {[weak self] result in
            self?.stopActivityIndicator()
            switch result.success {
            case true:
                if let fixturesObj = result.data as? FixturesModel {
                    if let fixtures = fixturesObj.matches {
                        self?.fixturesListVM.fixturesViewModel = fixtures.map(FixturesViewModel.init)
                        print(self?.fixturesListVM.fixturesViewModel)
                        self?.tableView.reloadData()
                    }
                    
                }
                
            default:
                self?.presentOkAlert("Error", result.errorMessage ?? "")
            }
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fixturesListVM.fixturesViewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayFixtureTableViewCell") as? TodayFixtureTableViewCell else { return UITableViewCell() }
        
        cell.loadView(fixturesListVM.fixtureViewModel(at: indexPath.row))
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
