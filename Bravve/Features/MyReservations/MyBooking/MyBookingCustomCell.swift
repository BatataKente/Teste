//
//  CancelReservationCell.swift
//  Bravve
//
//  Created by user208023 on 8/1/22.
//

import UIKit
import SDWebImage

protocol MyBookingCustomCellDelegate: AnyObject {
    
    func presentViewController(_ viewController: UIViewController)
}
    
class MyBookingCustomCell: UITableViewCell {
    
    weak var delegate: MyBookingCustomCellDelegate?

    private var currentReservationId: Int? = nil
    
    private let cellView: UIView = {
        
        let cellView = UIView()
        cellView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        cellView.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        
        return cellView
    }()
    
    private let typeTagLabel: UILabel = {
        
        let typeTagLabel = UILabel()
        typeTagLabel.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        typeTagLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        typeTagLabel.textAlignment = .center
        
        return typeTagLabel
    }()
    
    private let topTitleLabel: UILabel = {
        
        let topTitleLabel = UILabel()
        topTitleLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        topTitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        topTitleLabel.numberOfLines = 0
        
        return topTitleLabel
    }()
    
    private let bottomTitleLabel: UILabel = {
        
        let bottomTitleLabel = UILabel()
        bottomTitleLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        bottomTitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        
        return bottomTitleLabel
    }()
    
    private let spaceImage: UIImageView = {
        
        let spaceImage = UIImageView()
        spaceImage.clipsToBounds = true
        spaceImage.layer.cornerRadius = 12
        spaceImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        return spaceImage
    }()
    
    let spaceNameLabel: UILabel = {
        
        let spaceNameLabel = UILabel()
        spaceNameLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        spaceNameLabel.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        
        return spaceNameLabel
    }()
    
    private let reservedLabel: UILabel = {
        
        let reservedLabel = UILabel()
        reservedLabel.textColor = .white
        reservedLabel.font = UIFont(name: FontsBravve.light.rawValue,
                                 size: CGFloat(13).generateSizeForScreen)
        reservedLabel.textAlignment = .center
        
        return reservedLabel
    }()
    
    private let reservedLabelView: UIView = {
        
        let reservedLabelView = UIView()
        reservedLabelView.backgroundColor = UIColor(named: ColorsBravve.reserved.rawValue)
        return reservedLabelView
    }()
    
  
    private let spaceSubtitleLabel: UILabel = {
        
        let spaceSubtitleLabel = UILabel()
        spaceSubtitleLabel.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        spaceSubtitleLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        
        return spaceSubtitleLabel
    }()
    
    private let locationLabel: UILabel = {
        
        let locationLabel = UILabel()
        locationLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        locationLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return locationLabel
    }()
    
    private let dateLabel: UILabel = {
        
        let dateLabel = UILabel()
        dateLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        dateLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return dateLabel
    }()
    
    private let hourLabel: UILabel = {
        
        let hourLabel = UILabel()
        hourLabel.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        hourLabel.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return hourLabel
    }()
    
