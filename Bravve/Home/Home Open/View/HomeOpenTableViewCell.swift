//
//  HomeAbertaTableViewCell.swift
//  Bravve
//
//  Created by Josicleison on 29/07/22.
//

import UIKit

class HomeOpenTableViewCell: UITableViewCell {
    
    var delegate: HomeOpenTableViewCellProtocol?
    
    let viewElements: (view: UIView,
                       titleLabel: UILabel,
                       descriptionLabel: UILabel,
                       detailsButton: UIButton,
                       photoView: UIImageView,
                       nameLabel: UILabel,
                       subNameLabel: UILabel,
                       priceLabel: UILabel,
                       detailsLabel: UILabel) = {
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Numa esquina charmosa, um hotel"
        descriptionLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        descriptionLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                       size: CGFloat(20).generateSizeForScreen)
        descriptionLabel.numberOfLines = 0
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoView = UIImageView()
        photoView.image = UIImage(named: "Example 1")
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 12
        
        photoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                size: CGFloat(20).generateSizeForScreen)
        nameLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        nameLabel.text = "Hotel Saint"
        
        let subNameLabel = UILabel()
        subNameLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                size: CGFloat(12).generateSizeForScreen)
        subNameLabel.text = "UM Coffee Co."
        
        let priceLabel = UILabel()
        priceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                 size: CGFloat(12).generateSizeForScreen)
        priceLabel.textColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        priceLabel.text = "3,50 crédito/ hora"
        
        let detailsLabel = UILabel()
        detailsLabel.text = "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"
        detailsLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                   size: CGFloat(13).generateSizeForScreen)
        detailsLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        detailsLabel.numberOfLines = 0
        
        let detailsButton = UIButton()
        detailsButton.setImage(UIImage(named: "arrowPink"), for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        
        view.addSubviews([titleLabel, descriptionLabel, detailsButton, photoView, nameLabel, subNameLabel, priceLabel, detailsLabel])
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                detailsButton: detailsButton,
                photoView: photoView,
                nameLabel: nameLabel,
                subNameLabel: subNameLabel,
                priceLabel: priceLabel,
                detailsLabel: detailsLabel)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        contentView.addSubviews([viewElements.view])
        contentView.setToDefaultBackgroundColor()
        
        viewElements.detailsButton.addTarget(self,
                                             action: #selector(showDetails),
                                             for: .touchUpInside)
    }
    
    func setupConstraints() {
        
        viewElements.view.constraintInsideTo(.top, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.leading, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.trailing, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.bottom, contentView.safeAreaLayoutGuide)
        
        viewElements.titleLabel.constraintInsideTo(.top, viewElements.view)
        viewElements.titleLabel.constraintInsideTo(.leading, viewElements.view, 21)
        
        viewElements.descriptionLabel.constraintOutsideTo(.top, viewElements.titleLabel, 23)
        viewElements.descriptionLabel.constraintInsideTo(.leading, viewElements.titleLabel)
        viewElements.descriptionLabel.constraintInsideTo(.width,
                                                         viewElements.view,
                                                         multiplier: 0.6)
        
        viewElements.photoView.constraintOutsideTo(.top, viewElements.descriptionLabel, 22)
        viewElements.photoView.constraintInsideTo(.leading, viewElements.descriptionLabel)
        viewElements.photoView.constraintInsideTo(.trailing, viewElements.view)
        viewElements.photoView.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)
        
        viewElements.nameLabel.constraintOutsideTo(.top, viewElements.photoView, 23)
        viewElements.nameLabel.constraintInsideTo(.leading, viewElements.photoView)
        
        viewElements.priceLabel.constraintOutsideTo(.top, viewElements.photoView, 23)
        viewElements.priceLabel.constraintInsideTo(.trailing, viewElements.photoView, 18)
        
        viewElements.subNameLabel.constraintOutsideTo(.top, viewElements.nameLabel, 8)
        viewElements.subNameLabel.constraintInsideTo(.leading, viewElements.nameLabel)
        
        viewElements.detailsLabel.constraintOutsideTo(.top,
                                                      viewElements.subNameLabel,
                                                      19)
        viewElements.detailsLabel.constraintInsideTo(.leading, viewElements.nameLabel)
        viewElements.detailsLabel.constraintInsideTo(.bottom, viewElements.view, 33)
        
        viewElements.detailsButton.constraintInsideTo(.trailing, viewElements.view, 27)
        viewElements.detailsButton.constraintInsideTo(.bottom, viewElements.view, 19)
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace()
    }
}

protocol HomeOpenTableViewCellProtocol {
    
    func chosePlace()
}
