//
//  ProfissaoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ProfessionViewModel {
    
    let sessionManager =  SessionManager()
    
    func selectAreaMenu(label: UILabel, scrollView: UIScrollView) {
        
        sessionManager.getDataArray(endpoint: .usersOccupations) { (statusCode, error, occupations: [Occupations]?) in
            
            var selectAreaMenu: [UIButton] = []
            
            guard let occupations = occupations else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            for occupation in occupations {
            
            guard let occupationName = occupation.name else { return }
            let button = UIButton()
            button.setTitle(occupationName, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
                button.titleLabel?.numberOfLines = 0
            
            let handler = {(action: UIAction) in
                label.text = button.currentTitle
                scrollView.frame.size = .zero
                label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
                label.isHidden = false
                label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
            }
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
                selectAreaMenu.append(button)
            }
            scrollView.turnIntoAList(selectAreaMenu)
        }
    }
    
    func workRegimeMenu(label: UILabel, scrollView: UIScrollView) {
        
        sessionManager.getDataArray(endpoint: .usersWorkModels) { (statusCode, error, workModels: [WorkModels]?) in
            
            var workRegimeMenu: [UIButton] = []
            
            guard let workModels = workModels else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            for workModel in workModels {
            
            guard let workModelName = workModel.name else { return }
            let button = UIButton()
            button.setTitle(workModelName, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(15).generateSizeForScreen)
            
            let handler = {(action: UIAction) in
                label.text = button.currentTitle
                scrollView.frame.size = .zero
                label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
                label.isHidden = false
                label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(16).generateSizeForScreen)
            }
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
                workRegimeMenu.append(button)
            }
            scrollView.turnIntoAList(workRegimeMenu)
        }
    }
}