    private let spaceTypeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Espaço privativo"
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        
        return label
    }()
    
    private lazy var locationInfoStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [locationLabel, dateLabel, hourLabel, spaceTypeLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.setCustomSpacing(8, after: hourLabel)
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let arrowButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowPink.rawValue), for: .normal)
        button.contentMode = .scaleToFill
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        
        reservedLabelView.addSubview(reservedLabel)
        cellView.addSubviews([typeTagLabel, topTitleLabel, spaceImage, spaceNameLabel, reservedLabelView, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        setupConstraints()
        
        arrowButton.addTarget(self, action: #selector(actionArrowButton),
                              for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(reservation: Reservations) {
        
        guard let city = (reservation.space_address?.city_name) else { return }
        guard let neighborhood = (reservation.space_address?.neighborhood) else { return }
        
        guard let pictures = reservation.picture else { return }
        
        var picture = ""
        	
        if pictures.count != 0 {
            guard let pictureSelected = pictures[0].url else { return }
            picture = pictureSelected
        }
        
        guard let reservationStartDt = reservation.start_dt else { return }
        guard let reservationEndDt = reservation.end_dt else { return }
        
        let separatedStartDate = reservationStartDt.components(separatedBy: "T")
        let separatedEndDate = reservationEndDt.components(separatedBy: "T")
        
        let formatStartDate = separatedStartDate[0].components(separatedBy: "-")
        let formatEndDate = separatedEndDate[0].components(separatedBy: "-")
        
        let startDate = "\(formatStartDate[2])/\(formatStartDate[1])/\(formatStartDate[0])"
        let endDate = "\(formatEndDate[2])/\(formatEndDate[1])/\(formatEndDate[0])"
        
        let separatedStartHour = separatedStartDate[1].components(separatedBy: ":")
        let separatedEndHour = separatedEndDate[1].components(separatedBy: ":")
        
        let startHour = "\(separatedStartHour[0])"
        let endHour = "\(separatedEndHour[0])"
        
        typeTagLabel.text = reservation.space_category?.name?.uppercased()
        typeTagLabel.backgroundColor = getTitleLabelBackgroundColor(reservation.space_category?.name?.uppercased() ?? "")
        topTitleLabel.text = reservation.slogan
        spaceImage.sd_setImage(with: URL(string: picture), placeholderImage: UIImage(named: ImagesBravve.homeOpen_1.rawValue))
        spaceNameLabel.text = reservation.local_name
        reservedLabel.text = reservation.reservation_status_name?.uppercased()
        reservedLabelView.backgroundColor = getTitleLabelBackgroundColor(reservation.reservation_status_name?.uppercased() ?? "")
        spaceSubtitleLabel.text = reservation.description
        locationLabel.text = "\(city) / \(neighborhood)"
        dateLabel.text = "\(startDate) - \(endDate)"
        hourLabel.text = "\(startHour)h às \(endHour)h"
        spaceTypeLabel.text = reservation.space_type?.name
       
        self.currentReservationId = reservation.id
    }
    
    @objc func actionArrowButton() {
        
        UserReservations.reservationID = currentReservationId
        self.delegate?.presentViewController(BookingDetailsView())
    }
    
    private func setupConstraints() {
        
        cellView.constraintInsideTo(.top, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.leading, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.trailing, contentView,
                                    CGFloat(20).generateSizeForScreen)
        cellView.constraintInsideTo(.bottom, contentView,
                                    CGFloat(20).generateSizeForScreen)
        
        typeTagLabel.constraintInsideTo(.top, cellView)
        typeTagLabel.constraintInsideTo(.leading, cellView,
                                        CGFloat(17).generateSizeForScreen)
        
        topTitleLabel.constraintOutsideTo(.top, typeTagLabel,
                                          CGFloat(19).generateSizeForScreen)
        topTitleLabel.constraintInsideTo(.leading, cellView,
                                         CGFloat(17).generateSizeForScreen)
        topTitleLabel.constraintInsideTo(.width, cellView, multiplier: 0.6)
        
        spaceImage.constraintOutsideTo(.top, topTitleLabel,
                                       CGFloat(22).generateSizeForScreen)
        spaceImage.constraintInsideTo(.leading, topTitleLabel)
        spaceImage.constraintInsideTo(.trailing, cellView)
        spaceImage.constraintInsideTo(.height, cellView, multiplier: 0.39)
        spaceImage.heightAnchorInSuperview(CGFloat(200).generateSizeForScreen)
        
        spaceNameLabel.constraintOutsideTo(.top, spaceImage,
                                           CGFloat(23).generateSizeForScreen)
        spaceNameLabel.constraintInsideTo(.leading, spaceImage)
        
        reservedLabelView.constraintOutsideTo(.top, spaceImage,
                                          CGFloat(28).generateSizeForScreen)
        reservedLabelView.constraintInsideTo(.trailing, cellView,
                                         CGFloat(26).generateSizeForScreen)
        
        reservedLabel.constraintInsideTo(.top, reservedLabelView,
                                          CGFloat(2.5).generateSizeForScreen)
        reservedLabel.constraintInsideTo(.trailing, reservedLabelView,
                                         CGFloat(2.5).generateSizeForScreen)
        reservedLabel.constraintInsideTo(.bottom, reservedLabelView,
                                         CGFloat(2.5).generateSizeForScreen)
        reservedLabel.constraintInsideTo(.leading, reservedLabelView,
                                         CGFloat(2.5).generateSizeForScreen)
        
        spaceSubtitleLabel.constraintOutsideTo(.top, spaceNameLabel,
                                               CGFloat(8).generateSizeForScreen)
        spaceSubtitleLabel.constraintInsideTo(.leading, spaceNameLabel)
        
        locationInfoStackView.constraintOutsideTo(.top, spaceSubtitleLabel,
                                                  CGFloat(9).generateSizeForScreen)
        locationInfoStackView.constraintInsideTo(.leading, spaceSubtitleLabel)
        locationInfoStackView.constraintInsideTo(.bottom, cellView,
                                                 CGFloat(23).generateSizeForScreen)
        
        arrowButton.constraintInsideTo(.trailing, cellView,
                                       CGFloat(25).generateSizeForScreen)
        arrowButton.constraintInsideTo(.bottom, cellView,
                                       CGFloat(18).generateSizeForScreen)
    }
}

