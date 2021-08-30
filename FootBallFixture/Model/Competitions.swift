//
//  Competitions.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: - Competitions
@objcMembers class Competitions: Mappable, Codable {
    dynamic var count: Int = 0
    dynamic var competitions: [Competition]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        competitions <- map["competitions"]
    }
}

// MARK: - Competition
@objcMembers class Competition: Object, Mappable, Codable {
    dynamic var id: Int = 0
    dynamic var area: Area?
    dynamic var name: String = ""
    dynamic var code: String? = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        area <- map["area"]
        name <- map["name"]
        code <- map["code"]
    }
}

// MARK: - Area
@objcMembers class Area: Object, Mappable, Codable {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var countryCode: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        countryCode <- map["countryCode"]
    }
}

extension Competitions {
    static func getCompetition() -> Resource<Competitions> {
        guard let url = URL(string: "https://api.football-data.org/v2/competitions/") else { fatalError("Url not valid")
            
        }
        return Resource<Competitions>(url: url)
        
    }
}
