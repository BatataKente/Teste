//
//  FilterModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import UIKit

class FilterViewModel {
    

    //MARK: - setupStackView
    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {
        
        let createStackView = { (_ views: [UIView]) -> UIStackView in
            
            let stackView = UIStackView(arrangedSubviews: views)
            
                stackView.spacing = 4
            stackView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
                stackView.axis = .horizontal
                stackView.distribution = .fillProportionally
            
            return stackView
        }
        
        var stackViews = [UIStackView]()
        
        var from = 0
        
        if buttons.count%2 != 0 {
            
            stackViews.append(createStackView([buttons[from]]))
            
            from += 1
        }
        
        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
            
            stackViews.append(createStackView([buttons[i],
                                                    buttons[i+1]]))
        }
        
        return stackViews
    }
    
}
