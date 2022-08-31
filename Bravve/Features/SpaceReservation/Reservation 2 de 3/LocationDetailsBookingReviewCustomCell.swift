//
//  BookingReviewLocationDetailsCustomCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 31/08/22.
//

import UIKit

final class LocationDetailsBookingReviewCustomCell: UITableViewCell{
    
    
    static let reuseIdLocation: String = "locationDetailsCell"
    
    
    //MARK: - revisionLabel
    private lazy var revisionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Revisão"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    
    //MARK: - detailsLabel
    private lazy var detailsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Detalhes do local"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    //MARK: - mapImage
    private lazy var mapImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.locationBlue.rawValue )
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //MARK: - locationLabel
    private lazy var locationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Av. São João, Cj. Boulevard, nº900, Sâo Paulo. SP 06020-010, BR"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - bottomLine
    private lazy var bottomLine: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //MARK: - setupView
    private func setupView(){
        
        contentView.addSubviews([
                                 revisionLabel,
                                 detailsLabel,
                                 mapImage,
                                 locationLabel,
                                 bottomLine,
                                ])
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupConstraints
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([

            
            
            //MARK: - revisionLabel Constraints
            revisionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            revisionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            revisionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            //MARK: - detailsLabel Constraints
            detailsLabel.topAnchor.constraint(equalTo: revisionLabel.bottomAnchor, constant: 19),
            detailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            //MARK: - mapImage Constraints
            mapImage.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 25.99),
            mapImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            mapImage.heightAnchor.constraint(equalToConstant: 14),
            
            //MARK: - locationLabel Constraints
            locationLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 19),
            locationLabel.leadingAnchor.constraint(equalTo: mapImage.trailingAnchor, constant: 9.51),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
            locationLabel.widthAnchor.constraint(equalToConstant: 312),
        
            
            //MARK: - bottomLine Constraints
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
            bottomLine.widthAnchor.constraint(equalToConstant: 334)
        ])
        
    }
    
}
