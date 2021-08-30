//
//  CompetitionsListViewModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import Foundation
class CompetitionsListViewModel {
    var competionsLisViewModel: [CompetitionViewModel]
    init() {
        self.competionsLisViewModel = [CompetitionViewModel]()
    }
    
    func competitionViewMode(at index: Int) -> CompetitionViewModel {
        return competionsLisViewModel[index]
    }
}

struct CompetitionViewModel {
    var competition: Competition
}

extension CompetitionViewModel {
    var id: Int {
        return competition.id
    }
    
    var area: Area? {
        return competition.area
    }
    
    var name: String {
        return competition.name
    }
    
    var code: String? {
        return competition.code
    }
}
