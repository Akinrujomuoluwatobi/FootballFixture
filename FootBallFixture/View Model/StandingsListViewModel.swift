//
//  StandingsListViewModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import Foundation
class StandingsListViewModel {
    var standingsLisViewModel: [StandingViewModel]
    init() {
        self.standingsLisViewModel = [StandingViewModel]()
    }
    
    func standingViewMode(at index: Int) -> StandingViewModel {
        return standingsLisViewModel[index]
    }
}

struct StandingViewModel {
    var standing: Table
}

extension StandingViewModel {
    
    var position: Int {
        return standing.position
    }
    
    var team: TeamStanding? {
        return standing.team
    }
    
    var points: Int {
        return standing.points
    }
    
    var goalFor: Int {
        return standing.goalsFor
    }
    
    var goalAgainst: Int {
        return standing.goalsAgainst
    }
    
    var goalDiff: Int {
        return standing.goalDifference
    }
}
