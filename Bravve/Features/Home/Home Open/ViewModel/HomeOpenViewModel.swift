//
//  HomeAbertaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeOpenViewModel {
    
    init(_ customBarWithFilter: CustomBarWithFilter) {
        
        self.customBarWithFilter = customBarWithFilter
    }
    
    var delegate: HomeOpenViewModelProtocol?
    
    private let authManager = NetworkManager()
    
    private let customBarWithFilter: CustomBarWithFilter
    
    func manageCustomBar() {
        
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        
        authManager.getDataArray (endpoint: .utilsStates){ (states: [States]?) in

            guard let states = states else {
                return
            }

            var actions = [UIAction]()

            let stateHandler = {(action: UIAction) in

                for state in states {

                    if state.code == action.title {

                        self.authManager.getDataArray(id: "\(state.id)", endpoint: .utilsCities) { (cities: [Cities]?) in

                            guard let cities = cities else {return}

                            var actions = [UIAction]()

                            let cityHandler = {(action: UIAction) in
                                
                                self.customBarWithFilter.cityChosedLabel.text = action.title
                                self.customBarWithFilter.cityLabel.font = smallFont
                            }
                            
                            for city in cities {

                                guard let cityname = city.name else {return}
                                
                                actions.append(UIAction(title: cityname,
                                                        handler: cityHandler))
                            }
                            
                            self.customBarWithFilter.stateChosedLabel.text = action.title
                            self.customBarWithFilter.stateLabel.font = smallFont

                            self.customBarWithFilter.rightButton.setMenuForButton(actions)
                        }
                    }
                }
            }
            
            for state in states {

                actions.append(UIAction(title: state.code,
                                        handler: stateHandler))
            }

            self.customBarWithFilter.leftButton.setMenuForButton(actions)
        }
        
        let parameters = SpaceListParameters(space_state_id: 1, space_city_id: 2, allow_workpass: true, seats_qty: 3, space_type_id: 4, space_classification_id: 5, space_category_id: 6, space_facilities_id: [0], space_noise_level_id: 7, space_contract_Type: 8)
        
        authManager.postDataWithArrayResponse(endpoint: .spacesList, parameters: parameters) { (spaces: [Space]?) in
            guard let spaces = spaces else {
                return
            }
            
            self.delegate?.setSpaces(spaces)
            
            UIView.animate(withDuration: 0.6,
                           delay: 0.3) {
                
                self.delegate?.setCoverView(0)
            }
        }
    }
}

protocol HomeOpenViewModelProtocol {
    
    func setSpaces(_ spaces: [Space])
    
    func setCoverView(_ alpha: CGFloat)
}
