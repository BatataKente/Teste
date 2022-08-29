//
//  HomeAbertaTableViewCell.swift
//  Bravve
//
//  Created by Josicleison on 29/07/22.
//

import UIKit
import SDWebImage

class HomeOpenTableViewCell: UITableViewCell {
    
    struct ViewElements {
        
        let view: UIView,
            titleLabel: UILabel,
            titleLabelView: UIView,
            descriptionLabel: UILabel,
            photoView: UIImageView,
            photoLabel: UILabel,
            photoLabelView: UIView,
            nameLabel: UILabel,
            subNameLabel: UILabel,
            priceLabel: UILabel,
            detailsLabel: UILabel
    }
    
    var delegate: HomeOpenTableViewCellProtocol?
    
    var indexPath: IndexPath = IndexPath()
    
    private lazy var viewElements: ViewElements = {
        
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
        photoLabel.text = "WORKPASS"
        
        let photoLabelView = UIView()
        photoLabelView.addSubview(photoLabel)
        photoLabelView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        photoLabelView.isHidden = true
        
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
                                 size: CGFloat(20).generateSizeForScreen)
        
        let hourPriceLabel = UILabel()
        hourPriceLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
        hourPriceLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                     size: CGFloat(20).generateSizeForScreen)
        hourPriceLabel.text = "3,50"
        
        let priceView: UIView = {
            
            let priceTypeLabel = UILabel()
            priceTypeLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
            priceTypeLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                         size: CGFloat(12).generateSizeForScreen)
            priceTypeLabel.text = "R$"
            
            let hourLabel = UILabel()
            hourLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
            hourLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                    size: CGFloat(12).generateSizeForScreen)
            hourLabel.text = "/hora"
            
            let creditHourLabel = UILabel()
            creditHourLabel.textColor = UIColor(named: ColorsBravve.pink_white.rawValue)
            creditHourLabel.font = UIFont(name: FontsBravve.bold.rawValue,
                                          size: CGFloat(12).generateSizeForScreen)
            creditHourLabel.text = "crédito/hora"
            
            let priceView = UIView()
            priceView.addSubviews([priceTypeLabel, priceLabel, hourLabel, creditHourLabel, hourPriceLabel])
            
            priceLabel.constraintInsideTo(.top, priceView)
            priceLabel.constraintOutsideTo(.leading, priceTypeLabel,
                                           CGFloat(2.5).generateSizeForScreen)
            priceLabel.constraintOutsideTo(.trailing, hourLabel,
                                           CGFloat(2.5).generateSizeForScreen)
            
            priceTypeLabel.constraintInsideTo(.leading, priceView)
            priceTypeLabel.constraintInsideTo(.bottom, priceLabel)
            
            hourLabel.constraintInsideTo(.bottom, priceLabel)
            
            creditHourLabel.constraintOutsideTo(.leading, hourPriceLabel,
                                               CGFloat(2.5).generateSizeForScreen)
            creditHourLabel.constraintInsideTo(.trailing, priceView)
            creditHourLabel.constraintInsideTo(.bottom, priceView)
            
            hourPriceLabel.constraintInsideTo(.leading, priceView)
            hourPriceLabel.constraintInsideTo(.bottom, priceView)
            
            return priceView
        }()
        
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
        
        view.addSubviews([titleLabelView, descriptionLabel, detailsButton, photoView, photoLabelView, nameLabel, subNameLabel, priceView, detailsLabel])
        
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

        priceView.constraintOutsideTo(.top, photoView, CGFloat(20).generateSizeForScreen)
        priceView.constraintInsideTo(.trailing, photoView, CGFloat(20).generateSizeForScreen)
        priceView.heightAnchorInSuperview(CGFloat(50).generateSizeForScreen)

        subNameLabel.constraintOutsideTo(.top, nameLabel, CGFloat(10).generateSizeForScreen)
        subNameLabel.constraintInsideTo(.leading, nameLabel)

        detailsLabel.constraintOutsideTo(.top, subNameLabel, CGFloat(20).generateSizeForScreen)
        detailsLabel.constraintInsideTo(.leading, nameLabel)
        detailsLabel.constraintInsideTo(.bottom, view, CGFloat(30).generateSizeForScreen)

        detailsButton.constraintInsideTo(.trailing, view, CGFloat(30).generateSizeForScreen)
        detailsButton.constraintInsideTo(.bottom, view, CGFloat(20).generateSizeForScreen)
        
        return ViewElements(view: view,
                            titleLabel: titleLabel,
                            titleLabelView: titleLabelView,
                            descriptionLabel: descriptionLabel,
                            photoView: photoView,
                            photoLabel: photoLabel,
                            photoLabelView: photoLabelView,
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
        
        viewElements.view.constraintInsideTo(.top, contentView.safeAreaLayoutGuide, CGFloat(10).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.leading, contentView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.trailing, contentView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        viewElements.view.constraintInsideTo(.bottom, contentView.safeAreaLayoutGuide, CGFloat(10).generateSizeForScreen)
    }
    
    func setup(_ space: Space,_ indexPath: IndexPath) {
        
        viewElements.descriptionLabel.text = space.slogan
        
        guard let pictures = space.space_pictures else { return }
        
        var picture = ""
        
        if pictures.count != 0 {
            guard let pictureSelected = pictures[0].url else { return }
            picture = pictureSelected
        }
        
        viewElements.photoView.sd_setImage(with: URL(string: picture), placeholderImage: UIImage(named: ImagesBravve.homeOpen_1.rawValue))
        viewElements.nameLabel.text = space.local_name
        viewElements.subNameLabel.text = space.description
        viewElements.priceLabel.text = "\(space.hourly_credits ?? "")"
        viewElements.detailsLabel.text = "\(space.partner_site_address?.address?.city_name ?? "")/\(space.partner_site_address?.address?.neighborhood ?? "")\nCapacidade: \(space.seats_qty ?? 0) pessoas\n\(space.space_type?.name ?? "")"
        
        guard let allowWorkpass = space.allow_workpass else {
            return
        }
        
        guard let space_category = space.space_category?.name?.uppercased() else {
            return
        }
        
        viewElements.titleLabel.text = space_category
        viewElements.titleLabelView.backgroundColor = getTitleLabelBackgroundColor(space_category)
        
        
        if allowWorkpass {
            viewElements.photoLabelView.isHidden = false
        } else {
            viewElements.photoLabelView.isHidden = true
        }
        
        self.indexPath = indexPath
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace(indexPath)
    }
}

protocol HomeOpenTableViewCellProtocol {
    
    func chosePlace(_ indexPath: IndexPath)
}
