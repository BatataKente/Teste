//
//  CalendarMonthView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 18/08/22.
//

import UIKit

protocol CalendarMonthViewDelegate: AnyObject {
    
    func didChangeMonth(monthIndex: Int, year: Int)
}

class CalendarMonthView: UIView {
    
    var monthsArr = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    var delegate: CalendarMonthViewDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
        
        btnLeft.isEnabled = false
    }
    
    @objc func btnLeftRightAction(sender: UIButton) {
        
        if sender == btnRight {
            
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                
                currentMonthIndex = 0
                currentYear += 1
            }
        }
        else {

            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    func setupViews() {
        
        self.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        
        self.addSubview(btnRight)
        btnRight.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnRight.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        btnRight.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        btnLeft.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    let lblName: UILabel = {
        
        let label = UILabel()
        label.text = "Default Month Year text"
        label.textColor = UIColor(named: ColorsBravve.calendarLabel.rawValue)
        label.textAlignment = .center
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let btnRight: UIButton = {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: ButtonsBravve.rightButton.rawValue), for: .normal)
       
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil,
                      action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        return btn
    }()
    
    let btnLeft: UIButton = {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: ButtonsBravve.leftButton.rawValue), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil,
                      action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
