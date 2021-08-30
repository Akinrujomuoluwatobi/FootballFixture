//
//  StandingsTableViewCell.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import UIKit
import SwiftSVG

class StandingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clubImgView: UIImageView!
    @IBOutlet weak var clubPosition: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var goalDiffLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func loadView(_ vm: StandingViewModel) {
        clubPosition.text = "\(vm.position)"
        clubName.text = vm.team?.name
        goalsLabel.text = "\(vm.goalFor)"
        pointLabel.text = "\(vm.points)"
        goalDiffLabel.text = "\(vm.goalDiff)"
        

        if let imageDetails = vm.team?.crestUrl {
            DispatchQueue.global(qos: .userInitiated).async {
                let imageUrl:URL = URL(string: imageDetails )!
                DispatchQueue.main.async {
                    let hammock = UIView(SVGURL: imageUrl) { (svgLayer) in
                        //svgLayer.fillColor = UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
                        svgLayer.resizeToFit(self.clubImgView.bounds)
                    }
                    
                    self.clubImgView.addSubview(hammock)
                }
                
                
            }
            
            
            
        }
        
    }
    
}
