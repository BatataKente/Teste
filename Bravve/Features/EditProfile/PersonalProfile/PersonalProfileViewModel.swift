//
//  PerfilPessoalViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

//MARK: - Protocol
protocol PersonalProfileViewModelProtocol {
    
    func setupLabels(email: String?, firstName: String)
    
    func setupPic(URL: URL?, placeholderImage: UIImage?)
}

class PersonalProfileViewModel {
    
    var delegate : PersonalProfileViewModelProtocol?
    
    private let sessionManager = SessionManager()
    
    var uuid: String {
        
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else {
            
            print("Unable to get user uuid")
            return ""
        }
        return uuid
    }
    //MARK: - userData
    func userData() {
        
        sessionManager.getData(uuid: uuid, endpoint: .usersUuid){ (statusCode, error, user: User?) in

            guard let user = user else {
                print(user?.message as Any)
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            DispatchQueue.main.async {
                
                guard let userName = user.name else {return}
                let firstName = String(userName.split(separator: " ")[0])
                
                self.delegate?.setupLabels(email: user.email, firstName: firstName)
            }
        }
        
        sessionManager.getDataArray(uuid: uuid, endpoint: .usersPictures) { (statusCode, error, pictures: [Pictures]?) in
            
                guard let pictures = pictures else {
                    print(statusCode as Any)
                    
                return
            }
            
            if !pictures.isEmpty {
            
                guard let pictureUuid = pictures[0].picture else {
                    print(pictures[0].message as Any)
                    
                return
            }
            
                self.sessionManager.getData(uuid: self.uuid, picture: pictureUuid, endpoint: .usersPicture) { (statusCode, error, pictureURL: PictureURL?) in
                
                guard let pictureURL = pictureURL?.picture_url else {
                    
                    print(pictureURL?.message as Any)
                    print(statusCode as Any)
                    
                    return
                }
                
                DispatchQueue.main.async {

                    self.delegate?.setupPic(URL: URL(string: pictureURL), placeholderImage: UIImage(named: "photo"))
                    }
                }
            }
        }
    }
}
