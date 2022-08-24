//
//  AtividadesViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

//import UIKit
//
//class ActivitiesViewModel {
//
//
//    let activitiesView = ActivitiesView()
    
//    func interestActivities() {
//        
//        var interestArray: [String] = []
//        let networkManager = NetworkManager()
//        
//        networkManager.getDataArray(endpoint: .usersInterests) { (interestActivities: [Interests]?) in
//            guard let interestActivities = interestActivities else {
//                return
//            }
//            for interestActivity in interestActivities {
//                interestArray.append(interestActivity.name ?? "")
//                print(interestArray)
//            }
//            self.activitiesView.interestsButtons = activitiesView.createCapsuleButtons(self.interestArray, ColorsBravve.capsuleButton)
//            for InterestButton in self.activitiesView.interestsButtons {
//                InterestButton.addTarget(self, action: #selector(self.activitiesView.buttonTapped), for: .touchUpInside)
//            }
//            self.activitiesView.interestsStackView.addArrangedSubviews(self.setupStackView(self.activitiesView.interestsButtons))
//        }
//    }
    
//    func activeButton() {
//
//        activitiesView.continueButton.addTarget(nil, action: #selector(activitiesView.continueButtonTapped), for: .touchUpInside)
//        activitiesView.continueButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
//    }
//
//    private func createStackView(_ views: [UIView]) -> UIStackView {
//
//        let stackView = UIStackView(arrangedSubviews: views)
//        stackView.spacing = 4
//        stackView.axis = .horizontal
//        stackView.distribution = .fillProportionally
//
//        return stackView
//    }
//
//    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {
//
//        var stackViews = [UIStackView]()
//
//        var from = 0
//
//        if buttons.count%2 != 0 {
//
//            buttons[from].addTarget(self, action: #selector(self.activitiesView.buttonTapped),
//                                    for: .touchUpInside)
//            stackViews.append(self.createStackView([buttons[from]]))
//
//            from += 1
//        }
//
//        for i in stride(from: from,
//                        to: buttons.count - 1,
//                        by: 2) {
//
//            buttons[i].addTarget(self, action: #selector(self.activitiesView.buttonTapped),
//                                 for: .touchUpInside)
//            buttons[i+1].addTarget(self, action: #selector(self.activitiesView.buttonTapped),
//                                   for: .touchUpInside)
//
//            stackViews.append(self.createStackView([buttons[i],
//                                                    buttons[i+1]]))
//        }
//
//        return stackViews
//        }
//}
