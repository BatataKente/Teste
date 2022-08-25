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
        questionsStackView.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
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
        questionLabel.numberOfLines = 0
        
        let answerLabel = UILabel()
        answerLabel.attributedText = answer
        answerLabel.isHidden = true
        answerLabel.numberOfLines = 0
        
        let answerStackView = UIStackView(arrangedSubviews: [answerLabel])
        
        let answerButton = UIButton()
        answerButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue),
                              for: .normal)
        
        let handler = {(action: UIAction) in
            
            if answerLabel.isHidden {
                
                answerButton.setImage(UIImage(named: ButtonsBravve.lessButton.rawValue),
                                      for: .normal)
                answerLabel.isHidden = false
            }
            else {
                
                answerButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue),
                                      for: .normal)
                answerLabel.isHidden = true
            }
        }
        
        answerButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        let questionView = UIView()
        questionView.addSubviews([questionLabel, answerStackView, answerButton])
        
        questionLabel.constraintInsideTo(.top, questionView,
                                         CGFloat(15).generateSizeForScreen)
        questionLabel.constraintInsideTo(.leading, questionView,
                                         CGFloat(25).generateSizeForScreen)
        questionLabel.constraintOutsideTo(.trailing, answerButton,
                                          CGFloat(35).generateSizeForScreen)
        
        answerButton.constraintInsideTo(.centerY, questionLabel)
        answerButton.constraintInsideTo(.trailing, questionView,
                                        CGFloat(25).generateSizeForScreen)
        
        answerStackView.constraintOutsideTo(.top, questionLabel,
                                        CGFloat(10).generateSizeForScreen)
        answerStackView.constraintInsideTo(.leading, questionLabel)
        answerStackView.constraintInsideTo(.trailing, answerButton)
        answerStackView.constraintInsideTo(.bottom, questionView,
                                       CGFloat(25).generateSizeForScreen)
        
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



