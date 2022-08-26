//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class HelpView: UIViewController {
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        return tabBar
    }()
    
    private lazy var headerView: UIView = {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        return headerView
    }()
    
    private lazy var wayHelpImageView: UIImageView = {
        
        let wayHelpImageView = UIImageView()
        wayHelpImageView.image = UIImage(named: "wayHelp")
        wayHelpImageView.tintColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        wayHelpImageView.contentMode = .scaleToFill
        return wayHelpImageView
    }()
    
    private lazy var vectorHelpImageView: UIImageView = {
        
        let vectorHelpImageView = UIImageView()
        vectorHelpImageView.image = UIImage(named: "vectorHelp")
        vectorHelpImageView.contentMode = .scaleToFill
        return vectorHelpImageView
    }()
    
    private lazy var FAQViewLabel: UILabel = {
        
        let FAQViewLabel = UILabel()
        FAQViewLabel.text = "Encontre as respostas para suas perguntas!"
        FAQViewLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        FAQViewLabel.textColor = .white
        FAQViewLabel.numberOfLines = 0
        FAQViewLabel.textAlignment = .left
        return FAQViewLabel
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var uiView: UIView = {
        
        let uiView = UIView()
        uiView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        
        return uiView
    }()
    
    private lazy var questionsStackView: UIStackView = {
        
        var views = [UIView]()
        
        for i in 0...helpViewModel.getQuestionsAmmount()-1 {
            
            views.append(createQuestion(question: helpViewModel.returnHelp(number: i).question, answer: helpViewModel.returnHelp(number: i).answer))
        }
        
        let questionsStackView = UIStackView(arrangedSubviews: views)
        questionsStackView.spacing = CGFloat(10).generateSizeForScreen
        questionsStackView.axis = .vertical
        
        return questionsStackView
    }()
    
    private var helpViewModel: HelpViewModel = HelpViewModel()
    private let customBar = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        view.addSubviews([scrollView, customBar, tabBar])
        scrollView.addSubview(uiView)
        uiView.addSubviews([headerView, questionsStackView])
        headerView.addSubviews([wayHelpImageView, vectorHelpImageView, FAQViewLabel])
        
        tabBar.selectedItem = tabBar.items?[2]
        setupDefaults()
        configConstraints()
    }
    
    private func createQuestion(question: String, answer: NSAttributedString) -> UIView {
        
        let questionLabel = UILabel()
        questionLabel.text = question
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
        questionLabel.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        questionLabel.textAlignment = .left
        questionLabel.numberOfLines = 0
        
        let answerLabel = UILabel()
        answerLabel.attributedText = answer
        answerLabel.lineBreakMode = .byWordWrapping
        answerLabel.font = UIFont(name: FontsBravve.regular.rawValue, size: 15)
        answerLabel.textColor = UIColor(named: ColorsBravve.label.rawValue)
        answerLabel.textAlignment = .left
        answerLabel.numberOfLines = 0
        answerLabel.isHidden = true
        
        let answerStackView = UIStackView(arrangedSubviews: [answerLabel])
        
        let questionView = UIView()
        questionView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        questionView.layer.shadowColor = UIColor.black.cgColor
        questionView.layer.shadowOpacity = 0.5
        questionView.layer.shadowRadius = 8
        questionView.layer.shadowOffset = CGSize(width: 0, height: 4)
        questionView.layer.cornerRadius = CGFloat(15).generateSizeForScreen
        
        let answerConstraint = NSLayoutConstraint(item: answerStackView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: questionView,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        let answerButton = UIButton()
        answerButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue),
                              for: .normal)
        
        let handler = {(action: UIAction) in
            
            if answerLabel.isHidden {
                
                answerConstraint.constant = CGFloat(-10).generateSizeForScreen
                answerButton.setImage(UIImage(named: ButtonsBravve.lessButton.rawValue),
                                      for: .normal)
                answerLabel.isHidden = false
            }
            else {
                
                answerConstraint.constant = CGFloat(0).generateSizeForScreen
                answerButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue),
                                      for: .normal)
                answerLabel.isHidden = true
            }
        }
        
        answerButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        questionView.addSubviews([questionLabel, answerStackView, answerButton])
        
        questionLabel.constraintInsideTo(.top, questionView,
                                         CGFloat(15).generateSizeForScreen)
        questionLabel.constraintInsideTo(.leading, questionView,
                                         CGFloat(25).generateSizeForScreen)
        questionLabel.constraintInsideTo(.trailing, questionView,
                                          CGFloat(80).generateSizeForScreen)
        
        answerButton.constraintInsideTo(.centerY, questionLabel)
        answerButton.heightAnchorInSuperview(CGFloat(20).generateSizeForScreen)
        answerButton.constraintOutsideTo(.width, answerButton)
        answerButton.constraintInsideTo(.trailing, questionView,
                                        CGFloat(25).generateSizeForScreen)
        
        answerStackView.constraintOutsideTo(.top, questionLabel,
                                        CGFloat(10).generateSizeForScreen)
        answerStackView.constraintInsideTo(.leading, questionLabel)
        answerStackView.constraintInsideTo(.trailing, answerButton)
        
        questionView.addConstraint(answerConstraint)
        
        return questionView
    }
    
    private func setupDefaults() {
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            let navBar = PersonalProfileView()
            navBar.modalPresentationStyle = .fullScreen
            self.present(navBar, animated: false)
        }
    }
    
    private func configConstraints() {
        
        scrollView.constraintOutsideTo(.top, customBar)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, tabBar)
        
        uiView.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        uiView.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        uiView.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        uiView.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        uiView.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        headerView.constraintInsideTo(.top, uiView)
        headerView.constraintInsideTo(.leading, uiView)
        headerView.constraintInsideTo(.trailing, uiView)
        headerView.heightAnchorInSuperview(CGFloat(222).generateSizeForScreen)
        
        vectorHelpImageView.constraintInsideTo(.leading, headerView)
        vectorHelpImageView.constraintInsideTo(.trailing, headerView)
        vectorHelpImageView.constraintInsideTo(.bottom, headerView)
        vectorHelpImageView.heightAnchorInSuperview(CGFloat(38).generateSizeForScreen)
        
        wayHelpImageView.constraintInsideTo(.top, headerView)
        wayHelpImageView.constraintInsideTo(.trailing, headerView)
        wayHelpImageView.constraintInsideTo(.bottom, headerView)
        wayHelpImageView.widthAnchorInSuperview(CGFloat(156.77).generateSizeForScreen)
        
        FAQViewLabel.constraintInsideTo(.top, headerView, CGFloat(80).generateSizeForScreen)
        FAQViewLabel.constraintInsideTo(.trailing, headerView, CGFloat(140.99).generateSizeForScreen)
        FAQViewLabel.constraintInsideTo(.leading, headerView, CGFloat(32.99).generateSizeForScreen)
        
        questionsStackView.constraintOutsideTo(.top, headerView, CGFloat(33).generateSizeForScreen)
        questionsStackView.constraintInsideTo(.leading, uiView, CGFloat(40).generateSizeForScreen)
        questionsStackView.constraintInsideTo(.trailing, uiView, CGFloat(40).generateSizeForScreen)
        questionsStackView.constraintInsideTo(.bottom, uiView, CGFloat(40).generateSizeForScreen)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}
