//
//  HomeAbertaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeOpenViewModel {
    
    init(_ customBarWithFilter: CustomBarWithFilter, _ spaceParameters: SpaceListParameters = SpaceListParameters(space_state_id: nil, space_city_id: nil, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil)) {
        
        self.customBarWithFilter = customBarWithFilter
        self.spaceParameters = spaceParameters
    }
    
    var delegate: HomeOpenViewModelProtocol?
    
    private let sessionManager = SessionManager()
    
    var spaceParameters: SpaceListParameters
    
    private let homeOpenView = HomeOpenView()
    
    private let customBarWithFilter: CustomBarWithFilter
    
    func manageCustomBar() {
        
        let font = UIFont(name: FontsBravve.medium.rawValue,
                          size: CGFloat(15).generateSizeForScreen)
        
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        
        var parameters = spaceParameters
        
        sessionManager.getOpenDataArray (endpoint: .utilsStates){ (statusCode, error, states: [States]?) in

            guard let states = states else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            
            var stateButtons = [UIButton]()

            for state in states {

                let stateButton = UIButton()
                stateButton.setTitle(state.code, for: .normal)
                stateButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                     for: .normal)
                stateButton.titleLabel?.font = font
                let stateHandler = {(action: UIAction) in

                    self.customBarWithFilter.stateLabel.font = smallFont
                    self.customBarWithFilter.stateChosedLabel.text = stateButton.currentTitle
                    self.customBarWithFilter.cityChosedLabel.isHidden = true
                    self.customBarWithFilter.cityLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                                                     size: CGFloat(15).generateSizeForScreen)
                    self.delegate?.reduceDropDowns()
                    
                    parameters.space_state_id = state.id
                    
                    self.sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: parameters) {(statusCode, error, spaces: [Space]?) in
                        
                        guard let spaces = spaces else {
                            print(statusCode as Any)
                            print(error?.localizedDescription as Any)
                            return
                        }
                        
                        self.delegate?.setSpaces(spaces)
                        
                        UIView.animate(withDuration: 0.6,
                                       delay: 0.3) {

                            self.delegate?.setCoverView(0)
                        }
                    }
                    
                    self.customBarWithFilter.leftButton.isEnabled = false
                    self.customBarWithFilter.rightButton.isEnabled = false
                    
                    self.sessionManager.getOpenDataArray(id: "\(state.id)", endpoint: .utilsCities) { (statusCode, error, cities: [Cities]?) in
                        
                        guard let cities = cities else {
                            print(statusCode as Any)
                            print(error as Any)
                            return
                            
                        }
                        
                        var cityButtons = [UIButton]()
                        
                        for city in cities {

                            let cityButton = UIButton()
                            cityButton.setTitle(city.name, for: .normal)
                            cityButton.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                                 for: .normal)
                            cityButton.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                                             size: CGFloat(15).generateSizeForScreen)
                            
                            self.customBarWithFilter.leftButton.isEnabled = true
                            self.customBarWithFilter.rightButton.isEnabled = true
                            
                            let cityHandler = {(action: UIAction) in
                                
                                self.customBarWithFilter.cityLabel.font = smallFont
                                self.customBarWithFilter.cityChosedLabel.text = cityButton.currentTitle
                                self.customBarWithFilter.cityChosedLabel.isHidden = false
                                self.delegate?.reduceDropDowns()
                                
                                parameters.space_city_id = city.id
                                
                                self.sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: parameters) {(statusCode, error, spaces: [Space]?) in
                                    
                                    guard let spaces = spaces else {
                                        print(statusCode as Any)
                                        print(error?.localizedDescription as Any)
                                        return
                                    }
                                    
                                    self.delegate?.setSpaces(spaces)
                                    
                                    UIView.animate(withDuration: 0.6,
                                                   delay: 0.3) {

                                        self.delegate?.setCoverView(0)
                                    }
                                }
                            }
                            
                            cityButton.addAction(UIAction(handler: cityHandler), for: .touchUpInside)
                            cityButton.titleLabel?.constraintInsideTo(.leading, cityButton,
                                                                      CGFloat(15).generateSizeForScreen)
                            cityButtons.append(cityButton)
                        }
                        
                        self.delegate?.setupRightDropDown(cityButtons)
                    }
                }
                stateButton.addAction(UIAction(handler: stateHandler), for: .touchUpInside)
                stateButton.titleLabel?.constraintInsideTo(.leading, stateButton,
                                                           CGFloat(15).generateSizeForScreen)
                stateButtons.append(stateButton)
            }
            self.delegate?.setupLeftDropDown(stateButtons)
        }
        
        sessionManager.postDataWithOpenArrayResponse(endpoint: .spacesList, parameters: spaceParameters) {(statusCode, error, spaces: [Space]?) in
            
            guard let spaces = spaces else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            self.delegate?.setSpaces(spaces)
            
            UIView.animate(withDuration: 0.6,
                           delay: 0.3) {

                self.delegate?.setCoverView(0)
            }
        }
    }
    
    /// This functions create and add to superview of a view one or multipleconstraints
    /// - Parameters:
    ///   - item: the view
    ///   - to: an element to conect constraints
    ///   - itemAttribute: attribute of view to connect constraints(will be the same of element by default)
    ///   - attributes: the atributes of item to connect constraints
    ///   - relation: relation, the default is .equal
    ///   - multiplier: multiplier, the default is 1
    ///   - constant: constant, the default is 0
    func constraint(the item: UIView,
                    to: Any?,
                    _ itemAttribute: NSLayoutConstraint.Attribute? = nil,
                    by attributes: [NSLayoutConstraint.Attribute],
                    relation: NSLayoutConstraint.Relation? = nil,
                    multiplier: CGFloat? = nil,
                    _ constant: CGFloat? = nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in attributes {
            
            item.superview?.addConstraint(NSLayoutConstraint(item: item,
                                                             attribute: attribute,
                                                             relatedBy: relation ?? .equal,
                                                             toItem: to,
                                                             attribute: itemAttribute ?? attribute,
                                                             multiplier: multiplier ?? 1,
                                                             constant: constant ?? 0))
        }
    }
    
    /// This function remove masks of a view and subviews from it
    /// - Parameter view: the view to remove masks
    func removeMasks(of view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

protocol HomeOpenViewModelProtocol {
    
    func setSpaces(_ spaces: [Space])
    
    func setCoverView(_ alpha: CGFloat)
    
    func reduceDropDowns()
    
    func setupLeftDropDown(_ buttons: [UIButton])
    
    func setupRightDropDown(_ buttons: [UIButton])
}
