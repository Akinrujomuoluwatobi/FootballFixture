//
//  TeamsListViewModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import Foundation
class TeamsListViewModel {
    var teamsLisViewModel: [TeamViewModel]
    init() {
        self.teamsLisViewModel = [TeamViewModel]()
    }
    
    func standingViewMode(at index: Int) -> TeamViewModel {
        return teamsLisViewModel[index]
    }
}

struct TeamViewModel {
    var team: TeamCompetitions
}

extension TeamViewModel {
    
    var position: Int {
        return team.id
    }
    
    var name: String? {
        return team.name
    }
    
    var crestUrl: String {
        return team.crestURL
    }
   
}
