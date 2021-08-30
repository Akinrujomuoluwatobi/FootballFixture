//
//  FixturesModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: - FixturesModel
@objcMembers class FixturesModel: Mappable, Codable {
    
    dynamic var count: Int = 0
    dynamic var matches: [Match]?
    
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        matches <- map["matches"]
    }
}

// MARK: - Match
@objcMembers class Match: Object, Mappable, Codable {
    
    dynamic var id: Int = 0
    dynamic var utcDate: String = ""
    dynamic var status: String = ""
    dynamic var stage: String = ""
    dynamic var lastUpdated: String = ""
    dynamic var score: Score?
    dynamic var homeTeam: Team?
    dynamic var awayTeam: Team?
    
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        utcDate <- map["utcDate"]
        status <- map["status"]
        stage <- map["stage"]
        lastUpdated <- map["lastUpdated"]
        score <- map["score"]
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
}

// MARK: - Team
@objcMembers class Team: Object, Mappable, Codable {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

// MARK: - Score
@objcMembers class Score: Object, Mappable, Codable {
    
    dynamic var duration: String = ""
    dynamic var fullTime: ScoreCount?
    dynamic var halfTime: ScoreCount?
    dynamic var extraTime: ScoreCount?
    dynamic var penalties: ScoreCount?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        duration <- map["duration"]
        fullTime <- map["fullTime"]
        halfTime <- map["halfTime"]
        extraTime <- map["extraTime"]
        penalties <- map["penalties"]
    }
    
}

// MARK: - ExtraTime
@objcMembers class ScoreCount: Object, Mappable, Codable {
    
    dynamic var homeTeam: Int = 0
    dynamic var awayTeam: Int = 0
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
}

extension FixturesModel {
    static func getFixtures() -> Resource<FixturesModel> {
        guard let url = URL(string: "https://api.football-data.org/v2/matches") else { fatalError("Url not valid")
            
        }
        return Resource<FixturesModel>(url: url)
        
    }
}
