//
//  SingleBookingViewModel.swift
//  Teste
//
//  Created by Josicleison on 26/08/22.
//

import UIKit

class SingleBookingViewModel {
    
    func bringTheStackWithThisDate(views: [UIView],_ day: String,_ month: String,_ year: String) -> UIStackView? {
        
        for view in views {
            
            if let chosedDayStack = view as? UIStackView {
                
                if let dayLabelStack = chosedDayStack.arrangedSubviews[0] as? UIStackView {
                    
                    if let dayLabel = dayLabelStack.arrangedSubviews[0] as? UILabel {
                        
                        if let text = dayLabel.text {
                            
                            if text.contains(day) && text.contains(month) && text.contains(year) {
                                
                                return chosedDayStack
                            }
                        }
                    }
                }
            }
        }
        return nil
    }
}
