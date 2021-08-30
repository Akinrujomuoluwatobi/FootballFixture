//
//  TeamCollectionViewCell.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import UIKit
import SwiftSVG

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var clubImageView: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    func setupView(_ vm: TeamViewModel) {
        clubNameLabel.text = vm.name
        DispatchQueue.global(qos: .userInitiated).async {
            let imageUrl:URL = URL(string: vm.crestUrl )!
            DispatchQueue.main.async {
                let hammock = UIView(SVGURL: imageUrl) { (svgLayer) in
                    //svgLayer.fillColor = UIColor(red:0.52, green:0.16, blue:0.32, alpha:1.00).cgColor
                    svgLayer.resizeToFit(self.clubImageView.bounds)
                    
                }
                
                self.clubImageView.addSubview(hammock)
            }
            
            
        }
        
        
    }
    
}
