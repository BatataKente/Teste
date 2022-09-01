//
//  ReservaFinalizadaViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ReservationCompletedViewModel {
    
    //MARK: - createLabel
    func createLabel(placeHolderValue text: String) -> UILabel {
        let createLabel = UILabel()
        createLabel.font = UIFont(name: "Ubuntu-Regular", size: CGFloat(12).generateSizeForScreen)
        createLabel.text = text
        createLabel.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        createLabel.textColor = UIColor(named: ColorsBravve.white_white.rawValue)
        return createLabel
    }
    
}
