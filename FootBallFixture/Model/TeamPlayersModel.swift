//
//  TeamPlayersModel.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 28/08/2021.
//
import Foundation
import RealmSwift
import ObjectMapper

// MARK: - TeamsModel
class TeamPlayersModel: Mappable, Codable {
    
    var id: Int = 0
    var name: String = ""
    var squad: [Squad]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        squad <- map["squad"]
    }
}
// MARK: - Squad
@objcMembers class Squad: Object, Mappable, Codable {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var position: String = ""

    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
    }
}
extension TeamPlayersModel {
    static func getPlayers(_ id: Int) -> Resource<TeamPlayersModel> {
        guard let url = URL(string: "https://api.football-data.org/v2/teams/\(id)") else { fatalError("Url not valid")
            
        }
        print(url)
        return Resource<TeamPlayersModel>(url: url)
        
    }
}
