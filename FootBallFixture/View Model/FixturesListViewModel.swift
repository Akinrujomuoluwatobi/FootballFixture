//
//  FixturesListViewModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import Foundation
class FixturesListViewModel {
    var fixturesViewModel: [FixturesViewModel]
    
    init() {
        self.fixturesViewModel = [FixturesViewModel]()
    }
}

extension FixturesListViewModel{
    func fixtureViewModel(at index: Int) -> FixturesViewModel {
        return fixturesViewModel[index]
    }
}

struct FixturesViewModel {
    let fixture: Match
}

extension FixturesViewModel {
    var id : Int? {
        return fixture.id
    }
    
    var homeTeam : Team? {
        return fixture.homeTeam
    }
    
    var awayTeam : Team? {
        return fixture.awayTeam
    }
    
    var score: Score? {
        return fixture.score
    }
    
    var status : String? {
        return fixture.status
    }
    
    var stage: String? {
        return fixture.stage
    }
    
}
