//
//  HomeAbertaTableViewCell.swift
//  Bravve
//
//  Created by Josicleison on 29/07/22.
//

import UIKit
import SDWebImage

class HomeClosedTableViewCell: UITableViewCell {
    
    struct ViewElements {
        
        let view: UIView,
            spaceCategoryLabel: UILabel,
            titleLabelView: UIView,
            sloganLabel: UILabel,
            photoView: UIImageView,
            photoLabel: UILabel,
            photoLabelView: UIView,
            localNameLabel: UILabel,
            descriptionLabel: UILabel,
            hourlyCreditsLabel: UILabel,
            addressLabel: UILabel
    }
    
    var delegate: HomeClosedTableViewCellProtocol?
    
    var id: Int? = nil
    
    private lazy var viewElements: ViewElements = {
        
        let spaceCategoryLabel = createLabel(color: .blue,
                                     UIFont(name: FontsBravve.light.rawValue,
                                            size: CGFloat(13).generateSizeForScreen))
        
        let titleLabelView = UIView()
        titleLabelView.addSubview(spaceCategoryLabel)
        titleLabelView.backgroundColor = UIColor(named: ColorsBravve.boxOffice.rawValue)
        
        let sloganLabel = createLabel(UIFont(name: FontsBravve.regular.rawValue,
                                                  size: CGFloat(20).generateSizeForScreen))
        
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
        
        let photoLabel = createLabel(text: "WORKPASS",
                                     color: .textField,
                                     UIFont(name: FontsBravve.light.rawValue,
                                            size: CGFloat(13).generateSizeForScreen))
        
        let photoLabelView = UIView()
        photoLabelView.addSubview(photoLabel)
        photoLabelView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        photoLabelView.isHidden = true
        
        let localNameLabel = createLabel()
        
        let descriptionLabel = createLabel(color: .label,
                                       UIFont(name: FontsBravve.regular.rawValue,
                                              size: CGFloat(12).generateSizeForScreen))
        
        let hourlyCreditsLabel = createLabel(color: .pink_white)
        
        let hourPriceLabel = createLabel(text: "3,50",color: .pink_white)
        
        let priceView: UIView = {
            
            let priceTypeLabel = createLabel(text: "R$",
                                             color: .pink_white,
                                             UIFont(name: FontsBravve.bold.rawValue,
                                                                          size: CGFloat(12).generateSizeForScreen))
            
            let hourLabel = createLabel(text: "/hora",
                                        color: .pink_white,
                                        UIFont(name: FontsBravve.bold.rawValue,
                                                                     size: CGFloat(12).generateSizeForScreen))
            
            let creditHourLabel = createLabel(text: "crédito/hora",
                                              color: .pink_white,
                                              UIFont(name: FontsBravve.bold.rawValue,
                                                                           size: CGFloat(12).generateSizeForScreen))
            
            let priceView = UIView()
            priceView.addSubviews([priceTypeLabel, hourlyCreditsLabel, hourLabel, creditHourLabel, hourPriceLabel])
            
            for subview in priceView.subviews {
                
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
            
            hourlyCreditsLabel.topAnchor.constraint(equalTo: priceView.topAnchor).isActive = true
            hourlyCreditsLabel.leadingAnchor.constraint(equalTo: priceTypeLabel.trailingAnchor,
                                                constant: CGFloat(2.5).generateSizeForScreen).isActive = true
            hourlyCreditsLabel.trailingAnchor.constraint(equalTo: hourLabel.leadingAnchor,
                                                 constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
            
            priceTypeLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor).isActive = true
            priceTypeLabel.bottomAnchor.constraint(equalTo: hourlyCreditsLabel.bottomAnchor).isActive = true
            
            hourLabel.bottomAnchor.constraint(equalTo: hourlyCreditsLabel.bottomAnchor).isActive = true
            
            creditHourLabel.leadingAnchor.constraint(equalTo: hourPriceLabel.trailingAnchor,
                                                     constant: CGFloat(2.5).generateSizeForScreen).isActive = true
            creditHourLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor).isActive = true
            creditHourLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor).isActive = true
            
            hourPriceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor).isActive = true
            hourPriceLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor).isActive = true
            
            return priceView
        }()
        
        let addressLabel = createLabel(UIFont(name: FontsBravve.light.rawValue,
                                              size: CGFloat(13).generateSizeForScreen))
        
        let detailsButton = UIButton()
        detailsButton.setImage(UIImage(named: "arrowPink"), for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.addTarget(self,
                                action: #selector(showDetails),
                                for: .touchUpInside)
        
        view.addSubviews([titleLabelView, sloganLabel, detailsButton, photoView, photoLabelView, localNameLabel, descriptionLabel, priceView, addressLabel])
        
        let spacing = CGFloat(20).generateSizeForScreen
        
        spaceCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        
        spaceCategoryLabel.topAnchor.constraint(equalTo: titleLabelView.topAnchor,
                                        constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryLabel.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor,
                                            constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        spaceCategoryLabel.trailingAnchor.constraint(equalTo: titleLabelView.trailingAnchor,
                                             constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        spaceCategoryLabel.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor,
                                           constant: CGFloat(-2.5).generateSizeForScreen).isActive = true

        sloganLabel.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: spacing).isActive = true
        sloganLabel.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor).isActive = true
        sloganLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        
        photoView.topAnchor.constraint(equalTo: sloganLabel.bottomAnchor, constant: spacing).isActive = true
        photoView.leadingAnchor.constraint(equalTo: sloganLabel.leadingAnchor).isActive = true
        photoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: CGFloat(200).generateSizeForScreen).isActive = true
        
        photoLabelView.topAnchor.constraint(equalTo: photoView.topAnchor,
                                            constant: CGFloat(25).generateSizeForScreen).isActive = true
        photoLabelView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor,
                                                constant: CGFloat(25).generateSizeForScreen).isActive = true
        
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        photoLabel.topAnchor.constraint(equalTo: photoLabelView.topAnchor,
                                        constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        photoLabel.leadingAnchor.constraint(equalTo: photoLabelView.leadingAnchor,
                                            constant: CGFloat(2.5).generateSizeForScreen).isActive = true
        photoLabel.trailingAnchor.constraint(equalTo: photoLabelView.trailingAnchor,
                                             constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        photoLabel.bottomAnchor.constraint(equalTo: photoLabelView.bottomAnchor,
                                           constant: CGFloat(-2.5).generateSizeForScreen).isActive = true
        
        localNameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: spacing).isActive = true
        localNameLabel.leadingAnchor.constraint(equalTo: photoView.leadingAnchor).isActive = true
        localNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        priceView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: spacing).isActive = true
        priceView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor,
                                            constant: CGFloat(-20).generateSizeForScreen).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: localNameLabel.bottomAnchor, constant: spacing/2).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: localNameLabel.leadingAnchor).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: spacing).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: localNameLabel.leadingAnchor).isActive = true
        
        detailsButton.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: spacing*2).isActive = true
        detailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: CGFloat(-30).generateSizeForScreen).isActive = true
        detailsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                              constant: CGFloat(-30).generateSizeForScreen).isActive = true
        
        return ViewElements(view: view,
                            spaceCategoryLabel: spaceCategoryLabel,
                            titleLabelView: titleLabelView,
                            sloganLabel: sloganLabel,
                            photoView: photoView,
                            photoLabel: photoLabel,
                            photoLabelView: photoLabelView,
                            localNameLabel: localNameLabel,
                            descriptionLabel: descriptionLabel,
                            hourlyCreditsLabel: hourlyCreditsLabel,
                            addressLabel: addressLabel)
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
        
        viewElements.view.translatesAutoresizingMaskIntoConstraints = false
        
        viewElements.view.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: CGFloat(10).generateSizeForScreen).isActive = true
        viewElements.view.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        viewElements.view.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen).isActive = true
        viewElements.view.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(-10).generateSizeForScreen).isActive = true
    }
    
    func setup(_ space: Space) {
        
        viewElements.sloganLabel.text = space.slogan
        id = space.id
        
        guard let pictures = space.space_pictures else {return}
        
        var picture = ""
        
        if pictures.count != 0 {
            guard let pictureSelected = pictures[0].url else {return}
            picture = pictureSelected
        }
        
        viewElements.photoView.sd_setImage(with: URL(string: picture),
                                           placeholderImage: UIImage(named: ImagesBravve.imageNotFound.rawValue))
        viewElements.localNameLabel.text = space.local_name
        viewElements.descriptionLabel.text = space.description
        viewElements.hourlyCreditsLabel.text = "\(space.hourly_credits ?? " ")"
        viewElements.addressLabel.text = "\(space.partner_site_address?.address?.city_name ?? "")/\(space.partner_site_address?.address?.neighborhood ?? "")\nCapacidade: \(space.seats_qty ?? 0) pessoas\n\(space.space_type?.name ?? "")"
        
        guard let allowWorkpass = space.allow_workpass else {return}
        
        guard let space_category = space.space_category?.name?.uppercased() else {return}
        
        viewElements.spaceCategoryLabel.text = space_category
        viewElements.titleLabelView.backgroundColor = getTitleLabelBackgroundColor(space_category)
        
        
        if allowWorkpass {
            
            viewElements.photoLabelView.isHidden = false
        }
        else {
            
            viewElements.photoLabelView.isHidden = true
        }
    }
    
    /// create a Label with default of editing profile View
    /// - Parameters:
    ///   - text: the text of label
    ///   - color: the collor of text(default is Collorsbravve.label.rawValue)
    ///   - font: font(default: FontsBravve.medium.rawValue)
    /// - Returns: the label
    private func createLabel(text: String? = nil,
                             color: ColorsBravve = .progressBarLabel,
                             _ font: UIFont? = UIFont(name: FontsBravve.bold.rawValue,
                                                      size: CGFloat(20).generateSizeForScreen)) -> UILabel {
        
        let label = UILabel()
        
        label.text = text ?? ""
        label.textColor = UIColor(named: color.rawValue)
        label.textAlignment = .left
        label.font = font
        label.numberOfLines = 0
        
        return label
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace(id)
    }
}

protocol HomeClosedTableViewCellProtocol {
    
    func chosePlace(_ id: Int?)
}
