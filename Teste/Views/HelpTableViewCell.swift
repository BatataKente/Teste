//
//  FAQTableViewCell.swift
//  Files
//
//  Created by user217584 on 09/08/22.
//

import Foundation
import UIKit

protocol HelpTableViewCellDelegate: AnyObject {
    func expandedFlag(flag: Int)
}

class HelpTableViewCell: UITableViewCell {
    
    static let identifier = "HelpTableViewCell"
    weak var delegate: HelpTableViewCellDelegate?
    var iconClick: Bool = true
    
    private lazy var backgroundStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [questionView, subTitleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        view.frame = view.bounds
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.bounds = bounds
        view.layer.position = center
        view.axis = .vertical
        
        NSLayoutConstraint.activate([
            questionView.topAnchor.constraint(equalTo: view.topAnchor),
            questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            subTitleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -23),
            
            plusAndLessButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 34),
            

        ])
        return view
    }()
    
    lazy var questionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([titleLabel, plusAndLessButton, invisibleButton])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -79),
            
            plusAndLessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            plusAndLessButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            invisibleButton.topAnchor.constraint(equalTo: view.topAnchor),
            invisibleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisibleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisibleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
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
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.attributedText = NSMutableAttributedString(string: QuestionsAndAnswers.question9.rawValue, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
        label.attributedText = NSMutableAttributedString(string: QuestionsAndAnswers.answer11.rawValue, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    @objc func showAnswer(sender:UIButton){
        if(iconClick == true){
            plusAndLessButton.setImage(UIImage(named: ButtonsBravve.lessButton.rawValue), for: .normal)
            self.subTitleLabel.isHidden = false
            self.delegate?.expandedFlag(flag: 1)
        } else {
        plusAndLessButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        self.subTitleLabel.isHidden = true
            self.delegate?.expandedFlag(flag: 0)
        }
        iconClick = !iconClick
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        contentView.addSubviews([backgroundStackView])
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            self.backgroundStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.backgroundStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40),
            self.backgroundStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
            self.backgroundStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            self.backgroundStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            
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

                              height: 500))

    }

}





#endif

