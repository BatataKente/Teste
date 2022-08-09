//
//  Reservas2.swift
//  Bravve
//
//  Created by user208023 on 8/4/22.
//

import UIKit

class Reservas2: UIViewController {
    
    private let navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let navBarBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImagesBravve.imageReservsNav.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backBarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let siteNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let partnerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do local parceiro"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var navBarLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [siteNameLabel, partnerNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    private let cardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.creditGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.calendarGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let pencilButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.pencilBlue.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let revisionLabel: UILabel = {
        let label = UILabel()
        label.text = "Revisão"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(14).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paymentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.creditGray.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cardButton, calendarButton, pencilButton, revisionLabel, paymentButton])
        stackView.distribution = .equalSpacing
        stackView.spacing = CGFloat(7).generateSizeForScreen
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let revisionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Revisão"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Detalhes do local"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationIcon: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: ButtonsBravve.locationPink.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Av. São João, Cj. Boulevard, nº 900, São Paulo. \nSP 06020-010,BR"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [locationIcon, addressLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = CGFloat(8).generateSizeForScreen
        return stackView
    }()
    
    private let locationStackViewSeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Resumo da reserva"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dailyLabel: UILabel = {
        let label = UILabel()
        label.text = "Diária:"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(11).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "02 diárias"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "Horas avulsas:"
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(11).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfHoursLabel: UILabel = {
        let label = UILabel()
        label.text = "02 horas"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconsBravve.pencilBlue.rawValue), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let summarySeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstDateLabel: UILabel = {
        let label = UILabel()
        label.text = "21-01-2022"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let clockIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(named: IconsBravve.clock.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return  imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00  -   09:00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 90,00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let clockIconReserv2: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(named: IconsBravve.clock.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return  imageView
    }()
    
    private let timeLabelReserv2: UILabel = {
        let label = UILabel()
        label.text = "14:00  -   15:00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabelReserv2: UILabel = {
        let label = UILabel()
        label.text = "R$ 60,00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateSeparator: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondDateLabel: UILabel = {
        let label = UILabel()
        label.text = "22-01-2022"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondDateClockIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(named: IconsBravve.clock.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return  imageView
    }()
    
    private let secondDateTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00  -   19:00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondDateCostLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 200,00"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmReservationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar Reserva", for: .normal)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(16).generateSizeForScreen)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        navBarView.addSubviews([navBarBackgroundImageView, backBarButton, navBarLabelStackView])
        view.addSubviews([navBarView, buttonStackView, revisionTitleLabel, locationDetailLabel, locationStackView, locationStackViewSeparator, summaryTitleLabel, dailyLabel, numberOfDaysLabel, hoursLabel, numberOfHoursLabel, editButton, summarySeparator, firstDateLabel, clockIcon, timeLabel, costLabel, clockIconReserv2, timeLabelReserv2, costLabelReserv2, dateSeparator, secondDateLabel, secondDateClockIcon, secondDateTimeLabel, secondDateCostLabel, confirmReservationButton])
        
        NSLayoutConstraint.activate([
        
            navBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navBarView.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: CGFloat(153).generateSizeForScreen),
            
            navBarBackgroundImageView.topAnchor.constraint(equalTo: navBarView.topAnchor),
            navBarBackgroundImageView.widthAnchor.constraint(equalTo: navBarView.widthAnchor),
            navBarBackgroundImageView.heightAnchor.constraint(equalTo: navBarView.heightAnchor),
            
            backBarButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
            backBarButton.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: CGFloat(32).generateSizeForScreen),
            backBarButton.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
            backBarButton.widthAnchor.constraint(equalToConstant: CGFloat(8.48).generateSizeForScreen),
            
            navBarLabelStackView.topAnchor.constraint(equalTo: backBarButton.bottomAnchor, constant: CGFloat(12).generateSizeForScreen),
            navBarLabelStackView.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor),
            navBarLabelStackView.widthAnchor.constraint(equalToConstant: CGFloat(168).generateSizeForScreen),
            navBarLabelStackView.heightAnchor.constraint(equalToConstant: CGFloat(40).generateSizeForScreen),
            
            buttonStackView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalToConstant: CGFloat(191).generateSizeForScreen),
            buttonStackView.heightAnchor.constraint(equalToConstant: CGFloat(27).generateSizeForScreen),
            
            revisionTitleLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: CGFloat(14).generateSizeForScreen),
            revisionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            
            locationDetailLabel.topAnchor.constraint(equalTo: revisionTitleLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            locationDetailLabel.leadingAnchor.constraint(equalTo: revisionTitleLabel.leadingAnchor),
            
            locationIcon.widthAnchor.constraint(equalToConstant: CGFloat(10.49).generateSizeForScreen),
            locationIcon.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
            
            locationStackView.topAnchor.constraint(equalTo: locationDetailLabel.bottomAnchor, constant: CGFloat(19)),
            locationStackView.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor),
            locationStackView.widthAnchor.constraint(equalToConstant: CGFloat(334).generateSizeForScreen),
            locationStackView.heightAnchor.constraint(equalToConstant: CGFloat(28).generateSizeForScreen),
            
            locationStackViewSeparator.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            locationStackViewSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            locationStackViewSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-24).generateSizeForScreen),
            locationStackViewSeparator.heightAnchor.constraint(equalToConstant: CGFloat(1).generateSizeForScreen),
            
            summaryTitleLabel.topAnchor.constraint(equalTo: locationStackViewSeparator.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            summaryTitleLabel.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor),
            
            dailyLabel.topAnchor.constraint(equalTo: summaryTitleLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            dailyLabel.leadingAnchor.constraint(equalTo: summaryTitleLabel.leadingAnchor),
            
            numberOfDaysLabel.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: CGFloat(8).generateSizeForScreen),
            numberOfDaysLabel.leadingAnchor.constraint(equalTo: dailyLabel.leadingAnchor, constant: CGFloat(50).generateSizeForScreen),
            
            hoursLabel.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: CGFloat(34).generateSizeForScreen),
            hoursLabel.leadingAnchor.constraint(equalTo: dailyLabel.leadingAnchor),
            
            numberOfHoursLabel.topAnchor.constraint(equalTo: hoursLabel.bottomAnchor, constant: CGFloat(8).generateSizeForScreen),
            numberOfHoursLabel.leadingAnchor.constraint(equalTo: hoursLabel.leadingAnchor, constant: CGFloat(50).generateSizeForScreen),
            
            editButton.topAnchor.constraint(equalTo: summaryTitleLabel.bottomAnchor, constant: CGFloat(48.5).generateSizeForScreen),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-41.5).generateSizeForScreen),
            editButton.widthAnchor.constraint(equalToConstant: CGFloat(27).generateSizeForScreen),
            editButton.heightAnchor.constraint(equalToConstant: CGFloat(27).generateSizeForScreen),
            
            summarySeparator.topAnchor.constraint(equalTo: numberOfHoursLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            summarySeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            summarySeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-24).generateSizeForScreen),
            summarySeparator.heightAnchor.constraint(equalToConstant: CGFloat(1).generateSizeForScreen),
            
            firstDateLabel.topAnchor.constraint(equalTo: summarySeparator.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            firstDateLabel.leadingAnchor.constraint(equalTo: summarySeparator.leadingAnchor),
            firstDateLabel.widthAnchor.constraint(equalToConstant: CGFloat(326).generateSizeForScreen),
            
            clockIcon.topAnchor.constraint(equalTo: firstDateLabel.bottomAnchor, constant: CGFloat(21.5).generateSizeForScreen),
            clockIcon.leadingAnchor.constraint(equalTo: firstDateLabel.leadingAnchor),
            clockIcon.widthAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            clockIcon.heightAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            
            timeLabel.topAnchor.constraint(equalTo: costLabel.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: clockIcon.trailingAnchor, constant: CGFloat(135).generateSizeForScreen),
            timeLabel.widthAnchor.constraint(equalToConstant: CGFloat(107).generateSizeForScreen),
            
            costLabel.topAnchor.constraint(equalTo: firstDateLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            costLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: CGFloat(8).generateSizeForScreen),
            costLabel.widthAnchor.constraint(equalToConstant: CGFloat(66).generateSizeForScreen),
            
            clockIconReserv2.topAnchor.constraint(equalTo: clockIcon.bottomAnchor, constant: CGFloat(24).generateSizeForScreen),
            clockIconReserv2.leadingAnchor.constraint(equalTo: firstDateLabel.leadingAnchor),
            clockIconReserv2.widthAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            clockIconReserv2.heightAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            
            timeLabelReserv2.topAnchor.constraint(equalTo: costLabelReserv2.topAnchor),
            timeLabelReserv2.leadingAnchor.constraint(equalTo: clockIconReserv2.trailingAnchor, constant: CGFloat(135).generateSizeForScreen),
            timeLabelReserv2.widthAnchor.constraint(equalToConstant: CGFloat(107).generateSizeForScreen),
            
            costLabelReserv2.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            costLabelReserv2.leadingAnchor.constraint(equalTo: timeLabelReserv2.trailingAnchor, constant: CGFloat(8).generateSizeForScreen),
            costLabelReserv2.widthAnchor.constraint(equalToConstant: CGFloat(66).generateSizeForScreen),
            
            dateSeparator.topAnchor.constraint(equalTo: timeLabelReserv2.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            dateSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            dateSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-24).generateSizeForScreen),
            dateSeparator.heightAnchor.constraint(equalToConstant: CGFloat(1).generateSizeForScreen),
            
            secondDateLabel.topAnchor.constraint(equalTo: dateSeparator.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            secondDateLabel.leadingAnchor.constraint(equalTo: firstDateLabel.leadingAnchor),
            
            secondDateClockIcon.topAnchor.constraint(equalTo: secondDateLabel.bottomAnchor, constant: CGFloat(21.5).generateSizeForScreen),
            secondDateClockIcon.leadingAnchor.constraint(equalTo: secondDateLabel.leadingAnchor),
            secondDateClockIcon.heightAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            secondDateClockIcon.widthAnchor.constraint(equalToConstant: CGFloat(10).generateSizeForScreen),
            
            secondDateTimeLabel.topAnchor.constraint(equalTo: secondDateCostLabel.topAnchor),
            secondDateTimeLabel.leadingAnchor.constraint(equalTo: secondDateClockIcon.trailingAnchor, constant: CGFloat(135).generateSizeForScreen),
            secondDateTimeLabel.widthAnchor.constraint(equalToConstant: CGFloat(107).generateSizeForScreen),
            
            secondDateCostLabel.topAnchor.constraint(equalTo: secondDateLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            secondDateCostLabel.leadingAnchor.constraint(equalTo: secondDateTimeLabel.trailingAnchor, constant: CGFloat(8).generateSizeForScreen),
            secondDateCostLabel.widthAnchor.constraint(equalToConstant: CGFloat(66).generateSizeForScreen),
            
            confirmReservationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            confirmReservationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            confirmReservationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            confirmReservationButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
            
        ])
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

