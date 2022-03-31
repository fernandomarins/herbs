//
//  ClientAPI.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Foundation

class ClientAPI {
    
    enum Endpoints {
        static let baseURL = ""
        static let herbs = ""
        
        case get
        
        var stringValue: String {
            switch self {
            case .get:
                return Endpoints.baseURL + Endpoints.herbs
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func taskForGetRequest<ResponseType: Decodable>(from url: URL,
                                                          responseType: ResponseType.Type,
                                                          completion: @escaping (ResponseType?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObj = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObj, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }

        }.resume()
    }
}
