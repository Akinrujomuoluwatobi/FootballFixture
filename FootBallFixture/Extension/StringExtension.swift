//
//  StringExtension.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 30/08/2021.
//

import Foundation
extension String {
    func convertDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm"
        
        
        if let date = dateFormatterGet.date(from: self) {
            //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
            return dateFormatterPrint.string(from: date)
        }else {
            return self
        }
        
    }
}
