//
//  BookingHistoryCustomCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 24/08/22.
//

import UIKit

protocol BookingHistoryCustomCellDelegate: AnyObject {
    func presentViewController(_ viewController: UIViewController)
}

class BookingHistoryCustomCell: UITableViewCell {
    
    weak var delegate: BookingHistoryCustomCellDelegate?
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        return view
    }()
    
    let typeTagLabel: UILabel = {
        let label = UILabel()
        label.text = "BOXOFFICE"
        label.backgroundColor = UIColor(named: "boxOffice")
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Numa esquina"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "charmosa, um hotel"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageReservs")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let spaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hotel Saint"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reservedLabel: UILabel = {
        let label = UILabel()
        label.text = "RESERVADO"
        label.backgroundColor = UIColor(named: "reserved")
        label.textColor = .white
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "UM Coffee Co."
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "São Paulo / Jardim Paulistano"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "21/01/2022 - 22/01/2022"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.text = "9h às 18h"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, dateLabel, hourLabel, spaceTypeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowPink.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellView.addSubviews([typeTagLabel, topTitleLabel, bottomTitleLabel, spaceImage, spaceNameLabel, reservedLabel, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        contentView.addSubview(cellView)
        
        setupConstraints()
        
        arrowButton.addTarget(self, action: #selector(actionArrowButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionArrowButton() {
        self.delegate?.presentViewController(HistoryDetailsView())
    }
    
    func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView)
        cellView.constraintInsideTo(.leading, contentView)
        cellView.constraintInsideTo(.trailing, contentView)
        cellView.constraintInsideTo(.bottom, contentView,
                                    CGFloat(26).generateSizeForScreen)
        
        typeTagLabel.constraintInsideTo(.top, cellView)
        typeTagLabel.constraintInsideTo(.leading, cellView,
                                        CGFloat(17).generateSizeForScreen)
        
        topTitleLabel.constraintOutsideTo(.top, typeTagLabel,
                                          CGFloat(23).generateSizeForScreen)
        topTitleLabel.constraintInsideTo(.leading, typeTagLabel)
        
        bottomTitleLabel.constraintOutsideTo(.top, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.leading, topTitleLabel)
        
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
                                                 CGFloat(30).generateSizeForScreen)
        
        arrowButton.constraintInsideTo(.trailing, cellView,
                                       CGFloat(27).generateSizeForScreen)
        arrowButton.constraintInsideTo(.bottom, cellView,
                                       CGFloat(18).generateSizeForScreen)
    }
}
