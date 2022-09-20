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
    let sessionManager = APIService()
    
    private var currentReservationId: Int? = nil
    private var currentSpaceId: Int? = nil
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(19).generateSizeForScreen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        return view
    }()
    
    let typeTagLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.backgroundColor = UIColor(named: "boxOffice")
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
       
    private let spaceImage: UIImageView = {
        
        let spaceImage = UIImageView()
        spaceImage.translatesAutoresizingMaskIntoConstraints = false
        spaceImage.clipsToBounds = true
        spaceImage.layer.cornerRadius = 12
        spaceImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        return spaceImage
    }()
    
    let spaceNameLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(20).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reservedLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .white
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(11).generateSizeForScreen)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reservedLabelView: UIView = {
        
        let reservedLabelView = UIView()
        reservedLabelView.translatesAutoresizingMaskIntoConstraints = false
        reservedLabelView.backgroundColor = UIColor(named: ColorsBravve.reserved.rawValue)
        return reservedLabelView
    }()
    
    let spaceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = UIColor(named: ColorsBravve.blue_white.rawValue)
        label.font = UIFont(name:  FontsBravve.light.rawValue, size: CGFloat(13).generateSizeForScreen)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spaceTypeLabel: UILabel = {
        let label = UILabel()
        label.text = " "
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
        
        cellView.addSubviews([typeTagLabel, topTitleLabel, spaceImage, spaceNameLabel, reservedLabelView, reservedLabel, spaceSubtitleLabel, locationInfoStackView, arrowButton])
        
        contentView.addSubview(cellView)
        
        setupConstraints()
        
        arrowButton.addTarget(self, action: #selector(actionArrowButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionArrowButton() {
        
        UserReservations.reservationHistoryID = currentReservationId
        UserReservations.spaceHistoryID = currentSpaceId
        getSpaceDetail()
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
        self.currentSpaceId = reservation.space_id
    }
    
    func getSpaceDetail() {
        
        guard let currentSpaceId = currentSpaceId else { return }

        sessionManager.getData(id: "\(currentSpaceId)", endpoint: .spacesId, completionHandler: {(statusCode, error, space: SpaceDetail?) in
            
            guard let space = space else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            UserReservations.spaceHistoryDetail = space
            self.delegate?.presentViewController(HistoryDetailsView())
       })
    }

    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(20).generateSizeForScreen),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            typeTagLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            typeTagLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: CGFloat(17).generateSizeForScreen),
            
            topTitleLabel.topAnchor.constraint(equalTo: typeTagLabel.bottomAnchor, constant: CGFloat(19).generateSizeForScreen),
            topTitleLabel.leadingAnchor.constraint(equalTo: typeTagLabel.leadingAnchor),
            topTitleLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.6),
                       
            spaceImage.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            spaceImage.leadingAnchor.constraint(equalTo: topTitleLabel.leadingAnchor),
            spaceImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            spaceImage.heightAnchor.constraint(equalToConstant: CGFloat(200).generateSizeForScreen),
            
            spaceNameLabel.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: CGFloat(23).generateSizeForScreen),
            spaceNameLabel.leadingAnchor.constraint(equalTo: spaceImage.leadingAnchor),
            
            reservedLabelView.topAnchor.constraint(equalTo: spaceImage.bottomAnchor, constant: CGFloat(28).generateSizeForScreen),
            reservedLabelView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: CGFloat(-26).generateSizeForScreen),

            reservedLabel.topAnchor.constraint(equalTo: reservedLabelView.topAnchor, constant: CGFloat(2.5).generateSizeForScreen),
            reservedLabel.leadingAnchor.constraint(equalTo: reservedLabelView.leadingAnchor, constant: CGFloat(2.5).generateSizeForScreen),
            reservedLabel.trailingAnchor.constraint(equalTo: reservedLabelView.trailingAnchor, constant: CGFloat(-2.5).generateSizeForScreen),
            reservedLabel.bottomAnchor.constraint(equalTo: reservedLabelView.bottomAnchor, constant: CGFloat(-2.5).generateSizeForScreen),
                     
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
