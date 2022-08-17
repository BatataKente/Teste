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
    
    private let sessionManager = SessionManager()
    
    private let customBarWithFilter: CustomBarWithFilter
    
    func manageCustomBar() {
        
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        
        var parameters = SpaceListParameters()
        
        sessionManager.getOpenDataArray (endpoint: .utilsStates){ (states: [States]?) in

            guard let states = states else {
                return
            }

            var actions = [UIAction]()

            let stateHandler = {(action: UIAction) in

                for state in states {

                    if state.code == action.title {
                        
                        parameters = SpaceListParameters(space_state_id: state.id, space_city_id: nil, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil)

                        self.sessionManager.getOpenDataArray(id: "\(state.id)", endpoint: .utilsCities) { (cities: [Cities]?) in

                            guard let cities = cities else {return}

                            var actions = [UIAction]()

                            let cityHandler = {(action: UIAction) in
                                
                                self.customBarWithFilter.cityChosedLabel.text = action.title
                                self.customBarWithFilter.cityLabel.font = smallFont
                                
                                for city in cities {
                                    
                                    if city.name == action.title {
                                    
                                    parameters = SpaceListParameters(space_state_id: state.id, space_city_id: city.id, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil)
                                    }
                                    
                                    self.sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: parameters) { (spaces: [Space]?) in
                                        
                                        guard let spaces = spaces else {
                                            return
                                        }
                                        
                                        self.delegate?.setSpaces(spaces)
                                    }
                                }
                                
                                
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
                
                self.sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: parameters) { (spaces: [Space]?) in
                    
                    guard let spaces = spaces else {
                        return
                    }
                    
                    self.delegate?.setSpaces(spaces)
                }
            }
            
            for state in states {

                actions.append(UIAction(title: state.code,
                                        handler: stateHandler))
            }

            self.customBarWithFilter.leftButton.setMenuForButton(actions)
        }
        
        sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: parameters) { (spaces: [Space]?) in
            
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
