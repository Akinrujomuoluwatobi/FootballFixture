//
//  TodayFixtureTableViewCell.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import UIKit

class TodayFixtureTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeamLabelText: UILabel!
    @IBOutlet weak var awayTeamLabelText: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var timeLabelText: UILabel!
    @IBOutlet weak var durationTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadView(_ vm: FixturesViewModel) {
        homeTeamLabelText.text = vm.homeTeam?.name
        awayTeamLabelText.text = vm.awayTeam?.name
        homeTeamScore.text = "\(vm.score?.fullTime?.homeTeam ?? 0)"
        awayTeamScore.text = "\(vm.score?.fullTime?.awayTeam ?? 0)"
        timeLabelText.text = vm.fixture.utcDate.convertDate()
        
        if vm.status == "FINISHED" {
            durationTextLabel.text = "90\""
        } else {
            durationTextLabel.text = "00\""
        }
        
    }

}
