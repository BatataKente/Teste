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
        view.layer.cornerRadius = CGFloat(19).generateSizeForScreen
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
        label.text = " RESERVADO "
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
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
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
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-26).generateSizeForScreen),
            
            typeTagLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            typeTagLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            
            topTitleLabel.topAnchor.constraint(equalTo: typeTagLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            topTitleLabel.leadingAnchor.constraint(equalTo: typeTagLabel.leadingAnchor),
            
            bottomTitleLabel.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor),
            bottomTitleLabel.leadingAnchor.constraint(equalTo: topTitleLabel.leadingAnchor),
            
            spaceImage.topAnchor.constraint(equalTo: bottomTitleLabel.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            spaceImage.leadingAnchor.constraint(equalTo: bottomTitleLabel.leadingAnchor),
            spaceImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            spaceImage.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.39),
            
            spaceNameLabel.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: CGFloat(23).generateSizeForScreen),
            spaceNameLabel.leadingAnchor.constraint(equalTo: spaceImage.leadingAnchor),
            
            reservedLabel.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: CGFloat(32).generateSizeForScreen),
            reservedLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: CGFloat(-22).generateSizeForScreen),
            reservedLabel.heightAnchor.constraint(equalToConstant: CGFloat(23).generateSizeForScreen),
            
            spaceSubtitleLabel.topAnchor.constraint(equalTo: spaceNameLabel.bottomAnchor, constant: CGFloat(8).generateSizeForScreen),
            spaceSubtitleLabel.leadingAnchor.constraint(equalTo: spaceNameLabel.leadingAnchor),
            
            locationInfoStackView.topAnchor.constraint(equalTo: spaceSubtitleLabel.bottomAnchor, constant: CGFloat(9).generateSizeForScreen),
            locationInfoStackView.leadingAnchor.constraint(equalTo: spaceSubtitleLabel.leadingAnchor),
            locationInfoStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: CGFloat(-30).generateSizeForScreen),
            
            arrowButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: CGFloat(-27).generateSizeForScreen),
            arrowButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: CGFloat(-18).generateSizeForScreen),
        ])
    }
}
