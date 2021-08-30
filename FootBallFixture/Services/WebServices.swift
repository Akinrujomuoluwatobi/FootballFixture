//
//  WebServices.swift
//  FootBallFixture
//
//  Created by Oluwatobiloba Akinrujomu on 25/08/2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Mappable> {
    let url : URL
    var httpMethod: HTTPMethod = .get
    var body: Data? = nil
    
    init(url: URL) {
        self.url = url
    }
}

//This is more like a generic method to make network calls.
class WebServices {
    //Create a function load of generic type T from the Resource Strucr
    func load<T>(resource: Resource<T>, completion: @escaping (NetworkResponseModel) -> Void) { // The Result<T, NetworkError> is available in Swift 5 the first param is the response when successful and the second param is the response when their is an Error.
        let headers : HTTPHeaders = [
            "X-Auth-Token" : "657c7be2723b4d28b4df392557d5a1b9",
        ]
        Alamofire.request(resource.url, method: resource.httpMethod, parameters: nil, headers: headers).responseObject { (response: DataResponse<T>) in
            switch response.result {
            case .success(let value):
                print(value.toJSONString())
                completion(NetworkResponseModel(statusCode: response.response?.statusCode ?? 200, errorMessage: nil, errorDesc: nil, data: value, success: true))
            case .failure(let error):
                completion(NetworkResponseModel(statusCode: response.response?.statusCode ?? 400, errorMessage: error.localizedDescription, errorDesc: nil, data: nil, success: false))
                
            }
        }
    }
    
}
