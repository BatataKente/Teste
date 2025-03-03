//
//  CalendarWeekDaysView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 18/08/22.
//

import UIKit

class CalendarWeekdaysView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        
        setupViews()
    }
    
    func setupViews() {
        
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        
        let daysArr = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
        for i in 0..<7 {
            
            let label = UILabel()
            label.text = daysArr[i]
            label.textAlignment = .center
            label.font = UIFont(name: FontsBravve.medium.rawValue, size: 14)
            label.textColor = UIColor(named: ColorsBravve.calendarLabel.rawValue)
            myStackView.addArrangedSubview(label)
        }
    }
    
    let myStackView: UIStackView = {
        
        let stackView=UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints=false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
