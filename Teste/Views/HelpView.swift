//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

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
    let stackTop: CGFloat = 0
    let stackLeft: CGFloat = 25
    let stackRight: CGFloat = 25
    let stackBottom: CGFloat = 0
    
    private lazy var tabBar = BravveTabBar(self,
                                           itemImagesNames: [ButtonsBravve.locationGray.rawValue,
                                                             ButtonsBravve.calendarButtonGray.rawValue,
                                                             ButtonsBravve.userLoginGray.rawValue
                                                            ])
    
    private lazy var backgroundCellView: UIView = {
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
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: view.bounds)
        scroll.isScrollEnabled = true
        scroll.addSubviews([uiView, backgroundCellView, questionAnswer1StackView, questionAnswer2StackView, questionAnswer3StackView, questionAnswer4StackView, questionAnswer5StackView, questionAnswer6StackView, questionAnswer7StackView, questionAnswer8StackView, questionAnswer9StackView, questionAnswer10StackView, questionAnswer11StackView])
        return scroll
    }()
    
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    lazy var answer1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 0).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = false
        
        return label
    }()
    
    lazy var answer2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 1).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer3Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 2).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer4Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 3).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer5Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 4).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer6Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 5).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer7Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 6).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer8Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 7).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer9Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 8).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer10Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 9).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var answer11Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.attributedText = self.viewModel.returnHelp(number: 10).answer
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    lazy var questionAnswer1StackView: UIStackView = {
        
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
        
        let question1View = UIView()
        question1View.translatesAutoresizingMaskIntoConstraints = false
        question1View.addSubviews([question1Label, showAnswer1Button, invisible1Button])
        
        NSLayoutConstraint.activate([
            question1Label.topAnchor.constraint(equalTo: question1View.topAnchor, constant: 14),
            question1Label.leadingAnchor.constraint(equalTo: question1View.leadingAnchor, constant: 25),
            question1Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer1Button.leadingAnchor.constraint(equalTo: question1Label.trailingAnchor, constant: 34),
            showAnswer1Button.centerYAnchor.constraint(equalTo: question1Label.centerYAnchor),
            
            invisible1Button.topAnchor.constraint(equalTo: question1View.topAnchor),
            invisible1Button.leadingAnchor.constraint(equalTo: question1View.leadingAnchor),
            invisible1Button.trailingAnchor.constraint(equalTo: question1View.trailingAnchor),
            invisible1Button.bottomAnchor.constraint(equalTo: question1View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question1View, answer1Label])
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
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
            question1View.topAnchor.constraint(equalTo: stack.topAnchor),
            question1View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question1View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer1Label.topAnchor.constraint(equalTo: question1Label.bottomAnchor, constant: 10),
            answer1Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer1Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer1Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer2StackView: UIStackView = {
        
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
        
        let question2View = UIView()
        question2View.translatesAutoresizingMaskIntoConstraints = false
        question2View.addSubviews([question2Label, showAnswer2Button, invisible2Button])
        
        NSLayoutConstraint.activate([
            question2Label.centerYAnchor.constraint(equalTo: question2View.centerYAnchor),
            question2Label.leadingAnchor.constraint(equalTo: question2View.leadingAnchor, constant: 25),
            question2Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer2Button.leadingAnchor.constraint(equalTo: question2Label.trailingAnchor, constant: 34),
            showAnswer2Button.centerYAnchor.constraint(equalTo: question2Label.centerYAnchor),
            
            invisible2Button.topAnchor.constraint(equalTo: question2View.topAnchor),
            invisible2Button.leadingAnchor.constraint(equalTo: question2View.leadingAnchor),
            invisible2Button.trailingAnchor.constraint(equalTo: question2View.trailingAnchor),
            invisible2Button.bottomAnchor.constraint(equalTo: question2View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question2View, answer2Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question2View.topAnchor.constraint(equalTo: stack.topAnchor),
            question2View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question2View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer2Label.topAnchor.constraint(equalTo: question2Label.bottomAnchor, constant: 10),
            answer2Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer2Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer2Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer3StackView: UIStackView = {
        
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
        
        let question3View = UIView()
        question3View.translatesAutoresizingMaskIntoConstraints = false
        question3View.addSubviews([question3Label, showAnswer3Button, invisible3Button])
        
        NSLayoutConstraint.activate([
            question3Label.topAnchor.constraint(equalTo: question3View.topAnchor, constant: 14),
            question3Label.leadingAnchor.constraint(equalTo: question3View.leadingAnchor, constant: 25),
            question3Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer3Button.leadingAnchor.constraint(equalTo: question3Label.trailingAnchor, constant: 34),
            showAnswer3Button.centerYAnchor.constraint(equalTo: question3Label.centerYAnchor),
            
            invisible3Button.topAnchor.constraint(equalTo: question3View.topAnchor),
            invisible3Button.leadingAnchor.constraint(equalTo: question3View.leadingAnchor),
            invisible3Button.trailingAnchor.constraint(equalTo: question3View.trailingAnchor),
            invisible3Button.bottomAnchor.constraint(equalTo: question3View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question3View, answer3Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question3View.topAnchor.constraint(equalTo: stack.topAnchor),
            question3View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question3View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer3Label.topAnchor.constraint(equalTo: question3Label.bottomAnchor, constant: 10),
            answer3Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer3Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer3Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer4StackView: UIStackView = {
        
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
        
        let question4View = UIView()
        question4View.translatesAutoresizingMaskIntoConstraints = false
        question4View.addSubviews([question4Label, showAnswer4Button, invisible4Button])
        
        NSLayoutConstraint.activate([
            question4Label.topAnchor.constraint(equalTo: question4View.topAnchor, constant: 14),
            question4Label.leadingAnchor.constraint(equalTo: question4View.leadingAnchor, constant: 25),
            question4Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer4Button.leadingAnchor.constraint(equalTo: question4Label.trailingAnchor, constant: 34),
            showAnswer4Button.centerYAnchor.constraint(equalTo: question4Label.centerYAnchor),
            
            invisible4Button.topAnchor.constraint(equalTo: question4View.topAnchor),
            invisible4Button.leadingAnchor.constraint(equalTo: question4View.leadingAnchor),
            invisible4Button.trailingAnchor.constraint(equalTo: question4View.trailingAnchor),
            invisible4Button.bottomAnchor.constraint(equalTo: question4View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question4View, answer4Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question4View.topAnchor.constraint(equalTo: stack.topAnchor),
            question4View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question4View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer4Label.topAnchor.constraint(equalTo: question4Label.bottomAnchor, constant: 10),
            answer4Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer4Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer4Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer5StackView: UIStackView = {
        
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
        
        let question5View = UIView()
        question5View.translatesAutoresizingMaskIntoConstraints = false
        question5View.addSubviews([question5Label, showAnswer5Button, invisible5Button])
        
        NSLayoutConstraint.activate([
            question5Label.topAnchor.constraint(equalTo: question5View.topAnchor, constant: 14),
            question5Label.leadingAnchor.constraint(equalTo: question5View.leadingAnchor, constant: 25),
            question5Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer5Button.leadingAnchor.constraint(equalTo: question5Label.trailingAnchor, constant: 34),
            showAnswer5Button.centerYAnchor.constraint(equalTo: question5Label.centerYAnchor),
            
            invisible5Button.topAnchor.constraint(equalTo: question5View.topAnchor),
            invisible5Button.leadingAnchor.constraint(equalTo: question5View.leadingAnchor),
            invisible5Button.trailingAnchor.constraint(equalTo: question5View.trailingAnchor),
            invisible5Button.bottomAnchor.constraint(equalTo: question5View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question5View, answer5Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question5View.topAnchor.constraint(equalTo: stack.topAnchor),
            question5View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question5View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer5Label.topAnchor.constraint(equalTo: question5Label.bottomAnchor, constant: 10),
            answer5Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer5Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer5Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer6StackView: UIStackView = {
        
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
        
        let question6View = UIView()
        question6View.translatesAutoresizingMaskIntoConstraints = false
        question6View.addSubviews([question6Label, showAnswer6Button, invisible6Button])
        
        NSLayoutConstraint.activate([
            question6Label.topAnchor.constraint(equalTo: question6View.topAnchor, constant: 14),
            question6Label.leadingAnchor.constraint(equalTo: question6View.leadingAnchor, constant: 25),
            question6Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer6Button.leadingAnchor.constraint(equalTo: question6Label.trailingAnchor, constant: 34),
            showAnswer6Button.centerYAnchor.constraint(equalTo: question6Label.centerYAnchor),
            
            invisible6Button.topAnchor.constraint(equalTo: question6View.topAnchor),
            invisible6Button.leadingAnchor.constraint(equalTo: question6View.leadingAnchor),
            invisible6Button.trailingAnchor.constraint(equalTo: question6View.trailingAnchor),
            invisible6Button.bottomAnchor.constraint(equalTo: question6View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question6View, answer6Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question6View.topAnchor.constraint(equalTo: stack.topAnchor),
            question6View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question6View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer6Label.topAnchor.constraint(equalTo: question6Label.bottomAnchor, constant: 10),
            answer6Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer6Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer6Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer7StackView: UIStackView = {
        
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
        
        let question7View = UIView()
        question7View.translatesAutoresizingMaskIntoConstraints = false
        question7View.addSubviews([question7Label, showAnswer7Button, invisible7Button])
        
        NSLayoutConstraint.activate([
            question7Label.topAnchor.constraint(equalTo: question7View.topAnchor, constant: 14),
            question7Label.leadingAnchor.constraint(equalTo: question7View.leadingAnchor, constant: 25),
            question7Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer7Button.leadingAnchor.constraint(equalTo: question7Label.trailingAnchor, constant: 34),
            showAnswer7Button.centerYAnchor.constraint(equalTo: question7Label.centerYAnchor),
            
            invisible7Button.topAnchor.constraint(equalTo: question7View.topAnchor),
            invisible7Button.leadingAnchor.constraint(equalTo: question7View.leadingAnchor),
            invisible7Button.trailingAnchor.constraint(equalTo: question7View.trailingAnchor),
            invisible7Button.bottomAnchor.constraint(equalTo: question7View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question7View, answer7Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question7View.topAnchor.constraint(equalTo: stack.topAnchor),
            question7View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question7View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer7Label.topAnchor.constraint(equalTo: question7Label.bottomAnchor, constant: 10),
            answer7Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer7Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer7Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer8StackView: UIStackView = {
        
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
        
        let question8View = UIView()
        question8View.translatesAutoresizingMaskIntoConstraints = false
        question8View.addSubviews([question8Label, showAnswer8Button, invisible8Button])
        
        NSLayoutConstraint.activate([
            question8Label.topAnchor.constraint(equalTo: question8View.topAnchor, constant: 14),
            question8Label.leadingAnchor.constraint(equalTo: question8View.leadingAnchor, constant: 25),
            question8Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer8Button.leadingAnchor.constraint(equalTo: question8Label.trailingAnchor, constant: 34),
            showAnswer8Button.centerYAnchor.constraint(equalTo: question8Label.centerYAnchor),
            
            invisible8Button.topAnchor.constraint(equalTo: question8View.topAnchor),
            invisible8Button.leadingAnchor.constraint(equalTo: question8View.leadingAnchor),
            invisible8Button.trailingAnchor.constraint(equalTo: question8View.trailingAnchor),
            invisible8Button.bottomAnchor.constraint(equalTo: question8View.bottomAnchor),
            
        ])
        
        
        let stack = UIStackView(arrangedSubviews: [question8View, answer8Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question8View.topAnchor.constraint(equalTo: stack.topAnchor),
            question8View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question8View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer8Label.topAnchor.constraint(equalTo: question8Label.bottomAnchor, constant: 10),
            answer8Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer8Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer8Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer9StackView: UIStackView = {
        
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
        
        let question9View = UIView()
        question9View.translatesAutoresizingMaskIntoConstraints = false
        question9View.addSubviews([question9Label, showAnswer9Button, invisible9Button])
        
        NSLayoutConstraint.activate([
            question9Label.topAnchor.constraint(equalTo: question9View.topAnchor, constant: 14),
            question9Label.leadingAnchor.constraint(equalTo: question9View.leadingAnchor, constant: 25),
            question9Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer9Button.leadingAnchor.constraint(equalTo: question9Label.trailingAnchor, constant: 34),
            showAnswer9Button.centerYAnchor.constraint(equalTo: question9Label.centerYAnchor),
            
            invisible9Button.topAnchor.constraint(equalTo: question9View.topAnchor),
            invisible9Button.leadingAnchor.constraint(equalTo: question9View.leadingAnchor),
            invisible9Button.trailingAnchor.constraint(equalTo: question9View.trailingAnchor),
            invisible9Button.bottomAnchor.constraint(equalTo: question9View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question9View, answer9Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question9View.topAnchor.constraint(equalTo: stack.topAnchor),
            question9View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question9View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer9Label.topAnchor.constraint(equalTo: question9Label.bottomAnchor, constant: 10),
            answer9Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer9Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer9Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer10StackView: UIStackView = {
        
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
        
        let question10View = UIView()
        question10View.translatesAutoresizingMaskIntoConstraints = false
        question10View.addSubviews([question10Label, showAnswer10Button, invisible10Button])
        
        NSLayoutConstraint.activate([
            question10Label.topAnchor.constraint(equalTo: question10View.topAnchor, constant: 14),
            question10Label.leadingAnchor.constraint(equalTo: question10View.leadingAnchor, constant: 25),
            question10Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer10Button.leadingAnchor.constraint(equalTo: question10Label.trailingAnchor, constant: 34),
            showAnswer10Button.centerYAnchor.constraint(equalTo: question10Label.centerYAnchor),
            
            invisible10Button.topAnchor.constraint(equalTo: question10View.topAnchor),
            invisible10Button.leadingAnchor.constraint(equalTo: question10View.leadingAnchor),
            invisible10Button.trailingAnchor.constraint(equalTo: question10View.trailingAnchor),
            invisible10Button.bottomAnchor.constraint(equalTo: question10View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question10View, answer10Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = stack.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question10View.topAnchor.constraint(equalTo: stack.topAnchor),
            question10View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question10View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer10Label.topAnchor.constraint(equalTo: question10Label.bottomAnchor, constant: 10),
            answer10Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer10Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer10Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    lazy var questionAnswer11StackView: UIStackView = {
        
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
        
        let question11View = UIView()
        question11View.translatesAutoresizingMaskIntoConstraints = false
        question11View.addSubviews([question11Label, showAnswer11Button, invisible11Button])
        
        NSLayoutConstraint.activate([
            question11Label.topAnchor.constraint(equalTo: question11View.topAnchor, constant: 14),
            question11Label.leadingAnchor.constraint(equalTo: question11View.leadingAnchor, constant: 25),
            question11Label.widthAnchor.constraint(equalToConstant: 192),
            
            showAnswer11Button.leadingAnchor.constraint(equalTo: question11Label.trailingAnchor, constant: 34),
            showAnswer11Button.centerYAnchor.constraint(equalTo: question11Label.centerYAnchor),
            
            invisible11Button.topAnchor.constraint(equalTo: question11View.topAnchor),
            invisible11Button.leadingAnchor.constraint(equalTo: question11View.leadingAnchor),
            invisible11Button.trailingAnchor.constraint(equalTo: question11View.trailingAnchor),
            invisible11Button.bottomAnchor.constraint(equalTo: question11View.bottomAnchor),
            
        ])
        
        let stack = UIStackView(arrangedSubviews: [question11View, answer11Label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: stackTop, left: stackLeft, bottom: stackBottom, right: stackRight)
        stack.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        stack.frame = view.bounds
        stack.layer.cornerRadius = 15
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.5
        stack.layer.shadowRadius = 8
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            question11View.topAnchor.constraint(equalTo: stack.topAnchor),
            question11View.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            question11View.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            answer11Label.topAnchor.constraint(equalTo: question11Label.bottomAnchor, constant: 10),
            answer11Label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25),
            answer11Label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -29),
            answer11Label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -23),
        ])
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([scrollView, customBar, tabBar])
        self.arrayAnswer = [answer1Label, answer2Label, answer3Label, answer4Label, answer5Label, answer6Label, answer7Label, answer8Label, answer9Label, answer10Label, answer11Label]
        self.arrayButtons =  [showAnswer1Button, showAnswer2Button, showAnswer3Button, showAnswer4Button, showAnswer5Button, showAnswer6Button, showAnswer7Button, showAnswer8Button, showAnswer9Button, showAnswer10Button, showAnswer11Button]
        self.arrayStackViews = [questionAnswer1StackView, questionAnswer2StackView, questionAnswer3StackView, questionAnswer4StackView, questionAnswer5StackView, questionAnswer6StackView, questionAnswer7StackView, questionAnswer8StackView, questionAnswer9StackView, questionAnswer10StackView, questionAnswer11StackView]
        setupDefaults()
        configConstraints()
    }
    
    private func setupDefaults() {
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            let navBar = HelpViewController()
            navBar.modalPresentationStyle = .fullScreen
            self.present(navBar, animated: false)
        }
    }
    
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
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.view.heightAnchor.constraint(equalToConstant: 2200),
            
            self.scrollView.topAnchor.constraint(equalTo: self.customBar.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor),
            
            self.uiView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.uiView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.uiView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.uiView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: CGFloat(-20).generateSizeForScreen),
            self.uiView.heightAnchor.constraint(equalToConstant: CGFloat(2180).generateSizeForScreen),
            self.uiView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            self.backgroundCellView.topAnchor.constraint(equalTo: self.uiView.topAnchor, constant: 74),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor),
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
            self.FAQViewLabel.trailingAnchor.constraint(equalTo: self.backgroundCellView.trailingAnchor, constant: CGFloat(-140.99).generateSizeForScreen),
            self.FAQViewLabel.leadingAnchor.constraint(equalTo: self.backgroundCellView.leadingAnchor, constant: CGFloat(32.99).generateSizeForScreen),
            
            self.questionAnswer1StackView.topAnchor.constraint(equalTo: self.vectorHelpImageView.bottomAnchor, constant: 20),
            self.questionAnswer1StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer1StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer2StackView.topAnchor.constraint(equalTo: self.questionAnswer1StackView.bottomAnchor, constant: 10),
            self.questionAnswer2StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer2StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer3StackView.topAnchor.constraint(equalTo: self.questionAnswer2StackView.bottomAnchor, constant: 10),
            self.questionAnswer3StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer3StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer4StackView.topAnchor.constraint(equalTo: self.questionAnswer3StackView.bottomAnchor, constant: 10),
            self.questionAnswer4StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer4StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer5StackView.topAnchor.constraint(equalTo: self.questionAnswer4StackView.bottomAnchor, constant: 10),
            self.questionAnswer5StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer5StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer6StackView.topAnchor.constraint(equalTo: self.questionAnswer5StackView.bottomAnchor, constant: 10),
            self.questionAnswer6StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer6StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer7StackView.topAnchor.constraint(equalTo: self.questionAnswer6StackView.bottomAnchor, constant: 10),
            self.questionAnswer7StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer7StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer8StackView.topAnchor.constraint(equalTo: self.questionAnswer7StackView.bottomAnchor, constant: 10),
            self.questionAnswer8StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer8StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer9StackView.topAnchor.constraint(equalTo: self.questionAnswer8StackView.bottomAnchor, constant: 10),
            self.questionAnswer9StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer9StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer10StackView.topAnchor.constraint(equalTo: self.questionAnswer9StackView.bottomAnchor, constant: 10),
            self.questionAnswer10StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer10StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
            
            self.questionAnswer11StackView.topAnchor.constraint(equalTo: self.questionAnswer10StackView.bottomAnchor, constant: 10),
            self.questionAnswer11StackView.leadingAnchor.constraint(equalTo: self.uiView.leadingAnchor, constant: 40),
            self.questionAnswer11StackView.trailingAnchor.constraint(equalTo: self.uiView.trailingAnchor, constant: -40),
        ])
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}



