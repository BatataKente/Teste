//
//  HomeAbertaTableViewCell.swift
//  Bravve
//
//  Created by Josicleison on 29/07/22.
//

import UIKit

class HomeOpenTableViewCell: UITableViewCell {
    
    var delegate: HomeOpenTableViewCellProtocol?
    
    var indexPath: IndexPath = IndexPath()
    
    private lazy var viewElements: (view: UIView,
                                    titleLabel: UILabel,
                                    descriptionLabel: UILabel,
                                    photoView: UIImageView,
                                    photoLabel: UILabel,
                                    nameLabel: UILabel,
                                    subNameLabel: UILabel,
                                    priceLabel: UILabel,
                                    detailsLabel: UILabel) = {
        
        let textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        titleLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(titleLabel)
        titleLabelView.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = textColor
        descriptionLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                       size: CGFloat(20).generateSizeForScreen)
        descriptionLabel.numberOfLines = 0
        
        let view = UIView()
        view.setToDefaultBackgroundColor()
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        
        let photoView = UIImageView()
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 12
        
        photoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        let photoLabel = UILabel()
        photoLabel.textColor = .white
        photoLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        
        let photoLabelView = UIView()
        photoLabelView.addSubview(photoLabel)
        photoLabelView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                size: CGFloat(20).generateSizeForScreen)
        nameLabel.textColor = textColor
        
        let subNameLabel = UILabel()
        subNameLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        subNameLabel.font = UIFont(name: FontsBravve.regular.rawValue,
                                size: CGFloat(12).generateSizeForScreen)
        
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        priceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                 size: CGFloat(12).generateSizeForScreen)
        
        let detailsLabel = UILabel()
        detailsLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                   size: CGFloat(13).generateSizeForScreen)
        detailsLabel.textColor = textColor
        detailsLabel.numberOfLines = 0
        
        let detailsButton = UIButton()
        detailsButton.setImage(UIImage(named: "arrowPink"), for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.addTarget(self,
                                action: #selector(showDetails),
                                for: .touchUpInside)
        
        view.addSubviews([titleLabelView, descriptionLabel, detailsButton, photoView, photoLabelView, nameLabel, subNameLabel, priceLabel, detailsLabel])
        
        titleLabelView.constraintInsideTo(.top, view)
        titleLabelView.constraintInsideTo(.leading, view, CGFloat(20).generateSizeForScreen)
        titleLabel.constraintInsideTo(.top, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.leading, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.trailing, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        titleLabel.constraintInsideTo(.bottom, titleLabelView,
                                      CGFloat(2.5).generateSizeForScreen)

        descriptionLabel.constraintOutsideTo(.top, titleLabelView, CGFloat(20).generateSizeForScreen)
        descriptionLabel.constraintInsideTo(.leading, titleLabelView)
        descriptionLabel.constraintInsideTo(.width, view, multiplier: 0.6)
        
        photoView.constraintOutsideTo(.top, descriptionLabel, CGFloat(20).generateSizeForScreen)
        photoView.constraintInsideTo(.leading, descriptionLabel)
        photoView.constraintInsideTo(.trailing, view)
        photoView.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)
        
        photoLabelView.constraintInsideTo(.top, photoView, CGFloat(25).generateSizeForScreen)
        photoLabelView.constraintInsideTo(.leading, photoView, CGFloat(25).generateSizeForScreen)
        photoLabel.constraintInsideTo(.top, photoLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        photoLabel.constraintInsideTo(.leading, photoLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        photoLabel.constraintInsideTo(.trailing, photoLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        photoLabel.constraintInsideTo(.bottom, photoLabelView,
                                      CGFloat(2.5).generateSizeForScreen)
        
        nameLabel.constraintOutsideTo(.top, photoView, CGFloat(20).generateSizeForScreen)
        nameLabel.constraintInsideTo(.leading, photoView)

        priceLabel.constraintOutsideTo(.top, photoView, CGFloat(20).generateSizeForScreen)
        priceLabel.constraintInsideTo(.trailing, photoView, CGFloat(20).generateSizeForScreen)

        subNameLabel.constraintOutsideTo(.top, nameLabel, CGFloat(10).generateSizeForScreen)
        subNameLabel.constraintInsideTo(.leading, nameLabel)

        detailsLabel.constraintOutsideTo(.top, subNameLabel, CGFloat(20).generateSizeForScreen)
        detailsLabel.constraintInsideTo(.leading, nameLabel)
        detailsLabel.constraintInsideTo(.bottom, view, CGFloat(30).generateSizeForScreen)

        detailsButton.constraintInsideTo(.trailing, view, CGFloat(30).generateSizeForScreen)
        detailsButton.constraintInsideTo(.bottom, view, CGFloat(20).generateSizeForScreen)
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                photoView: photoView,
                photoLabel: photoLabel,
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
        
        viewElements.view.constraintInsideTo(.top, contentView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.leading, contentView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.trailing, contentView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.bottom, contentView.safeAreaLayoutGuide)
    }
    
    func setup(_ cellInfo: ReserveData) {
        
        viewElements.titleLabel.text = cellInfo.title
        viewElements.descriptionLabel.text = cellInfo.description
        viewElements.photoView.image = cellInfo.image
        viewElements.photoLabel.text = cellInfo.photoTitle
        viewElements.nameLabel.text = cellInfo.name
        viewElements.subNameLabel.text = cellInfo.subName
        viewElements.priceLabel.text = cellInfo.price
        viewElements.detailsLabel.text = cellInfo.details
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace(indexPath)
    }
}

protocol HomeOpenTableViewCellProtocol {
    
    func chosePlace(_ indexPath: IndexPath)
}
