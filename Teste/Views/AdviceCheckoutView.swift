
//  avisoViewCheckout.swift
//  Bravve
//
//  Created by user220270 on 8/3/22.
//
import UIKit
import Foundation

class AdviceCheckoutView: UIViewController {
    
    let adviseView = UIView()
    
    private let adviseLabel: UILabel = {

       
        
        let adviseLabel = UILabel()
        adviseLabel.text = "Check out realizado com sucesso.\nObrigado pela preferencia!"
        adviseLabel.translatesAutoresizingMaskIntoConstraints = false
        adviseLabel.font = UIFont(name: "Ubuntu-Bold", size: 20) // FONTE: Ubuntu
        adviseLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        adviseLabel.numberOfLines = 10
        return adviseLabel
    }()
    
    private let adviseButton: UIButton = {
        
        let adviseButton = UIButton()
        adviseButton.setTitle("OK", for: .normal)
        adviseButton.backgroundColor = UIColor (named: ColorsBravve.buttonPink.rawValue)
        adviseButton.translatesAutoresizingMaskIntoConstraints = false
        return adviseButton
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        view.addSubview(adviseButton)
        view.addSubview(adviseLabel)
        view.addSubview(adviseView)
        
    }
    
    private func setupConstraints() {
        
        adviseLabel.constraintInsideTo(.top, view,250)
        adviseLabel.constraintInsideTo(.leading, view, 81)
        adviseLabel.constraintInsideTo(.trailing, view, 81)
        
        adviseButton.constraintInsideTo(.top, view,380)
        adviseButton.constraintInsideTo(.leading, view, 81)
        adviseButton.constraintInsideTo(.trailing, view,81)
        
        
    }
    
    }
