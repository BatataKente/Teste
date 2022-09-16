//
//  HobbiesViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol HobbiesViewModelProtocol {
    func setupHobbies()
    func setupButton(button: UIButton)
}

class HobbiesViewModel {
    
    var hobbiesDelegate: HobbiesViewModelProtocol?
    
    var aPIHobbiesArray: [String] = []
    
    /// This function creates capsuleButtons that are allocated inside a horizontal StackView from API data.
    func setupHobbiesArray() {
        
        let sessionManager = SessionManager()

        sessionManager.getDataArray(endpoint: .usersHobbies) { (statusCode, error, hobbiesList: [Hobbies]? ) in

            guard let hobbiesList = hobbiesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            
            for hobbies in hobbiesList {
                
                guard let hobbiesName = hobbies.name else { return }
                self.aPIHobbiesArray.append(hobbiesName)
            }
            
            self.hobbiesDelegate?.setupHobbies()
        }
    }
    
    /// This function creates a horizontal StackView for the purpose of creating the API generated capsuleButtons
    /// - Parameter views: Views to set in the list
    /// - Returns: This function return an horizontal StackView
    private func createStackView(_ views: [UIView]) -> UIStackView {
            
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        return stackView
    }
    
    /// This function creates a vertical stackview where the horizontal StackViews containing the capsuleButtons are allocated
    /// - Parameter buttons: capsuleButtons
    /// - Returns: This function returns a maximum two capsuleButtons per hotizontal StackView
    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {
            
        var stackViews = [UIStackView]()
        
        var from = 0
        
        if buttons.count%2 != 0 {
            
            self.hobbiesDelegate?.setupButton(button: buttons[from])
        
            stackViews.append(self.createStackView([buttons[from]]))
            
            from += 1
        }
        
        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
            
            self.hobbiesDelegate?.setupButton(button: buttons[i])
            self.hobbiesDelegate?.setupButton(button: buttons[i + 1])
            
            stackViews.append(self.createStackView([buttons[i], buttons[i+1]]))
        }
        
        return stackViews
        }   
}
