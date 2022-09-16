//
//  ReservaWorkPassViewModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 29/07/22.
//

import Foundation
import UIKit
class WorkpassViewModel {
    
    //MARK: - var and let
    var arrayFirstLabel = ["Cartão de Crédito","Foursys","Bravve"]
    var arraySecoundLabel = ["Conta pessoal","Workpass","Workpass"]
    var arrayStackView = ["","490","490"]
  
     //MARK: - numberRows
    func numberRows(spacedetail:SpaceDetail?) -> Int {
        
         var controlInt: Int
         guard let spaceReturn = spacedetail?.allow_workpass else {
             print("Error guardlet spaceReturn")
             return 1
         }
         print("teste",spacedetail)
         if spaceReturn == true {
             controlInt = arrayFirstLabel.count
         }else {
             controlInt = 1
         }
         print("teste",controlInt)
         return controlInt
         
     }
     
 }
