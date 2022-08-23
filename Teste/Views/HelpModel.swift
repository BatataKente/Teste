//
//  FAQCollectionCellViewModel.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import UIKit

struct HelpModel {
    
    let question: String
    let answer: NSAttributedString
    
    init(question: String, answer: String){
        self.question = question
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        self.answer = NSAttributedString(string: answer, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}



