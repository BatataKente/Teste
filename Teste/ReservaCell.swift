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
        label.backgroundColor = UIColor(red: 0.467, green: 0.718, blue: 0.341, alpha: 1)
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Numa esquina"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "charmosa, um hotel"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Bravve-ReservaImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let spaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hotel Saint"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reservedLabel: UILabel = {
        let label = UILabel()
        label.text = "RESERVADO"
        label.backgroundColor = UIColor(red: 0.914, green: 0.18, blue: 0.984, alpha: 1)
        label.textColor = .white
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let spaceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "UM Coffee Co."
        label.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "São Paulo / Jardim Paulistano"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "21/01/2022 - 22/01/2022"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.text = "9h às 18h"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(red: 0.016, green: 0, blue: 0.369, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Light", size: 13)
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
        button.setImage(UIImage(named: "arrowPink"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 0.721, green: 0.721, blue: 0.721, alpha: 1)

        
        cellView.addSubview(typeTagLabel)
        cellView.addSubview(topTitleLabel)
        cellView.addSubview(bottomTitleLabel)
        cellView.addSubview(spaceImage)
        cellView.addSubview(spaceNameLabel)
        cellView.addSubview(reservedLabel)
        cellView.addSubview(spaceSubtitleLabel)
        cellView.addSubview(locationInfoStackView)
        cellView.addSubview(arrowButton)
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26),
            
            typeTagLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            typeTagLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 17),
            typeTagLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.2267),
            typeTagLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.046),
            
            topTitleLabel.topAnchor.constraint(equalTo: typeTagLabel.bottomAnchor, constant: 23),
            topTitleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 17),
            topTitleLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.6417),
            topTitleLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.06),
            
            bottomTitleLabel.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor),
            bottomTitleLabel.leadingAnchor.constraint(equalTo: topTitleLabel.leadingAnchor),
            bottomTitleLabel.widthAnchor.constraint(equalTo: topTitleLabel.widthAnchor),
            bottomTitleLabel.heightAnchor.constraint(equalTo: topTitleLabel.heightAnchor),
            
            spaceImage.topAnchor.constraint(equalTo: bottomTitleLabel.bottomAnchor, constant: 22),
            spaceImage.leadingAnchor.constraint(equalTo: bottomTitleLabel.leadingAnchor),
            spaceImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            spaceImage.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.39),
            
            spaceNameLabel.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: 23),
            spaceNameLabel.leadingAnchor.constraint(equalTo: spaceImage.leadingAnchor),
            spaceNameLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.5),
            spaceNameLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.046),
            
            reservedLabel.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: 32),
            reservedLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -26),
            reservedLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.241),
            reservedLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.0462),
            
            spaceSubtitleLabel.topAnchor.constraint(equalTo: spaceNameLabel.bottomAnchor, constant: 8),
            spaceSubtitleLabel.leadingAnchor.constraint(equalTo: spaceNameLabel.leadingAnchor),
            spaceSubtitleLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.358),
            spaceSubtitleLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.028),
            
            locationInfoStackView.topAnchor.constraint(equalTo: spaceSubtitleLabel.bottomAnchor, constant: 9),
            locationInfoStackView.leadingAnchor.constraint(equalTo: spaceSubtitleLabel.leadingAnchor),
            locationInfoStackView.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.507),
            locationInfoStackView.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.160),
            
            arrowButton.topAnchor.constraint(equalTo: reservedLabel.bottomAnchor, constant: 69),
            arrowButton.trailingAnchor.constraint(equalTo: reservedLabel.trailingAnchor, constant: -10)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
