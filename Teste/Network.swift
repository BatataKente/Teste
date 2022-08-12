
import Foundation
import UIKit
import Alamofire

/// Class to manage API Requests
class NetworkManager {
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
        
    private let baseAPIString = "https://api-design.dev.bravve.app/api/v1"
    
    /// Method to get the token to access the BravveAPI
    /// - Parameter completioHandler: Completion handler that holds the API token as parameter to manage the result of the API Call
    public func getToken(completioHandler: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://api-design.dev.bravve.app/api/auth/token") else { return }
        let parameters = [
            "username": "kaue",
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
    func getDataArray<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping ([T]?) -> Void) {
        
        getToken { accessToken in
            guard let accessToken = accessToken else { return }
            
            
         
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            AF.request(url, headers: headers).responseDecodable(of: [T].self) { response in
                if let data = response.value {
//                    print(response.response?.statusCode)
                    completionHandler(data)
                } else {
//                    print(response.response?.statusCode)
                    completionHandler(nil)
                }
            }
        }
    }
    
    
    func getData<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping (T?) -> Void) {
        
        getToken { accessToken in
            guard let accessToken = accessToken else { return }
            
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            AF.request(url, headers: headers).responseDecodable(of: T.self) { response in
                print(response.error as Any)
                if let data = response.value {
                    completionHandler(data)
                } else {
                    print(response.response?.statusCode as Any)
                    completionHandler(nil)
                }
            }
        }
    }
    
    func postDataWithArrayResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P? = nil, completionHandler: @escaping ([T]?) -> Void) {
        
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
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: [T].self) { response in
                if let data = response.value {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func postDataWithResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P? = nil, completionHandler: @escaping (T?) -> Void) {
        
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
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: T.self) { response in
                print(response.response?.statusCode as Any)
                if let data = response.value {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func postDataWithoutResponse<P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P? = nil, completionHandler: @escaping (Int?) -> Void) {
        
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
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in

                if let statusCode = response.response?.statusCode {
                    completionHandler(statusCode)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func putDataWithResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P? = nil, completionHandler: @escaping (T?) -> Void) {
        
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
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: T.self) { response in
                if let data = response.value {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func getURL(endpoint: EndPoints, id: String, phoneNumber: String, uuid: String, picture: String, picture_uuid: String, payment_type_id: String) -> URL? {
        
        var urlEndpoint = ""
        
        switch endpoint {
            
        case .authForgotPassword: urlEndpoint = EndPoints.authForgotPassword.rawValue
        case .confirmForgotPassword: urlEndpoint = EndPoints.confirmForgotPassword.rawValue
        case .auth: urlEndpoint = EndPoints.auth.rawValue
            
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
        case .usersUuid: urlEndpoint = EndPoints.users.rawValue + "\(uuid)"
        case .usersPassword: urlEndpoint = EndPoints.users.rawValue + "\(uuid)/password"
        case .usersValidate: urlEndpoint = EndPoints.users.rawValue + "\(uuid)/validate"
        case .usersCode: urlEndpoint = EndPoints.users.rawValue + "\(uuid)/code"
        case .usersPictures: urlEndpoint = EndPoints.users.rawValue + "\(uuid)/pictures/"
        case .usersPicture: urlEndpoint = EndPoints.users.rawValue + "\(uuid)/pictures/\(picture)"
        case .usersCreditWallets: urlEndpoint = EndPoints.usersCreditWallets.rawValue
            
        case .partnersExport: urlEndpoint = EndPoints.partnersExport.rawValue
        case .partnersAmount: urlEndpoint = EndPoints.partners.rawValue
        case .partners: urlEndpoint = EndPoints.partnersAmount.rawValue
        case .partnersId: urlEndpoint = EndPoints.partners.rawValue + "\(id)"
        case .partnersFinancial: urlEndpoint = EndPoints.partners.rawValue + "\(id)financial"
        case .partnersContacts: urlEndpoint = EndPoints.partners.rawValue + "\(id)contacts"
        case .partnersDoorLocks: urlEndpoint = EndPoints.partners.rawValue + "\(id)doorLocks"
        
        case .sitesSiteClassification: urlEndpoint = EndPoints.sitesSiteClassification.rawValue
        case .sites: urlEndpoint = EndPoints.sites.rawValue
        case .sitesId: urlEndpoint = EndPoints.sites.rawValue + "/\(id)"
        case .sitesContacts: urlEndpoint = EndPoints.sites.rawValue + "/\(id)/contacts"
            
        case .spacesTypes: urlEndpoint = EndPoints.sitesSiteClassification.rawValue
        case .spacesClassifications: urlEndpoint = EndPoints.spacesClassifications.rawValue
        case .spacesCategories: urlEndpoint = EndPoints.spacesCategories.rawValue
        case .spacesFacilities: urlEndpoint = EndPoints.spacesFacilities.rawValue
        case .spacesNoises: urlEndpoint = EndPoints.spacesNoises.rawValue
        case .spacesContracts: urlEndpoint = EndPoints.spacesContracts.rawValue
        case .spaces: urlEndpoint = EndPoints.spaces.rawValue
        case .spacesId: urlEndpoint = EndPoints.spaces.rawValue + "\(id)"
        case .spacesList: urlEndpoint = EndPoints.spacesList.rawValue
        case .spacesPictures: urlEndpoint = EndPoints.spaces.rawValue + "\(id)/pictures/"
        case .spacesPictureUuid: urlEndpoint = EndPoints.spaces.rawValue + "\(id)/pictures/\(picture_uuid)"
        case .spacesFavorite: urlEndpoint = EndPoints.spacesFavorite.rawValue
        case .spacesQrcode: urlEndpoint = EndPoints.spaces.rawValue + "\(id)/qrcode"
            
        case .reservationsHours: urlEndpoint = EndPoints.reservationsHours.rawValue
        case .reservations: urlEndpoint = EndPoints.reservations.rawValue
        case .reservationsId: urlEndpoint = EndPoints.reservations.rawValue + "\(id)"
        case .reservationsCancellations: urlEndpoint = EndPoints.reservationsCancellations.rawValue
        case .reservationsCheckins: urlEndpoint = EndPoints.reservationsCheckins.rawValue
        case .reservationsCheckouts: urlEndpoint = EndPoints.reservationsCheckouts.rawValue
        case .reservationsDoorlocks: urlEndpoint = EndPoints.reservationsDoorlocks.rawValue
        case .reservationsPayments: urlEndpoint = EndPoints.reservationsPayments.rawValue
        case .reservationsPaymentsWorkpass: urlEndpoint = EndPoints.reservationsPaymentsWorkpass.rawValue
        case .reservationsPaymentSummary: urlEndpoint = EndPoints.reservationsPaymentSummary.rawValue + "/\(payment_type_id)"
        
        }
        
        let url = URL(string: self.baseAPIString + urlEndpoint)
        
        return url
    }
}
