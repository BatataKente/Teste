//
//  FAQTableViewCell.swift
//  Files
//
//  Created by user217584 on 09/08/22.
//

import Foundation
import UIKit

class HelpTableViewCell: UITableViewCell {
    
    static let identifier = "HelpTableViewCell"
    var iconClick: Bool = true
    
    private lazy var backgroundCellView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.backgroundColor = .red
        view.frame = view.bounds
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.bounds = bounds
        view.layer.position = center
        view.axis = .horizontal
        view.addArrangedSubviews([titleLabel, plusAndLessButton])
        
//        NSLayoutConstraint.activate([
//            view.
//        ])
        return view
    }()
    
    lazy var subtitleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [backgroundCellView, subTitleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = view.bounds
        view.axis = .vertical
        view.addArrangedSubviews([subTitleLabel])
        view.isHidden = true
        return view
    }()
    
    private lazy var plusAndLessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "mostButton"), for: .normal)
        button.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    private lazy var invisibleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.attributedText = NSMutableAttributedString(string: "Como eu faço para abrir o Box?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.koho.rawValue, size: CGFloat(17).generateSizeForScreen)
        label.textAlignment = .left
        label.textColor = UIColor(named: ColorsBravve.blue.rawValue)
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = NSMutableAttributedString(string: "Após confirmar o pagamento ou inserir seu voucher, o app exibe as informações da sua contratação. No horário estabelecido, basta ir no menu "+"Minhas reservas"+", selecionar sua reserva e o app abrirá um card com o resumo da sua contratação. Clique na reserva e depois no. botão "+"Destravar porta"+" e pronto. Você já pode acessar o box.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
//        label.isHidden = true
        
        return label
    }()
    
    @objc func showAnswer(sender:UIButton){
        if(iconClick == true){
            plusAndLessButton.setImage(UIImage(named: "lessButton"), for: .normal)
            self.subTitleLabel.isHidden = false
        } else {
        plusAndLessButton.setImage(UIImage(named: "mostButton"), for: .normal)
        self.subTitleLabel.isHidden = true
        }
        iconClick = !iconClick
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        contentView.addSubviews([subtitleStackView])
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundCellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
//            self.backgroundCellView.bottomAnchor.constraint(equalTo: self.subtitleStackView.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor, constant: 14),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.plusAndLessButton.leadingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 45),
            
            self.plusAndLessButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.plusAndLessButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: 25),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
            self.subTitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
//            self.invisibleButton.topAnchor.constraint(equalTo: self.backgroundCellView.topAnchor),
//            self.invisibleButton.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor),
//            self.invisibleButton.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor),
//            self.invisibleButton.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            
            self.subtitleStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50),
            self.subtitleStackView.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: 25),
            self.subtitleStackView.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: -79),
            self.subtitleStackView.bottomAnchor.constraint(equalTo: self.backgroundCellView.bottomAnchor, constant: -37),
            
        ])
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI



struct FeaturePreviews: PreviewProvider {

    static var previews: some View {

        UIViewPreview {

            let cell = HelpTableViewCell()
            cell.backgroundColor = .red
//            let app = App(tagline: "Lorem ipsum",
//
//                          name: "Lorem ipsum",
//
//                          subheading: "Lorem ipsum")
//
//            cell.configure(with: app)

            return cell

        }

        .previewLayout(.fixed(width: UIScreen.main.bounds.width,

                              height: 300))

    }

}





#endif

