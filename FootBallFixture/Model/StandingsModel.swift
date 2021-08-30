//
//  StandingsModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//
import Foundation
import RealmSwift
import ObjectMapper

// MARK: - StandingsModel
@objcMembers class StandingsModel: Mappable, Codable {
    var standings: [Standing]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        standings <- map["standings"]
    }
    
}

// MARK: - Standing
class Standing: Object, Mappable, Codable {
    @objc dynamic var stage: String = ""
    @objc dynamic var type: String = ""
    var table: [Table]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        stage <- map["stage"]
        type <- map["type"]
        table <- map["table"]
    }
    
}

// MARK: - Table
@objcMembers class Table: Object, Mappable, Codable {
    
    dynamic var position: Int = 0
    dynamic var team: TeamStanding?
    dynamic var playedGames: Int = 0
    dynamic var won: Int = 0
    dynamic var draw: Int = 0
    dynamic var lost: Int = 0
    dynamic var points: Int = 0
    dynamic var goalsFor: Int = 0
    dynamic var goalsAgainst: Int = 0
    dynamic var goalDifference: Int = 0
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        position <- map["position"]
        team <- map["team"]
        playedGames <- map["playedGames"]
        won <- map["won"]
        draw <- map["draw"]
        lost <- map["lost"]
        points <- map["points"]
        goalsFor <- map["goalsFor"]
        goalsAgainst <- map["goalsAgainst"]
        goalDifference <- map["goalDifference"]
    }
}

// MARK: - Team
@objcMembers class TeamStanding: Object, Mappable, Codable {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var crestUrl: String? = ""

    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        crestUrl <- map["crestUrl"]
    }
}

extension StandingsModel {
    static func getStandings(_ id: Int) -> Resource<StandingsModel> {
        guard let url = URL(string: "https://api.football-data.org/v2/competitions/\(id)/standings") else { fatalError("Url not valid")
            
        }
        print(url)
        return Resource<StandingsModel>(url: url)
        
    }
}
