//
//  ReservaCell.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class ReservaCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let typeTagLabel: UILabel = {
        let label = UILabel()
        label.text = "BOXOFFICE"
        label.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Numa esquina"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "charmosa, um hotel"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImagesBravve.imageReservs_1.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let spaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hotel Saint"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reservedLabel: UILabel = {
        let label = UILabel()
        label.text = "RESERVADO"
        label.backgroundColor = UIColor(named: ColorsBravve.reserved.rawValue)
        label.textColor = .white
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "UM Coffee Co."
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "São Paulo / Jardim Paulistano"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "21/01/2022 - 22/01/2022"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.text = "9h às 18h"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name: FontsBravve.light.rawValue, size: 13)
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
        
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        cellView.addSubviews([typeTagLabel, topTitleLabel, bottomTitleLabel, spaceImage, spaceNameLabel, reservedLabel, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        contentView.addSubview(cellView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView)
        cellView.constraintInsideTo(.leading, contentView)
        cellView.constraintInsideTo(.trailing, contentView)
        cellView.constraintInsideTo(.bottom, contentView, -26)
        
        typeTagLabel.constraintInsideTo(.top, cellView)
        typeTagLabel.constraintInsideTo(.leading, cellView, 17)
        typeTagLabel.constraintInsideTo(.width, cellView, multiplier: 0.2267)
        typeTagLabel.constraintInsideTo(.height, cellView, multiplier: 0.046)
        
        topTitleLabel.constraintOutsideTo(.top, typeTagLabel, 23)
        topTitleLabel.constraintInsideTo(.leading, cellView, 17)
        topTitleLabel.constraintInsideTo(.width, cellView, multiplier: 0.6417)
        topTitleLabel.constraintInsideTo(.height, cellView, multiplier: 0.06)
        
        bottomTitleLabel.constraintOutsideTo(.top, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.leading, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.width, topTitleLabel)
        bottomTitleLabel.constraintInsideTo(.height, topTitleLabel)
        
        spaceImage.constraintOutsideTo(.top, bottomTitleLabel, 22)
        spaceImage.constraintInsideTo(.leading, bottomTitleLabel)
        spaceImage.constraintInsideTo(.trailing, cellView)
        spaceImage.constraintInsideTo(.height, cellView, multiplier: 0.39)
        
        spaceNameLabel.constraintOutsideTo(.top, spaceImage, 23)
        spaceNameLabel.constraintInsideTo(.leading, spaceImage)
        spaceNameLabel.constraintInsideTo(.width, cellView, multiplier: 0.5)
        spaceNameLabel.constraintInsideTo(.height, cellView, multiplier: 0.046)
        
        reservedLabel.constraintOutsideTo(.top, spaceImage, 32)
        reservedLabel.constraintInsideTo(.trailing, cellView, -26)
        reservedLabel.constraintInsideTo(.width, cellView, multiplier: 0.241)
        reservedLabel.constraintInsideTo(.height, cellView, multiplier: 0.0462)
        
        spaceSubtitleLabel.constraintOutsideTo(.top, spaceNameLabel, 8)
        spaceSubtitleLabel.constraintInsideTo(.leading, spaceNameLabel)
        spaceSubtitleLabel.constraintInsideTo(.width, cellView, multiplier: 0.358)
        spaceSubtitleLabel.constraintInsideTo(.height, cellView, multiplier: 0.028)
        
        locationInfoStackView.constraintOutsideTo(.top, spaceSubtitleLabel, 9)
        locationInfoStackView.constraintInsideTo(.leading, spaceSubtitleLabel)
        locationInfoStackView.constraintInsideTo(.width, cellView, multiplier: 0.507)
        locationInfoStackView.constraintInsideTo(.height, cellView, multiplier: 0.16)
        
        arrowButton.constraintOutsideTo(.top, reservedLabel, 69)
        arrowButton.constraintInsideTo(.trailing, reservedLabel, -10)
    }
}
