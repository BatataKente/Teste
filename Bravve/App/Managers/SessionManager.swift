//
//  SessionManager.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 05/08/22.
//

import Foundation
import UIKit
import Alamofire

/// Class to manage API Requests
class SessionManager {
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    private let baseAPIString = "https://api.dev.bravve.app"
    
    /// Method to get data from the API with a response decoded as an array
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - completionHandler: Completion handler to use the result of the API call
    func getDataArray<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", queryType: String = "", endpoint: EndPoints, completionHandler: @escaping (Int?, Error?, [T]?) -> Void) {
        
        guard let accessToken = accessToken else { return }
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "\(accessToken)"
        ]
        
        AF.request(url, headers: headers).responseDecodable(of: [T].self) { response in
            //print(response.debugDescription)
            if let data = response.value {
                completionHandler(response.response?.statusCode, nil, data)
            } else {
                completionHandler(response.response?.statusCode, response.error, nil)
            }
        }
    }
    
    
    /// Method to get open data in the API with response as an array
    /// - Parameters:
    ///   - id: Optional argument to pass an id as a url string parameter
    ///   - phoneNumber: Optional argument to pass a phone number as a url string parameter
    ///   - uuid: Optional argument to pass a uuid as a url string parameter
    ///   - picture: Optional argument to pass a picture path as a url string parameter
    ///   - picture_uuid: Optional argument to pass a picture_uuid as a url string parameter
    ///   - payment_type_id: Optional argument to pass a payment_type_id as a url string parameter
    ///   - endpoint: Endpoint of the API call as a EndpointEnum
    ///   - completionHandler: Completion handler to manage the API call result
    func getOpenDataArray<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping (Int?, Error?, [T]?) -> Void) {
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        
        AF.request(url).responseDecodable(of: [T].self) { response in
//            print(response.debugDescription)
            if let data = response.value {
                completionHandler(response.response?.statusCode, nil, data)
            } else {
                completionHandler(response.response?.statusCode, response.error, nil)
            }
        }
    }
    
    
    /// Method to get data from the API with a response decoded as a customModel
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - completionHandler: Completion handler to use the result of the API call
    func getData<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping (Int?, Error?, T?) -> Void) {
        
            guard let accessToken = accessToken else { return }
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            AF.request(url, headers: headers).responseDecodable(of: T.self) { response in
//                print(response.debugDescription)
                if let data = response.value {
                    completionHandler(response.response?.statusCode, nil, data)
                } else {
                    completionHandler(response.response?.statusCode, response.error, nil)
                }
            }
    }
    
    func getOpenData<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping (Int?, Error?, T?) -> Void) {
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        
        AF.request(url).responseDecodable(of: T.self) { response in
//            print(response.debugDescription)
            if let data = response.value {
                completionHandler(response.response?.statusCode, nil, data)
            } else {
                completionHandler(response.response?.statusCode, response.error, nil)
            }
        }
    }
    
    /// Method to post data to the API with a response decoded as an array
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - parameters: The parameter to be passed in the post call with a customModel type
    ///   - completionHandler: Completion handler to use the result of the API call
    func postDataWithArrayResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?, [T]?) -> Void) {
        
            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: [T].self) { response in
//                print(response.debugDescription)
                if let data = response.value {
                    completionHandler(response.response?.statusCode, nil, data)
                } else {
                    completionHandler(response.response?.statusCode, response.error, nil)
                }
            }
    }
    
    /// Method to post data to an open API with an array as response
    /// - Parameters:
    ///   - id: Optional argument id to be passed as a url string parametetr
    ///   - phoneNumber: Optional argument phone number to be passed as a url string parameter
    ///   - uuid: Optional argument uuid to be passed as a url string parameter
    ///   - picture: Optional argument picture path to be passed as a url string parameter
    ///   - picture_uuid: Optional argument picture_uuid to be passed as a url string parameter
    ///   - payment_type_id: Optional argument payment_type_id to be passed as a url string parameter
    ///   - endpoint: API URL endpoint to be passed as a EndpointEnum
    ///   - parameters: API body parameters to be passed as a Codable
    ///   - completionHandler: Completion handler to manage the API response
    func postDataWithOpenArrayResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?, [T]?) -> Void) {
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: [T].self) { response in
     
            if let data = response.value {
                completionHandler(response.response?.statusCode, response.error, data)
            } else {
                completionHandler(response.response?.statusCode, response.error, nil)
            }
        }
    }
    
    
    /// Method to post data to the API with a response decoded as a customModel
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - parameters: The parameter to be passed in the post call with a customModel type
    ///   - completionHandler: Completion handler to use the result of the API call
    func postDataWithResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?, T?) -> Void) {
      
            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: T.self) { response in
                print(response.debugDescription)
                if let data = response.value {
                    completionHandler(response.response?.statusCode, nil, data)
                } else {
                    completionHandler(response.response?.statusCode, response.error, nil)
                }
            }
    }
    
    func postDataWithOpenResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?, T?) -> Void) {
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        print(url)
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: T.self) { response in
//            print(response.debugDescription)
            if let data = response.value {
                completionHandler(response.response?.statusCode, response.error, data)
            } else {
                completionHandler(response.response?.statusCode, response.error, nil)
            }
        }
    }
    
    
    /// Method to upload photos to the API
    /// - Parameters:
    ///   - id: Optional id to be passed as a url string parameter
    ///   - phoneNumber: Optional phone_number to be passed as a url string parameter
    ///   - uuid: Optional uuid to be passed as a url string parameter
    ///   - picture: Optional picture to be passed as a url string parameter
    ///   - picture_uuid: Optional picture_uuid to be passed as a url string parameter
    ///   - payment_type_id: Optional payment_type_id to be passed as a url string parameter
    ///   - endpoint: API endpoint passed as a endpoint enum
    ///   - picture_url: Local URL of the picture to be send to the API
    ///   - completionHandler: Completio handler to manage the API response
    func uploadPictureWithResponse<T: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, picture_url: URL, completionHandler: @escaping (Int?, Error?, T?) -> Void) {

            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            print(url)
            
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(picture_url, withName: "picture")
            }, to: url, headers: headers).responseDecodable(of: T.self) { response in
//                print(response.debugDescription)
                if let data = response.value {
                    completionHandler(response.response?.statusCode, nil, data)
                } else {
                    completionHandler(response.response?.statusCode, response.error, nil)
                }
            }
    }
    
    /// Method to post data to the API without receiving a response
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - parameters: The parameter to be passed in the post call with a customModel type
    ///   - completionHandler: Completion handler to use the result of the API call
    func postDataWithoutResponse<P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?) -> Void) {
  
            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
//                print(response.debugDescription)
                if let statusCode = response.response?.statusCode {
                    completionHandler(statusCode, response.error)
                } else {
                    completionHandler(response.response?.statusCode, response.error)
                }
            }
    }
    
    func postOpenDataWithoutResponse<P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?) -> Void) {
        
        guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
            
//            print(response.debugDescription)
            
            if let statusCode = response.response?.statusCode {
                completionHandler(statusCode, response.error)
            } else {
                completionHandler(response.response?.statusCode, response.error)
            }
        }
    }
    
    
    /// Method to put data to the API with a response as a customModel
    /// - Parameters:
    ///   - id: Optional argument to pass the id to the API endpoint
    ///   - phoneNumber: Optional argument to pass the phoneNumber to the API endpoint
    ///   - uuid: Optional argument to pass the uuid to the API endpoint
    ///   - picture: Optional argument to pass the picture path to the API endpoint
    ///   - picture_uuid: Optional argument to pass the picture_uuid to the  API endpoint
    ///   - payment_type_id: Optional argument to pass the payment_type_id to the API endpoint
    ///   - endpoint: The API endpoint as a member of the Endpoint Enum
    ///   - parameters: The parameter to be passed in the post call with a customModel type
    ///   - completionHandler: Completion handler to use the result of the API call
    func putDataWithResponse<T: Codable, P: Codable>(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, parameters: P, completionHandler: @escaping (Int?, Error?, T?) -> Void) {

            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "\(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: T.self) { response in
                print(response.debugDescription)
                if let data = response.value {
                    completionHandler(response.response?.statusCode, nil, data)
                } else {
                    completionHandler(response.response?.statusCode, response.error, nil)
                }
            }
    }
    
    
    /// Method to delete data from the API
    /// - Parameters:
    ///   - id: Optional argument to pass the id as a url string parameter
    ///   - phoneNumber: Optional argument to pass a phone number as a url string parameter
    ///   - uuid: Optional argument to pass a uuid as a url string parameter
    ///   - picture: Optional argument to pass a picture path as a url string parameter
    ///   - picture_uuid: Optional argument to pass a picture_uuid as a url string parameter
    ///   - payment_type_id: Optional argument to pass a payment_type_id as  a url string parameter
    ///   - endpoint: The API endpoint as a Endpoint Enum
    ///   - completionHandler: Completion Handler to manage the status code returned from the API Call.
    func deleteData(id: String = "", phoneNumber: String = "", uuid: String = "", picture: String = "", picture_uuid: String = "", payment_type_id: String = "", endpoint: EndPoints, completionHandler: @escaping (Int?, Error?) -> Void) {
 
            guard let accessToken = accessToken else {
                return
            }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)"
            ]
            
            guard let url = self.getURL(endpoint: endpoint, id: id, phoneNumber: phoneNumber, uuid: uuid, picture: picture, picture_uuid: picture_uuid, payment_type_id: payment_type_id) else { return }
            
            AF.request(url, method: .delete, headers: headers).response { response in
                print(response.debugDescription)
                if let statusCode = response.response?.statusCode {
                    completionHandler(statusCode, response.error)
                } else {
                    completionHandler(response.response?.statusCode, response.error)
                }
            }
    }
    
    
    
    /// Method to construct the url to be called in the network functions
    /// - Parameters:
    ///   - endpoint: The endpoint as a Endpoint Enum
    ///   - id: The id to be passed to the endpoint url
    ///   - phoneNumber: The phoneNumber to be passed to the endpoint url
    ///   - uuid: The uuid to be passed to the endpoint url
    ///   - picture: The picture path to be passed to the endpoint url
    ///   - picture_uuid: The picture uuid to be passed to the endpoint url
    ///   - payment_type_id: The payment_type_id to be passed to the endpoint url
    /// - Returns: Optional URL object to be called in the network functions' requests
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
            
        case .spacesTypes: urlEndpoint = EndPoints.spacesTypes.rawValue
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
        case .reservationsOpen: urlEndpoint = EndPoints.reservationsOpen.rawValue
        case .reservationshistory: urlEndpoint = EndPoints.reservationshistory.rawValue
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
