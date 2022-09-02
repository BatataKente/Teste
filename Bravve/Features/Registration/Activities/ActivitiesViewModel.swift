//
//  AtividadesViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

protocol ActivitiesViewModelProtocol {
    
    func setupActivities()
    func setupButton(button: UIButton)
}

class ActivitiesViewModel {
    
    var interestArray: [String] = []
    
    var activitiesDelegate: ActivitiesViewModelProtocol?
    
    
    /// This function creates capsuleButtons that are allocated inside a horizontal StackView from API data.
    func interestActivities() {
        let sessionManager = SessionManager()
        sessionManager.getDataArray(endpoint: .usersInterests) { (statusCode, error, interestActivities: [Interests]?) in
            guard let interestActivities = interestActivities else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            for interestActivity in interestActivities {
                guard let activityName = interestActivity.name else { return }
                self.interestArray.append(activityName)
                print(self.interestArray)
            }
            
            self.activitiesDelegate?.setupActivities()
        }
    }
    
    
    /// This function creates a horizontal StackView for the purpose of creating the API generated capsuleButtons.
    /// - Parameter views: Views to set in the list
    /// - Returns: This function return an horizontal UIStackView.
    private func createStackView(_ views: [UIView]) -> UIStackView {

        let stackView = UIStackView(arrangedSubviews: views)
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally

        return stackView
    }
    
    /// This function creates a vertical stackview where the horizontal StackViews containing the capsuleButtons are allocated.
    /// - Parameter buttons: capsuleButtons
    /// - Returns: This function returns a maximum two capsuleButtons per hotizontal StackView.
    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {

        var stackViews = [UIStackView]()

        var from = 0

        if buttons.count%2 != 0 {
            
            self.activitiesDelegate?.setupButton(button: buttons[from])
            stackViews.append(self.createStackView([buttons[from]]))

            from += 1
        }

        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
            
            self.activitiesDelegate?.setupButton(button: buttons[i])
            self.activitiesDelegate?.setupButton(button: buttons[i+1])

            stackViews.append(self.createStackView([buttons[i],
                                                    buttons[i+1]]))
        }

        return stackViews
        }
}
