//
//  Network.swift
//  Teste
//
//  Created by user208023 on 8/5/22.
//

import Foundation
import UIKit
import Alamofire

/// Class to manage API Requests
class AuthManager {
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    private let baseAPIString = "https://api-design.dev.bravve.app/api/v1"
    
    
    
    /// Method to get token from the Bravve API
    public func getToken() {
        guard let url = URL(string: "https://api-design.dev.bravve.app/api/auth/token") else { return }
        let parameters = [
            "username": "pedro",
            "password": 123,
        ] as? [String: Any]
        
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: AccessToken.self) { response in
            if let data = response.value {
                if self.accessToken ==  nil {
                    self.cacheToken(result: data)
                }
            }
        }
    }
    
    
    
    /// Method to cache the token got from the Bravve API in the UserDefaults
    /// - Parameter result: A struct in the format of AccessToken model containing the information on the token
    func cacheToken(result: AccessToken) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
    }
    
    /// Method to get data in the format of an array from the API
    /// - Parameter completionHandler: Closure to manage the result of the API call as an array of the chosen model
    func getDataArray<T: Codable>(completionHandler: @escaping ([T]?) -> Void) {
        
        guard let url = URL(string: baseAPIString + "/utils/states") else { return }
        
        guard let accessToken = accessToken else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, headers: headers).responseDecodable(of: [T].self) { response in
            if let data = response.value {
                completionHandler(data)
            } else {
                completionHandler(nil)
            }
        }
    }
}
