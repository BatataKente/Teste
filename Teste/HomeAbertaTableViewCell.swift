//
//  HomeAbertaTableViewCell.swift
//  Teste
//
//  Created by Josicleison on 24/07/22.
//

import UIKit

class HomeAbertaTableViewCell: UITableViewCell {
    
    var delegate: HomeAbertaTableViewCellProtocol?
    
    let photoView: UIImageView = {
        
        let photoView = UIImageView()
        photoView.backgroundColor = .cyan
        photoView.layer.cornerRadius = 12
        
        return photoView
    }()
    
    let viewElements: (view: UIView,
                       titleLabel: UILabel,
                       descriptionLabel: UILabel,
                       detailsButton: UIButton) = {
        
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
        
        let detailsButton = UIButton()
        detailsButton.setTitle("Botao", for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        
        view.addSubviews([titleLabel, descriptionLabel, detailsButton])
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                detailsButton: detailsButton)
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
        
        viewElements.view.addSubview(photoView)
        
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
        
        photoView.constraintOutsideTo(.top, viewElements.descriptionLabel, 22)
        photoView.constraintInsideTo(.leading, viewElements.descriptionLabel)
        photoView.constraintInsideTo(.trailing, viewElements.view)
        photoView.heightAnchorInSuperview(100)
        
        viewElements.detailsButton.constraintOutsideTo(.top, photoView, 21)
        viewElements.detailsButton.constraintInsideTo(.trailing, viewElements.view, 27)
        viewElements.detailsButton.constraintInsideTo(.bottom, viewElements.view, 18)
    }
    
    @objc func showDetails() {
        
        delegate?.chosePlace()
    }
}

protocol HomeAbertaTableViewCellProtocol {
    
    func chosePlace()
}
