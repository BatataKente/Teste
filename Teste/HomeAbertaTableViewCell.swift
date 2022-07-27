//
//  HomeAbertaTableViewCell.swift
//  Teste
//
//  Created by Josicleison on 24/07/22.
//

import UIKit

class HomeAbertaTableViewCell: UITableViewCell {
    
    var delegate: HomeAbertaTableViewCellProtocol?
    
    let viewElements: (view: UIView,
                       titleLabel: UILabel,
                       descriptionLabel: UILabel,
                       detailsButton: UIButton,
                       photoView: UIImageView,
                       nameLabel: UILabel,
                       priceLabel: UILabel,
                       detailsLabel: UILabel) = {
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemGreen
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
//        view.layer.shadowOffset
        
        let photoView = UIImageView()
        photoView.backgroundColor = .cyan
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 12
        
        photoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        let nameLabel = UILabel()
        nameLabel.text = "Hotel Saint"
        
        let priceLabel = UILabel()
        priceLabel.text = "3,50 crédito/ hora"
        
        let detailsLabel = UILabel()
        detailsLabel.text = "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"
        detailsLabel.numberOfLines = 0
        
        let detailsButton = UIButton()
        detailsButton.setImage(UIImage(named: "arrowPink"), for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        
        view.addSubviews([titleLabel, descriptionLabel, detailsButton, photoView, nameLabel, priceLabel, detailsLabel])
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                detailsButton: detailsButton,
                photoView: photoView,
                nameLabel: nameLabel,
                priceLabel: priceLabel,
                detailsLabel: detailsLabel)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupDefaults()
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
    
    func setupDefaults() {
        
        viewElements.descriptionLabel.setToDefault(text: "Numa esquina charmosa, um hotel",
                                                   .left)
    }
    
    func setupConstraints() {
        
        viewElements.view.constraintInsideTo(.top, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.leading, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.trailing, contentView.safeAreaLayoutGuide, 20)
        viewElements.view.constraintInsideTo(.bottom, contentView.safeAreaLayoutGuide)
//        viewElements.view.heightAnchorInSuperview(100)
        
        viewElements.titleLabel.constraintInsideTo(.top, viewElements.view)
        viewElements.titleLabel.constraintInsideTo(.leading, viewElements.view, 21)
        
        viewElements.descriptionLabel.constraintOutsideTo(.top, viewElements.titleLabel, 23)
        viewElements.descriptionLabel.constraintInsideTo(.leading, viewElements.titleLabel)
        viewElements.descriptionLabel.widthAnchorInSuperview(215)
        
        viewElements.photoView.constraintOutsideTo(.top, viewElements.descriptionLabel, 22)
        viewElements.photoView.constraintInsideTo(.leading, viewElements.descriptionLabel)
        viewElements.photoView.constraintInsideTo(.trailing, viewElements.view)
        viewElements.photoView.heightAnchorInSuperview(100)
        
        viewElements.nameLabel.constraintOutsideTo(.top, viewElements.photoView, 23)
        viewElements.nameLabel.constraintInsideTo(.leading, viewElements.photoView)
        
        viewElements.priceLabel.constraintOutsideTo(.top, viewElements.photoView, 23)
        viewElements.priceLabel.constraintInsideTo(.trailing, viewElements.photoView, 18)
        
        viewElements.detailsLabel.constraintOutsideTo(.top, viewElements.nameLabel, 23)
        viewElements.detailsLabel.constraintInsideTo(.leading, viewElements.nameLabel, 17)
        viewElements.detailsLabel.constraintInsideTo(.bottom, viewElements.view, 33)
        
        viewElements.detailsButton.constraintInsideTo(.trailing, viewElements.view, 27)
        viewElements.detailsButton.constraintInsideTo(.bottom, viewElements.view, 19)
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace()
    }
}

protocol HomeAbertaTableViewCellProtocol {
    
    func chosePlace()
}
