//
//  ProfissaoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ProfessionViewModel {
    
    func addingJobs() -> [String]{
        var jobs: [String] = []
        
        for i in 1...20 {
            jobs.append("\(i)")
        }
        
        return jobs
    }
    
    func addingWorkModels() -> [String]{
        var jobs: [String] = []
        
        for i in 1...20 {
            jobs.append("\(i)")
        }
        
        return jobs
    }
    
    let networkManager =  NetworkManager()
    
    func selectAreaMenu(label: UILabel, button: UIButton) {
        
        networkManager.getDataArray(endpoint: .usersOccupations) { (occupations: [Occupations]?) in
            
            var selectAreaMenu: [UIAction] = []
            
            guard let occupations = occupations else {
                return
            }
            
            let handler = { (action: UIAction) in
                label.text = action.title
            }
            
            for occupation in occupations {
                guard let occupationName = occupation.name else { return }
                selectAreaMenu.append(UIAction(title: occupationName , handler: handler))
                button.setMenuForButton(selectAreaMenu)
            }
            
        }
        
        
    }
    
    func workRegimeMenu(label: UILabel, button: UIButton) {
        
        networkManager.getDataArray(endpoint: .usersWorkModels) { (workModels: [WorkModels]?) in
            
            var workRegimeMenu: [UIAction] = []
            
            guard let workModels = workModels else {
                return
            }
            
            let handler = { (action: UIAction) in
                label.text = action.title
            }
            
            for workModel in workModels {
                guard let workModelName = workModel.name else { return }
                workRegimeMenu.append(UIAction(title: workModelName , handler: handler))
                button.setMenuForButton(workRegimeMenu)
            }
            
        }
    }
}
