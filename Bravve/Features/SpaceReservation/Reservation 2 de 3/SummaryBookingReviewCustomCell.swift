//
//  BooKingSummaryCustomCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 31/08/22.
//

import Foundation
import UIKit

final class SummaryBookingReviewCustomCell: UITableViewCell {
    
    static let reuseIdSummary: String = "sumaryBookingReviewCell"
    
    //MARK: - summaryLabel
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.numberOfLines = 1
        label.text = "Resumo da reserva"
        
        return label
    }()
    
    
    //MARK: - dailyLabel
    private lazy var dailyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 11)
        label.numberOfLines = 1
        label.text = "Diárias:"
        
        return label
    }()
    
    //MARK: - totalDailyLabel
    private lazy var totalDailyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 16)
        label.numberOfLines = 1
        label.text = "02 diárias"
        
        return label
    }()
    
    //MARK: - hoursLabel
    private lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: 11)
        label.numberOfLines = 1
        label.text = "Horas Avulsas:"
        
        return label
    }()
    
    //MARK: - totalHoursLabel
    private lazy var totalHoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 16)
        label.numberOfLines = 1
        label.text = "02 horas"
        
        return label
    }()
    
    //MARK: - editButton
   private lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: IconsBravve.pencilBlue.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.toEdit), for: .touchUpInside)
        return button
    }()
    
    //MARK: - bottomLine
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([summaryLabel,
                                 dailyLabel,
                                 totalDailyLabel,
                                 hoursLabel,
                                 totalHoursLabel,
                                 editButton,
                                 bottomLine,
                                 
                                ])
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Func toEdit
    @objc func toEdit (sender:UIButton) {
        print("OI")
    }
    
    //MARK: - func configConstraints
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            //MARK: - summaryLabel Constraints
            summaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            summaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            //MARK: - dailyLabel Constraints
            dailyLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 19),
            dailyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            //MARK: - totalDailyLabel Constraints
            totalDailyLabel.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: 8),
            totalDailyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 67),
            
            //MARK: - hoursLabel Constraints
            hoursLabel.topAnchor.constraint(equalTo: totalDailyLabel.bottomAnchor, constant: 8),
            hoursLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            //MARK: - totalHoursLabel Constraints
            totalHoursLabel.topAnchor.constraint(equalTo: hoursLabel.bottomAnchor, constant: 8),
            totalHoursLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 67),
            totalHoursLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
            
            //MARK: - editButton Constraints
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 84.5),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -41.5),
            editButton.heightAnchor.constraint(equalToConstant: 27),
            editButton.widthAnchor.constraint(equalToConstant: 27),
            
            //MARK: - bottomLine Constraints
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
            bottomLine.widthAnchor.constraint(equalToConstant: 334)
        ])
    }
}


