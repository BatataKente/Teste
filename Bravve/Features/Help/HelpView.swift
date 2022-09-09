//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    
    private var viewModel: HelpViewModel = HelpViewModel()
    private let customBar = UIView()
    var iconClick: Bool = true
    var arrayBool: [Bool] = [false, true, true, true, true, true, true, true, true, true, true]
    var arrayImageButton: [String] = [ButtonsBravve.lessButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue]
    var arrayBackgroundColor: [String] = [ColorsBravve.backgroundHelp.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue]
    var arrayAnswer: [UILabel] = []
    var arrayButtons: [UIButton] = []
    var arrayStackViews: [UIStackView] = []
    
    //MARK: - tabBar
    private lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    //MARK: - HearderView
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        view.addSubviews([wayHelpImageView, vectorHelpImageView, FAQViewLabel])
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
    
    //MARK: - ScrollView
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: view.bounds)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.addSubviews([uiView, headerView, questionAnswer1StackView, questionAnswer2StackView, questionAnswer3StackView, questionAnswer4StackView, questionAnswer5StackView, questionAnswer6StackView, questionAnswer7StackView, questionAnswer8StackView, questionAnswer9StackView, questionAnswer10StackView, questionAnswer11StackView])
        return scroll
    }()
    
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Answers Buttons
    lazy var showAnswer1Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "lessButton"), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    lazy var invisible1Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    lazy var showAnswer2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    lazy var invisible2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    lazy var showAnswer3Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    lazy var invisible3Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    lazy var showAnswer4Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    lazy var invisible4Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    lazy var showAnswer5Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    lazy var invisible5Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    lazy var showAnswer6Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 5
        return button
    }()
    
    lazy var invisible6Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 5
        return button
    }()
    
    lazy var showAnswer7Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 6
        return button
    }()
    
    lazy var invisible7Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 6
        return button
    }()
    
    lazy var showAnswer8Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 7
        return button
    }()
    
    lazy var invisible8Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 7
        return button
    }()
    
    lazy var showAnswer9Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.setTitleColor(UIColor(named: ColorsBravve.blue.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 8
        return button
    }()
    
    lazy var invisible9Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 8
        return button
    }()
    
    lazy var showAnswer10Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 9
        return button
    }()
    
    lazy var invisible10Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 9
        return button
    }()
    
    lazy var showAnswer11Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue), for: .normal)
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 10
        return button
    }()
    
    lazy var invisible11Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAnswer), for: .touchUpInside)
        button.tag = 10
        return button
    }()
    
    //MARK: - Answers Labels
    lazy var answer1Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 0).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = false
        
        return label
    }()
    
    lazy var answer2Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let stringTwo = "suporte@bravve.com.br"
        let range = (self.viewModel.returnHelp(number: 1).answer  as NSString).range(of: stringTwo)
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 1).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEmailSupport(gesture:)))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: ColorsBravve.cyan_black.rawValue) ?? .link, range: range)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer3Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 2).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer4Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 3).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer5Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 4).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer6Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let stringRange = "Clique aqui"
        let range = (self.viewModel.returnHelp(number: 5).answer as NSString).range(of: stringRange)
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 5).answer, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHereOne(gesture:)))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: ColorsBravve.cyan_black.rawValue) ?? .link, range: range)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer7Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 6).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer8Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 7).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer9Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let stringRange = "clicar aqui"
        let range = (self.viewModel.returnHelp(number: 8).answer as NSString).range(of: stringRange)
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 8).answer, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHereTwo(gesture:)))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: ColorsBravve.cyan_black.rawValue) ?? .link, range: range)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer10Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 9).answer , attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer11Label: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.39
        let stringRange = "contato@bravve.com.br"
        let range = (self.viewModel.returnHelp(number: 10).answer as NSString).range(of: stringRange)
        let attributedText = NSMutableAttributedString(string: self.viewModel.returnHelp(number: 10).answer, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEmailContact(gesture:)))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: ColorsBravve.cyan_black.rawValue)  ?? .link, range: range)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.attributedText = attributedText
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    //MARK: - UIViews and UIStackViews
    lazy var question1View: UIView = {
        
        lazy var question1Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 0).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question1Label, showAnswer1Button, invisible1Button])
        
        NSLayoutConstraint.activate([
            question1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question1Label.widthAnchor.constraint(equalToConstant: 192),
            question1Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer1Button.centerYAnchor.constraint(equalTo: question1Label.centerYAnchor),
            
            invisible1Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible1Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer1StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question1View, answer1Label])
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundHelp.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer1Label.topAnchor.constraint(equalTo: question1View.bottomAnchor, constant: -6),
            answer1Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer1Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer1Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question2View: UIView = {
        
        lazy var question2Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 1).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question2Label, showAnswer2Button, invisible2Button])
        
        NSLayoutConstraint.activate([
            question2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question2Label.widthAnchor.constraint(equalToConstant: 192),
            question2Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer2Button.centerYAnchor.constraint(equalTo: question2Label.centerYAnchor),
            
            invisible2Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible2Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer2StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question2View, answer2Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer2Label.topAnchor.constraint(equalTo: question2View.bottomAnchor, constant: -6),
            answer2Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer2Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer2Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question3View: UIView = {
        
        lazy var question3Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 2).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question3Label, showAnswer3Button, invisible3Button])
        
        NSLayoutConstraint.activate([
            question3Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question3Label.widthAnchor.constraint(equalToConstant: 192),
            question3Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer3Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer3Button.centerYAnchor.constraint(equalTo: question3Label.centerYAnchor),
            
            invisible3Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible3Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible3Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer3StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question3View, answer3Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer3Label.topAnchor.constraint(equalTo: question3View.bottomAnchor, constant: -6),
            answer3Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer3Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer3Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question4View: UIView = {
        
        lazy var question4Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 3).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question4Label, showAnswer4Button, invisible4Button])
        
        NSLayoutConstraint.activate([
            question4Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question4Label.widthAnchor.constraint(equalToConstant: 192),
            question4Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer4Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer4Button.centerYAnchor.constraint(equalTo: question4Label.centerYAnchor),
            
            invisible4Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible4Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible4Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer4StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question4View, answer4Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer4Label.topAnchor.constraint(equalTo: question4View.bottomAnchor, constant: -6),
            answer4Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer4Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer4Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question5View: UIView = {
        
        lazy var question5Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 4).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question5Label, showAnswer5Button, invisible5Button])
        
        NSLayoutConstraint.activate([
            question5Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question5Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question5Label.widthAnchor.constraint(equalToConstant: 192),
            question5Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer5Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer5Button.centerYAnchor.constraint(equalTo: question5Label.centerYAnchor),
            
            invisible5Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible5Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible5Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible5Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer5StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question5View, answer5Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer5Label.topAnchor.constraint(equalTo: question5View.bottomAnchor, constant: -6),
            answer5Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer5Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer5Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question6View: UIView = {
        
        lazy var question6Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 5).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question6Label, showAnswer6Button, invisible6Button])
        
        NSLayoutConstraint.activate([
            question6Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question6Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question6Label.widthAnchor.constraint(equalToConstant: 192),
            question6Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer6Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer6Button.centerYAnchor.constraint(equalTo: question6Label.centerYAnchor),
            
            invisible6Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible6Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible6Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible6Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer6StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question6View, answer6Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer6Label.topAnchor.constraint(equalTo: question6View.bottomAnchor, constant: -28),
            answer6Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer6Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer6Label.heightAnchor.constraint(equalToConstant: 256),
        ])
        return stack
    }()
    
    lazy var question7View: UIView = {
        
        lazy var question7Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 6).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question7Label, showAnswer7Button, invisible7Button])
        
        NSLayoutConstraint.activate([
            question7Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question7Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question7Label.widthAnchor.constraint(equalToConstant: 192),
            question7Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer7Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer7Button.centerYAnchor.constraint(equalTo: question7Label.centerYAnchor),
            
            invisible7Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible7Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible7Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible7Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer7StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question7View, answer7Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer7Label.topAnchor.constraint(equalTo: question7View.bottomAnchor, constant: -6),
            answer7Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer7Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer7Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question8View: UIView = {
        
        lazy var question8Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 7).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question8Label, showAnswer8Button, invisible8Button])
        
        NSLayoutConstraint.activate([
            question8Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question8Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question8Label.widthAnchor.constraint(equalToConstant: 192),
            question8Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer8Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer8Button.centerYAnchor.constraint(equalTo: question8Label.centerYAnchor),
            
            invisible8Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible8Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible8Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible8Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer8StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question8View, answer8Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer8Label.topAnchor.constraint(equalTo: question8View.bottomAnchor, constant: -6),
            answer8Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer8Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer8Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question9View: UIView = {
        
        lazy var question9Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 8).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question9Label, showAnswer9Button, invisible9Button])
        
        NSLayoutConstraint.activate([
            question9Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question9Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question9Label.widthAnchor.constraint(equalToConstant: 192),
            question9Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer9Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer9Button.centerYAnchor.constraint(equalTo: question9Label.centerYAnchor),
            
            invisible9Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible9Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible9Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible9Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer9StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question9View, answer9Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer9Label.topAnchor.constraint(equalTo: question9View.bottomAnchor, constant: -6),
            answer9Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer9Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer9Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question10View: UIView = {
        
        lazy var question10Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 9).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question10Label, showAnswer10Button, invisible10Button])
        
        NSLayoutConstraint.activate([
            question10Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question10Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question10Label.widthAnchor.constraint(equalToConstant: 192),
            question10Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer10Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer10Button.centerYAnchor.constraint(equalTo: question10Label.centerYAnchor),
            
            invisible10Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible10Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible10Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible10Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer10StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question10View, answer10Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = stack.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer10Label.topAnchor.constraint(equalTo: question10View.bottomAnchor, constant: -6),
            answer10Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer10Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer10Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var question11View: UIView = {
        
        lazy var question11Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = self.viewModel.returnHelp(number: 10).question
            label.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
            label.textAlignment = .left
            label.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
            return label
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([question11Label, showAnswer11Button, invisible11Button])
        
        NSLayoutConstraint.activate([
            question11Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            question11Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question11Label.widthAnchor.constraint(equalToConstant: 192),
            question11Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            
            showAnswer11Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showAnswer11Button.centerYAnchor.constraint(equalTo: question11Label.centerYAnchor),
            
            invisible11Button.topAnchor.constraint(equalTo: view.topAnchor),
            invisible11Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            invisible11Button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            invisible11Button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }()
    
    lazy var questionAnswer11StackView: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [question11View, answer11Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            answer11Label.topAnchor.constraint(equalTo: question11View.bottomAnchor, constant: -6),
            answer11Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer11Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer11Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        view.addSubviews([scrollView, customBar, tabBar])
        tabBar.selectedItem = tabBar.items?[2]
        self.arrayAnswer = [answer1Label, answer2Label, answer3Label, answer4Label, answer5Label, answer6Label, answer7Label, answer8Label, answer9Label, answer10Label, answer11Label]
        self.arrayButtons =  [showAnswer1Button, showAnswer2Button, showAnswer3Button, showAnswer4Button, showAnswer5Button, showAnswer6Button, showAnswer7Button, showAnswer8Button, showAnswer9Button, showAnswer10Button, showAnswer11Button]
        self.arrayStackViews = [questionAnswer1StackView, questionAnswer2StackView, questionAnswer3StackView, questionAnswer4StackView, questionAnswer5StackView, questionAnswer6StackView, questionAnswer7StackView, questionAnswer8StackView, questionAnswer9StackView, questionAnswer10StackView, questionAnswer11StackView]
        setupDefaults()
        configConstraints()
    }
    
    
    //MARK: - func setupDefaults
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes"){
            _ in
            self.dismiss(animated: true)
        }
    }
    
    //MARK: - Tap Functions
    
    @objc func tapEmailSupport(gesture: UITapGestureRecognizer) {
        let tapRange = (self.viewModel.returnHelp(number: 1).answer as NSString).range(of: "suporte@bravve.com.br")
        
        if gesture.didTapAttributedTextInLabel(label: answer2Label, inRange: tapRange) {
            guard let url = URL(string: "mailto:suporte@bravve.com.br") else {
                print("fail")
                return
            }
            UIApplication.shared.canOpenURL(url)
        }
    }
    
    @objc func tapHereOne(gesture: UITapGestureRecognizer) {
        let tapRange = (self.viewModel.returnHelp(number: 5).answer as NSString).range(of: "Clique aqui")
        
        if gesture.didTapAttributedTextInLabel(label: answer6Label, inRange: tapRange) {
            guard let url = URL(string: "https://www.bravve.com.br/contact") else {
                print("fail")
                return
            }
            UIApplication.shared.open(url)
        }
    }
    
    @objc func tapHereTwo(gesture: UITapGestureRecognizer) {
        guard let url = URL(string: "https://www.bravve.com.br/contact") else {
            print("fail")
            return
        }
        UIApplication.shared.open(url)
    }
    
    @objc func tapEmailContact(gesture: UITapGestureRecognizer) {
        let tapRange = (self.viewModel.returnHelp(number: 10).answer as NSString).range(of: "contato@bravve.com.br")
        
        if gesture.didTapAttributedTextInLabel(label: answer11Label, inRange: tapRange) {
            guard let url = URL(string: "mailto:suporte@bravve.com.br") else {
                print("fail")
                return
            }
            UIApplication.shared.canOpenURL(url)
        }
    }
    
    //MARK: - func showAnswer
    @objc func showAnswer(sender: UIButton){
        self.arrayBool = [true, true, true, true, true, true, true, true, true, true, true]
        self.arrayImageButton = [ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue, ButtonsBravve.mostButton.rawValue]
        self.arrayBackgroundColor = [ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue, ColorsBravve.backgroundTerms.rawValue]
        switch sender.tag {
        case 0:
            arrayImageButton[0] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[0] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[0] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 1:
            arrayImageButton[1] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[1] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[1] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 2:
            arrayImageButton[2] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[2] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[2] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 3:
            arrayImageButton[3] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[3] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[3] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 4:
            arrayImageButton[4] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[4] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[4] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 5:
            arrayImageButton[5] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[5] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[5] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 6:
            arrayImageButton[6] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[6] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[6] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 7:
            arrayImageButton[7] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[7] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[7] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 8:
            arrayImageButton[8] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[8] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[8] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 9:
            arrayImageButton[9] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[9] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[9] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        case 10:
            arrayImageButton[10] = ButtonsBravve.lessButton.rawValue
            arrayBackgroundColor[10] = ColorsBravve.backgroundHelp.rawValue
            arrayBool[10] = false
            for i in 0...arrayAnswer.count - 1 {
                arrayAnswer[i].isHidden = arrayBool[i]
                arrayButtons[i].setImage(UIImage(named: arrayImageButton[i]), for: .normal)
                arrayStackViews[i].backgroundColor = UIColor(named: arrayBackgroundColor[i])
            }
        default:
            break
        }
    }
    
    //MARK: - func configConstraints
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.customBar.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            self.uiView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.uiView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.uiView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 73),
            self.uiView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -50),

            self.headerView.topAnchor.constraint(equalTo: self.uiView.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: CGFloat(222).generateSizeForScreen),

            self.vectorHelpImageView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            self.vectorHelpImageView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
            self.vectorHelpImageView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.vectorHelpImageView.heightAnchor.constraint(equalToConstant: CGFloat(38).generateSizeForScreen),

            self.wayHelpImageView.topAnchor.constraint(equalTo: self.headerView.topAnchor),
            self.wayHelpImageView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
            self.wayHelpImageView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.wayHelpImageView.widthAnchor.constraint(equalToConstant: CGFloat(156.77).generateSizeForScreen),

            self.FAQViewLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: CGFloat(80).generateSizeForScreen),
            self.FAQViewLabel.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: CGFloat(-140.99).generateSizeForScreen),
            self.FAQViewLabel.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: CGFloat(32.99).generateSizeForScreen),

            self.question1View.topAnchor.constraint(equalTo: self.vectorHelpImageView.bottomAnchor, constant: 20),
            self.question1View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question1View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer1StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer1StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question2View.topAnchor.constraint(equalTo: self.questionAnswer1StackView.bottomAnchor, constant: 10),
            self.question2View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question2View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer2StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer2StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question3View.topAnchor.constraint(equalTo: self.questionAnswer2StackView.bottomAnchor, constant: 10),
            self.question3View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question3View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer3StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer3StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question4View.topAnchor.constraint(equalTo: self.questionAnswer3StackView.bottomAnchor, constant: 10),
            self.question4View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question4View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer4StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer4StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question5View.topAnchor.constraint(equalTo: self.questionAnswer4StackView.bottomAnchor, constant: 10),
            self.question5View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question5View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer5StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer5StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question6View.topAnchor.constraint(equalTo: self.questionAnswer5StackView.bottomAnchor, constant: 10),
            self.question6View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question6View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer6StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer6StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question7View.topAnchor.constraint(equalTo: self.questionAnswer6StackView.bottomAnchor, constant: 10),
            self.question7View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question7View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer7StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer7StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question8View.topAnchor.constraint(equalTo: self.questionAnswer7StackView.bottomAnchor, constant: 10),
            self.question8View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question8View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer8StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer8StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question9View.topAnchor.constraint(equalTo: self.questionAnswer8StackView.bottomAnchor, constant: 10),
            self.question9View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question9View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer9StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer9StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question10View.topAnchor.constraint(equalTo: self.questionAnswer9StackView.bottomAnchor, constant: 10),
            self.question10View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question10View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer10StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer10StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.question11View.topAnchor.constraint(equalTo: self.questionAnswer10StackView.bottomAnchor, constant: 10),
            self.question11View.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.question11View.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),

            self.questionAnswer11StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer11StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            self.questionAnswer11StackView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -10),

            self.tabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}
//MARK: - Extension UITapGestureRecognizer

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
