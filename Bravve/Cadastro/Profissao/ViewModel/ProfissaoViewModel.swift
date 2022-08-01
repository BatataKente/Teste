//
//  ProfissaoViewModel.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class ProfessionViewModel {
    
    func selectAreaMenu(_ handler: @escaping UIActionHandler) -> [UIAction] {
            
            var menuSelectArea: [UIAction] = []
            for i in 1...10 {
                menuSelectArea.append(UIAction(title: "Trabalho \(i)" , handler: handler))
            }
            return menuSelectArea
        }
    
    func workRegimeMenu(_ handler: @escaping UIActionHandler) -> [UIAction] {
            
        var menuWorkRegime: [UIAction] = []
        
        menuWorkRegime.append(UIAction(title: "Home Office", handler: handler))
        menuWorkRegime.append(UIAction(title: "Híbrido", handler: handler))
        menuWorkRegime.append(UIAction(title: "Presencial" , handler: handler))
        return menuWorkRegime
    }
}
