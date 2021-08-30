//
//  CompetitionsTableViewCell.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import UIKit

class CompetitionsTableViewCell: UITableViewCell {

    @IBOutlet weak var competitionNameLabelText: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var numberingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadView(_ vm: CompetitionViewModel) {
        competitionNameLabelText.text = vm.name
    }
    
    func loadTeamView(_ vm: PlayerViewModel, vmPos: Int) {
        competitionNameLabelText.text = vm.playerName
        playerPosition.text = vm.playPosition
        numberingLabel.text = "\(vmPos)"
    }

}
