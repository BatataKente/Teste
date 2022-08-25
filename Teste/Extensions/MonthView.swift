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
        
        buttonLeft.isEnabled = false
    }
    
    @objc func btnLeftRightAction(_ sender: UIButton) {
        
        if sender == buttonRight {
            
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {

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
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        
        self.addSubview(buttonRight)
        buttonRight.topAnchor.constraint(equalTo: topAnchor).isActive=true
        buttonRight.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        buttonRight.widthAnchor.constraint(equalToConstant: 50).isActive=true
        buttonRight.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
        self.addSubview(buttonLeft)
        buttonLeft.topAnchor.constraint(equalTo: topAnchor).isActive=true
        buttonLeft.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        buttonLeft.widthAnchor.constraint(equalToConstant: 50).isActive=true
        buttonLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
    }
    
    let lblName: UILabel = {
        
        let lbl = UILabel()
        lbl.text = "Default Month Year text"
        lbl.textColor = Style.monthViewLblColor
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    lazy var buttonRight: UIButton = {
        
        let buttonRight = UIButton()
        buttonRight.setTitle(">", for: .normal)
        buttonRight.setTitleColor(Style.monthViewBtnRightColor, for: .normal)
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.addTarget(self,
                              action: #selector(btnLeftRightAction), for: .touchUpInside)
        return buttonRight
    }()
    
    lazy var buttonLeft: UIButton = {
        
        let buttonLeft = UIButton()
        buttonLeft.setTitle("<", for: .normal)
        buttonLeft.setTitleColor(Style.monthViewBtnLeftColor, for: .normal)
        buttonLeft.translatesAutoresizingMaskIntoConstraints=false
        buttonLeft.addTarget(self,
                      action: #selector(btnLeftRightAction), for: .touchUpInside)
        buttonLeft.setTitleColor(UIColor.lightGray, for: .disabled)
        return buttonLeft
    }()
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
