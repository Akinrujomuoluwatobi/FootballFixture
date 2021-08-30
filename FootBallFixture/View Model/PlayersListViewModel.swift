//
//  PlayersListViewModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 28/08/2021.
//

import Foundation

class PlayersListViewModel {
    var playersLisViewModel: [PlayerViewModel]
    init() {
        self.playersLisViewModel = [PlayerViewModel]()
    }
    
    func playerViewModel(at index: Int) -> PlayerViewModel {
        return playersLisViewModel[index]
    }
}

struct PlayerViewModel {
    var player: Squad
}

extension PlayerViewModel {
    
    var playerName: String? {
        return player.name
    }
    
    var playPosition: String {
        return player.position
    }
   
}
