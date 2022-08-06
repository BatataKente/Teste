//
//  HomeAbertaTableViewCell.swift
//  Bravve
//
//  Created by Josicleison on 29/07/22.
//

import UIKit

class HomeOpenTableViewCell: UITableViewCell {
    
    var delegate: HomeOpenTableViewCellProtocol?
    
    private lazy var viewElements: (view: UIView,
                                    titleLabel: UILabel,
                                    descriptionLabel: UILabel,
                                    photoView: UIImageView,
                                    nameLabel: UILabel,
                                    subNameLabel: UILabel,
                                    priceLabel: UILabel,
                                    detailsLabel: UILabel) = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(titleLabel)
        titleLabelView.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        descriptionLabel.font = UIFont(name: FontsBravve.regular.rawValue,
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
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 12
        
        photoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                size: CGFloat(20).generateSizeForScreen)
        nameLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        
        let subNameLabel = UILabel()
        subNameLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                size: CGFloat(12).generateSizeForScreen)
        
        let priceLabel = UILabel()
        priceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                 size: CGFloat(12).generateSizeForScreen)
        priceLabel.textColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        let detailsLabel = UILabel()
        detailsLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                   size: CGFloat(13).generateSizeForScreen)
        detailsLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        detailsLabel.numberOfLines = 0
        
        let detailsButton = UIButton()
        detailsButton.setImage(UIImage(named: "arrowPink"), for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.addTarget(self,
                                action: #selector(showDetails),
                                for: .touchUpInside)
        
        view.addSubviews([titleLabelView, descriptionLabel, detailsButton, photoView, nameLabel, subNameLabel, priceLabel, detailsLabel])
        
        titleLabelView.constraintInsideTo(.top, view)
        titleLabelView.constraintInsideTo(.leading, view, 21)
        titleLabel.constraintInsideTo(.top, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.leading, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.trailing, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.bottom, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)

        descriptionLabel.constraintOutsideTo(.top, titleLabelView, 23)
        descriptionLabel.constraintInsideTo(.leading, titleLabelView)
        descriptionLabel.constraintInsideTo(.width, view, multiplier: 0.6)

        photoView.constraintOutsideTo(.top, descriptionLabel, 22)
        photoView.constraintInsideTo(.leading, descriptionLabel)
        photoView.constraintInsideTo(.trailing, view)
        photoView.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)

        nameLabel.constraintOutsideTo(.top, photoView, 23)
        nameLabel.constraintInsideTo(.leading, photoView)

        priceLabel.constraintOutsideTo(.top, photoView, 23)
        priceLabel.constraintInsideTo(.trailing, photoView, 18)

        subNameLabel.constraintOutsideTo(.top, nameLabel, 8)
        subNameLabel.constraintInsideTo(.leading, nameLabel)

        detailsLabel.constraintOutsideTo(.top, subNameLabel, 19)
        detailsLabel.constraintInsideTo(.leading, nameLabel)
        detailsLabel.constraintInsideTo(.bottom, view, 33)

        detailsButton.constraintInsideTo(.trailing, view, 27)
        detailsButton.constraintInsideTo(.bottom, view, 19)
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
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
        
        contentView.addSubview(viewElements.view)
        contentView.setToDefaultBackgroundColor()
    }
    
    func setupConstraints() {
        
        viewElements.view.constraintInsideTo(.top, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.leading, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.trailing, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.bottom, contentView.safeAreaLayoutGuide)
    }
    
    func setup(_ cellInfo: ReserveData) {
        
        viewElements.titleLabel.text = cellInfo.title
        viewElements.descriptionLabel.text = cellInfo.description
        viewElements.photoView.image = cellInfo.image
        viewElements.nameLabel.text = cellInfo.name
        viewElements.subNameLabel.text = cellInfo.subName
        viewElements.priceLabel.text = cellInfo.price
        viewElements.detailsLabel.text = cellInfo.details
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace()
    }
}

protocol HomeOpenTableViewCellProtocol {
    
    func chosePlace()
}
