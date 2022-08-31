//
//  BookingTotalPayableCustomCell.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 31/08/22.
//

import Foundation
import UIKit

class TotalPayableBookingReviewCustomCell: UITableViewCell {
    
    //MARK: - var and let
    static let reuseIdPayable: String = "totalPayableBookingCell"
    
    //MARK: - view
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - totalPayableLabel
    let totalPayableLabel: UILabel = {
        let label = UILabel()
        label.text = "Total a pagar"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - dollarImage
    let dollarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        image.image = UIImage(named: IconsBravve.clock.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    //MARK: - totalLabel
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 480.00"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupView
    func setupView() {
        contentView.addSubviews([totalPayableLabel, totalLabel, dollarImage, bottomLine])
        contentView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
    }
    
    //MARK: - setupConstraints
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            //MARK: - totalPayableLabel
            totalPayableLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            totalPayableLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            
            //MARK: - totalLabel
            totalLabel.topAnchor.constraint(equalTo: totalPayableLabel.bottomAnchor, constant: 19),
            totalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            totalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35.5),
            
            //MARK: - totalLabel
            dollarImage.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor),
            dollarImage.leadingAnchor.constraint(equalTo: totalPayableLabel.leadingAnchor),
            dollarImage.widthAnchor.constraint(equalTo: dollarImage.heightAnchor),
        
            //MARK: - bottomLine Constraints
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 0.3),
            bottomLine.widthAnchor.constraint(equalToConstant: 334)
        ])
        
    }
}
