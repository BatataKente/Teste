//
//  CancelReservationCell.swift
//  Bravve
//
//  Created by user208023 on 8/1/22.
//

import UIKit

protocol MyBookingCustomCellDelegate: AnyObject {
    
    func presentViewController(_ viewController: UIViewController)
}

class MyBookingCustomCell: UITableViewCell {
    
    weak var delegate: MyBookingCustomCellDelegate?
    
    private let cellView: UIView = {
        
        let cellView = UIView()
        cellView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        cellView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        
        return cellView
    }()
    
    private let typeTagLabel: UILabel = {
        
        let typeTagLabel = UILabel()
        typeTagLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        typeTagLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        typeTagLabel.textAlignment = .center
        
        return typeTagLabel
    }()
    
    private let topTitleLabel: UILabel = {
        
        let topTitleLabel = UILabel()
        topTitleLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        topTitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        
        return topTitleLabel
    }()
    
    private let bottomTitleLabel: UILabel = {
        
        let bottomTitleLabel = UILabel()
        bottomTitleLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        bottomTitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        
        return bottomTitleLabel
    }()
    
    private let spaceImage: UIImageView = {
        
        let spaceImage = UIImageView()
        spaceImage.contentMode = .scaleAspectFill
        
        return spaceImage
    }()
    
    let spaceNameLabel: UILabel = {
        
        let spaceNameLabel = UILabel()
        spaceNameLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        spaceNameLabel.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        
        return spaceNameLabel
    }()
    
    private let reservedLabel: UILabel = {
        
        let reservedLabel = UILabel()
        reservedLabel.backgroundColor = UIColor(named: "reserved")
        reservedLabel.textColor = .white
        reservedLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        reservedLabel.textAlignment = .center
        
        return reservedLabel
    }()
    
    private let spaceSubtitleLabel: UILabel = {
        
        let spaceSubtitleLabel = UILabel()
        spaceSubtitleLabel.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        spaceSubtitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        
        return spaceSubtitleLabel
    }()
    
    private let locationLabel: UILabel = {
        
        let locationLabel = UILabel()
        locationLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        locationLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return locationLabel
    }()
    
    private let dateLabel: UILabel = {
        
        let dateLabel = UILabel()
        dateLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        dateLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return dateLabel
    }()
    
    private let hourLabel: UILabel = {
        
        let hourLabel = UILabel()
        hourLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        hourLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return hourLabel
    }()
    
    private let spaceTypeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return label
    }()
    
    private lazy var locationInfoStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [locationLabel, dateLabel, hourLabel, spaceTypeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let arrowButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowPink.rawValue), for: .normal)
        button.contentMode = .scaleToFill
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        
        cellView.addSubviews([typeTagLabel, topTitleLabel, bottomTitleLabel, spaceImage, spaceNameLabel, reservedLabel, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        setupConstraints()
        
        arrowButton.addTarget(self, action: #selector(actionArrowButton),
                              for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        typeTagLabel.text = "BOXOFFICE"
        typeTagLabel.backgroundColor = UIColor(named: "boxOffice")
        topTitleLabel.text = "Numa esquina"
        bottomTitleLabel.text = "charmosa, um hotel"
        spaceImage.image = UIImage(named: "imageReservs")
        spaceNameLabel.text = "Hotel Saint"
        reservedLabel.text = "RESERVADO"
        spaceSubtitleLabel.text = "UM Coffee Co."
        locationLabel.text = "São Paulo / Jardim Paulistano"
        dateLabel.text = "21/01/2022 - 22/01/2022"
        hourLabel.text = "9h às 18h"
    }
    
    @objc func actionArrowButton() {
        
        self.delegate?.presentViewController(BookingDetailsView())
    }
    
    private func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.leading, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.trailing, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.bottom, contentView,
                                    CGFloat(20).generateSizeForScreen)
        
        typeTagLabel.constraintInsideTo(.top, cellView)
        typeTagLabel.constraintInsideTo(.leading, cellView,
                                        CGFloat(17).generateSizeForScreen)
        
        topTitleLabel.constraintOutsideTo(.top, typeTagLabel,
                                          CGFloat(23).generateSizeForScreen)
        topTitleLabel.constraintInsideTo(.leading, cellView,
                                         CGFloat(17).generateSizeForScreen)
        
        bottomTitleLabel.constraintOutsideTo(.top, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.leading, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.width, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.height, topTitleLabel)
        
        spaceImage.constraintOutsideTo(.top, bottomTitleLabel,
                                       CGFloat(22).generateSizeForScreen)
        spaceImage.constraintInsideTo(.leading, bottomTitleLabel)
        spaceImage.constraintInsideTo(.trailing, cellView)
        spaceImage.constraintInsideTo(.height, cellView, multiplier: 0.39)
        
        spaceNameLabel.constraintOutsideTo(.top, spaceImage,
                                           CGFloat(23).generateSizeForScreen)
        spaceNameLabel.constraintInsideTo(.leading, spaceImage)
        
        reservedLabel.constraintOutsideTo(.top, spaceImage,
                                          CGFloat(32).generateSizeForScreen)
        reservedLabel.constraintInsideTo(.trailing, cellView,
                                         CGFloat(26).generateSizeForScreen)
        
        spaceSubtitleLabel.constraintOutsideTo(.top, spaceNameLabel,
                                               CGFloat(8).generateSizeForScreen)
        spaceSubtitleLabel.constraintInsideTo(.leading, spaceNameLabel)
        
        locationInfoStackView.constraintOutsideTo(.top, spaceSubtitleLabel,
                                                  CGFloat(9).generateSizeForScreen)
        locationInfoStackView.constraintInsideTo(.leading, spaceSubtitleLabel)
        locationInfoStackView.constraintInsideTo(.bottom, cellView,
                                                 CGFloat(23).generateSizeForScreen)
        
        arrowButton.constraintInsideTo(.trailing, cellView,
                                       CGFloat(25).generateSizeForScreen)
        arrowButton.constraintInsideTo(.bottom, cellView,
                                       CGFloat(18).generateSizeForScreen)
    }
}

