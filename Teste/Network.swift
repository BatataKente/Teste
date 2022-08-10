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
    
    /// Method to get the token to access the BravveAPI
    /// - Parameter completioHandler: Completion handler that holds the API token as parameter to manage the result of the API Call
    public func getToken(completioHandler: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://api-design.dev.bravve.app/api/auth/token") else { return }
        let parameters = [
            "username": "pedro",
            "password": 123,
        ] as? [String: Any]
        
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: AccessToken.self) { response in
            if let data = response.value {

                    self.cacheToken(result: data)
                    completioHandler(data.access_token)
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
    func getDataArray<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", endpoint: EndPoints = .utilsStates, completionHandler: @escaping ([T]?) -> Void) {
        
        getToken { accessToken in
            guard let accessToken = accessToken else { return }
            
            var urlEndpoint = ""
            
            switch endpoint {
            case .utilsStates: urlEndpoint = EndPoints.utilsStates.rawValue
            case .utilsCities: urlEndpoint = EndPoints.utilsStates.rawValue + "/\(id)/cities"
            case .utilsMarketSegments: urlEndpoint = EndPoints.utilsMarketSegments.rawValue
            case .utilsCompanySizes: urlEndpoint = EndPoints.utilsCompanySizes.rawValue
            case .utilsCompanyClassifications: urlEndpoint = EndPoints.utilsCompanyClassifications.rawValue
            case .utilsPhoneNumber: urlEndpoint = EndPoints.utilsPhoneNumber.rawValue + "/\(phoneNumber)"
                
            case .usersExport: urlEndpoint = EndPoints.usersExport.rawValue
            case .usersHobbies: urlEndpoint = EndPoints.usersHobbies.rawValue
            case .usersInterests: urlEndpoint = EndPoints.usersInterests.rawValue
            case .usersOccupations: urlEndpoint = EndPoints.usersOccupations.rawValue
            case .usersWorkModels: urlEndpoint = EndPoints.usersWorkModels.rawValue
            case .users: urlEndpoint = EndPoints.users.rawValue
            case .usersAmount: urlEndpoint = EndPoints.usersAmount.rawValue
            case .usersUuid: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)"
            case .usersPassword: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)/password"
            case .usersValidate: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)/validate"
            case .usersCode: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)/code"
            case .usersPictures: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)/pictures"
            case .usersPicture: urlEndpoint = EndPoints.users.rawValue + "/\(uuid)/pictures/\(picture)"
            case .usersCreditWallets: urlEndpoint = EndPoints.usersCreditWallets.rawValue
                
            case .partnersExport: urlEndpoint = EndPoints.partnersExport.rawValue
            case .partnersAmount: urlEndpoint = EndPoints.partners.rawValue
            case .partners: urlEndpoint = EndPoints.partnersAmount.rawValue
            case .partnersId: urlEndpoint = EndPoints.partners.rawValue + "/\(id)"
            case .partnersFinancial: urlEndpoint = EndPoints.partners.rawValue + "/\(id)financial"
            case .partnersContacts: urlEndpoint = EndPoints.partners.rawValue + "/\(id)contacts"
            case .partnersDoorLocks: urlEndpoint = EndPoints.partners.rawValue + "/\(id)doorLocks"
            
            case .sitesSiteClassification: urlEndpoint = EndPoints.sitesSiteClassification.rawValue
            case .sites: urlEndpoint = EndPoints.sites.rawValue
            case .sitesId: urlEndpoint = EndPoints.sites.rawValue + "/\(id)"
            case .sitesContacts: urlEndpoint = EndPoints.sites.rawValue + "/\(id)/contacts"
                
            }
            
            guard let url = URL(string: self.baseAPIString + urlEndpoint) else { return }
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
    
    func postDataWithResponse<T: Codable, P: Codable>(parameters: P? = nil, completionHandler: @escaping ([T]?) -> Void) {
        
        getToken { accessToken in
            
            guard let parameters = parameters else {
                return
            }

            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = URL(string: self.baseAPIString + "/spaces/list?direction=asc&limit=10&offset=0") else { return }
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: [T].self) { response in
                if let data = response.value {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
        
       
        
    }
}
