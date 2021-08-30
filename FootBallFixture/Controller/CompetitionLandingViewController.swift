//
//  CompetitionLandingViewController.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import UIKit

class CompetitionLandingViewController: UIViewController {
    
    @IBOutlet weak var tableLabel: UILabel!
    @IBOutlet weak var fixturesLabel: UILabel!
    @IBOutlet weak var teamsLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    var selectedVM: CompetitionViewModel?
    var activeController : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableLabelGest = UITapGestureRecognizer(target: self, action: #selector(viewSelected(_:)))
        tableLabel.addGestureRecognizer(tableLabelGest)
        tableLabel.isUserInteractionEnabled = true
        
        let fixturesLabelGest = UITapGestureRecognizer(target: self, action: #selector(viewSelected(_:)))
        fixturesLabel.addGestureRecognizer(fixturesLabelGest)
        fixturesLabel.isUserInteractionEnabled = true
        
        let teamLabelGest = UITapGestureRecognizer(target: self, action: #selector(viewSelected(_:)))
        teamsLabel.addGestureRecognizer(teamLabelGest)
        teamsLabel.isUserInteractionEnabled = true
        
        showStandingsTableController()
        
        title = selectedVM?.name
        
        // Do any additional setup after loading the view.
    }
    
    @objc func viewSelected(_ action: UIGestureRecognizer) {
        switch action.view {
        case tableLabel:
            showStandingsTableController()
        case fixturesLabel:
            showFixtureController()
        case teamsLabel:
            showTeamsController()
        default:
            print("Invalid Selection")
        }
    }
    
    func showStandingsTableController() {
        tableLabel.textColor = UIColor.black
        fixturesLabel.textColor = UIColor.lightGray
        teamsLabel.textColor = UIColor.lightGray
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CompetitionTableTableViewController") as? CompetitionTableTableViewController
        if let vc = vc {
            vc.parentController = self
            vc.competitionID = selectedVM?.id
            changeViewController(controller: vc)
        }
    }
    
    func showFixtureController() {
        
        tableLabel.textColor = UIColor.lightGray
        fixturesLabel.textColor = UIColor.black
        teamsLabel.textColor = UIColor.lightGray
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FixturesViewController") as? FixturesViewController
        if let vc = vc {
            vc.parentController = self
            changeViewController(controller: vc)
        }
    }
    
    func showTeamsController() {
        
        tableLabel.textColor = UIColor.lightGray
        fixturesLabel.textColor = UIColor.lightGray
        teamsLabel.textColor = UIColor.black
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TeamsViewController") as? TeamsViewController
        if let vc = vc {
            vc.parentController = self
            changeViewController(controller: vc)
        }
    }
    func changeViewController(controller: UIViewController) {
        if activeController?.restorationIdentifier == controller.restorationIdentifier{
            // Do nothing
        }else{
            attachViewController(controller: controller, theContainerView: containerView)
            activeController?.willMove(toParent: nil)
            activeController?.view.removeFromSuperview()
            activeController?.removeFromParent()
            activeController = controller
        }
    }
    
    func attachViewController(controller : UIViewController, theContainerView : UIView ) {
        addChild(controller)
        theContainerView.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        let newObj: [Any] = [
            controller.view as Any
        ]
        let newString:String = "v"
        let newKey: [NSString] = [
            newString as NSString
        ]
        let views = NSDictionary.init(objects: newObj, forKeys: newKey)
        
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[v]|",
            metrics: nil,
            views: views as! [String : Any])
        theContainerView.addConstraints(iconVerticalConstraints)
        theContainerView.addConstraints(NSLayoutConstraint.constraints(
                                            withVisualFormat: "V:|[v]|",
                                            metrics: nil,
                                            views: views as! [String : Any]))
    }
    
}
