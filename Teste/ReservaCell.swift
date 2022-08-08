//
//  ReservaCell.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class ReservaCell: UITableViewCell {
    
    private let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let typeTagLabel: UILabel = {
        let label = UILabel()
        label.text = "BOXOFFICE"
        label.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Numa esquina"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "charmosa, um hotel"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spaceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImagesBravve.imageReservs_1.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let spaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hotel Saint"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reservedLabel: UILabel = {
        let label = UILabel()
        label.text = "RESERVADO"
        label.backgroundColor = UIColor(named: ColorsBravve.reserved.rawValue)
        label.textColor = .white
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spaceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "UM Coffee Co."
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "São Paulo / Jardim Paulistano"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "21/01/2022 - 22/01/2022"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hourLabel: UILabel = {
        let label = UILabel()
        label.text = "9h às 18h"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spaceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, dateLabel, hourLabel, spaceTypeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowPink.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        cellView.addSubviews([typeTagLabel, topTitleLabel, bottomTitleLabel, spaceImage, spaceNameLabel, reservedLabel, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        contentView.addSubview(cellView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView)
        cellView.constraintInsideTo(.leading, contentView)
        cellView.constraintInsideTo(.trailing, contentView)
        cellView.constraintInsideTo(.bottom, contentView, CGFloat(-26).generateSizeForScreen)
        
        typeTagLabel.constraintInsideTo(.top, cellView)
        typeTagLabel.constraintInsideTo(.leading, cellView, CGFloat(17).generateSizeForScreen)
        typeTagLabel.widthAnchorInSuperview(CGFloat(68).generateSizeForScreen)
        typeTagLabel.heightAnchorInSuperview(CGFloat(15).generateSizeForScreen)
        
        topTitleLabel.constraintOutsideTo(.top, typeTagLabel, CGFloat(23).generateSizeForScreen)
        topTitleLabel.constraintInsideTo(.leading, cellView, CGFloat(17).generateSizeForScreen)
        topTitleLabel.widthAnchorInSuperview(CGFloat(215).generateSizeForScreen)
        topTitleLabel.heightAnchorInSuperview(CGFloat(30).generateSizeForScreen)
        
        bottomTitleLabel.constraintOutsideTo(.top, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.leading, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.width, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.height, topTitleLabel)
        
        spaceImage.constraintOutsideTo(.top, bottomTitleLabel, CGFloat(22).generateSizeForScreen)
        spaceImage.constraintInsideTo(.leading, bottomTitleLabel)
        spaceImage.constraintInsideTo(.trailing, cellView)
        spaceImage.heightAnchorInSuperview(CGFloat(194).generateSizeForScreen)
        
        spaceNameLabel.constraintOutsideTo(.top, spaceImage, CGFloat(23).generateSizeForScreen)
        spaceNameLabel.constraintInsideTo(.leading, spaceImage)
        spaceNameLabel.widthAnchorInSuperview(CGFloat(167.5).generateSizeForScreen)
        spaceNameLabel.heightAnchorInSuperview(CGFloat(23).generateSizeForScreen)
        
        reservedLabel.constraintOutsideTo(.top, spaceImage, CGFloat(32).generateSizeForScreen)
        reservedLabel.constraintInsideTo(.trailing, cellView, CGFloat(-26).generateSizeForScreen)
        reservedLabel.widthAnchorInSuperview(CGFloat(73).generateSizeForScreen)
        reservedLabel.heightAnchorInSuperview(CGFloat(15).generateSizeForScreen)
        
        spaceSubtitleLabel.constraintOutsideTo(.top, spaceNameLabel, CGFloat(8).generateSizeForScreen)
        spaceSubtitleLabel.constraintInsideTo(.leading, spaceNameLabel)
        spaceSubtitleLabel.widthAnchorInSuperview(CGFloat(79).generateSizeForScreen)
        spaceSubtitleLabel.heightAnchorInSuperview(CGFloat(14).generateSizeForScreen)
        
        locationInfoStackView.constraintOutsideTo(.top, spaceSubtitleLabel, CGFloat(9).generateSizeForScreen)
        locationInfoStackView.constraintInsideTo(.leading, spaceSubtitleLabel)
        locationInfoStackView.widthAnchorInSuperview(CGFloat(170).generateSizeForScreen)
        locationInfoStackView.heightAnchorInSuperview(CGFloat(80).generateSizeForScreen)
        
        arrowButton.constraintOutsideTo(.top, reservedLabel, CGFloat(69).generateSizeForScreen)
        arrowButton.constraintInsideTo(.trailing, reservedLabel, CGFloat(-10).generateSizeForScreen)
    }
}
