//
//  TeamModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 26/08/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: - TeamsModel
class TeamsModel: Mappable, Codable {
    
    dynamic var count: Int = 0
    var teams: [TeamCompetitions]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        teams <- map["teams"]
    }
}


// MARK: - Team
@objcMembers class TeamCompetitions: Object, Mappable, Codable {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var shortName: String = ""
    dynamic var tla: String = ""
    dynamic var crestURL: String = ""
    dynamic var address: String = ""
    dynamic var phone: String? = ""
    dynamic var website: String = ""
    dynamic var email: String? = ""
    dynamic var founded: Int = 0
    dynamic var clubColors: String = ""
    dynamic var venue: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        shortName <- map["shortName"]
        tla <- map["tla"]
        crestURL <- map["crestUrl"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        email <- map["email"]
        founded <- map["founded"]
        clubColors <- map["clubColors"]
    }
}

extension TeamsModel {
    static func getStandings(_ id: Int) -> Resource<TeamsModel> {
        guard let url = URL(string: "https://api.football-data.org/v2/competitions/\(id)/teams/") else { fatalError("Url not valid")
            
        }
        print(url)
        return Resource<TeamsModel>(url: url)
        
    }
}
