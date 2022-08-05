//
//  Network.swift
//  Teste
//
//  Created by user208023 on 8/5/22.
//

import Foundation
import UIKit
import Alamofire

class AuthManager {
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
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
    
    func cacheToken(result: AccessToken) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
    }
    
    func getStates(completionHandler: @escaping ([States]?) -> Void) {
        
        guard let url = URL(string: "https://api-design.dev.bravve.app/api/v1/utils/states") else { return }
        
        guard let accessToken = accessToken else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, headers: headers).responseDecodable(of: [States].self) { response in
            if let data = response.value {
                completionHandler(data)
            } else {
                completionHandler(nil)
            }
        }
    }
}
