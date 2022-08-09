//
//  FAQTableViewCell.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class FAQCollectionTableViewCell: UITableViewCell {
    static let identifier = "FAQCollectionTableViewCell"
    
   
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.viewHelp.rawValue)
        return view
    }()
    
    private lazy var wayHelpImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wayHelp")
        view.tintColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vectorHelpImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "vectorHelp")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var FAQViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Encontre as respostas para suas perguntas!"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgroundCellView)
        contentView.addSubview(vectorHelpImageView)
        contentView.addSubview(wayHelpImageView)
        contentView.addSubview(FAQViewLabel)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundCellView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundCellView.heightAnchor.constraint(equalToConstant: CGFloat(222).generateSizeForScreen),
            
            self.vectorHelpImageView.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor),
            self.vectorHelpImageView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
            self.vectorHelpImageView.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor),
            self.vectorHelpImageView.heightAnchor.constraint(equalToConstant: CGFloat(38).generateSizeForScreen),
            
            self.wayHelpImageView.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor),
            self.wayHelpImageView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
            self.wayHelpImageView.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor),
            self.wayHelpImageView.widthAnchor.constraint(equalToConstant: CGFloat(156.77).generateSizeForScreen),
            
            self.FAQViewLabel.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: CGFloat(80).generateSizeForScreen),
            self.FAQViewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: CGFloat(-140.99).generateSizeForScreen),
            self.FAQViewLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(32.99).generateSizeForScreen),
            
//            self.collectionView.topAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
    
}

//extension FAQCollectionTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModels.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FAQCollectionViewCell.identifier, for: indexPath) as? FAQCollectionViewCell else {
//            fatalError()
//        }
//        cell.configure(with: viewModels[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0 {
//            return CGSize(width: CGFloat(296).generateSizeForScreen, height: CGFloat(331).generateSizeForScreen)
//        }
//        return CGSize(width: CGFloat(296).generateSizeForScreen, height: CGFloat(72).generateSizeForScreen)
//    }
//}
