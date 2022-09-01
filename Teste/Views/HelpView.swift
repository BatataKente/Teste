//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        return tabBar
    }()
    
    private lazy var leroLeroView: UIView = {
        
        let leroLeroView = UIView()
        leroLeroView.backgroundColor = .red
        return leroLeroView
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
    
    private lazy var questionsScrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var viewToScroll: UIView = {
        
        let uiView = UIView()
        uiView.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        
        return uiView
    }()
    
    private lazy var questionsStackView: UIStackView = {
        
        var views = [UIView]()
        
        views.append(createQuestionView(question: helpViewModel.returnHelp(number: 0).question,
                                        answer: helpViewModel.returnHelp(number: 0).answer,
                                        hideAnswerLabel: false))
        
        for i in 1...helpViewModel.getQuestionsAmmount()-1 {
            
            views.append(createQuestionView(question: helpViewModel.returnHelp(number: i).question,
                                            answer: helpViewModel.returnHelp(number: i).answer))
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
        view.addSubviews([questionsScrollView, customBar, tabBar])
        questionsScrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([headerView, questionsStackView])
        headerView.addSubviews([wayHelpImageView, vectorHelpImageView, FAQViewLabel])
        
        tabBar.selectedItem = tabBar.items?[2]
        setupDefaults()
        configConstraints()
    }
    
    private func createQuestionView(question: String,
                                    answer: String,
                                    hideAnswerLabel: Bool = true) -> UIView {
        
        let questionLabel = UILabel()
        questionLabel.text = question
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.font = UIFont(name: FontsBravve.koho.rawValue, size: 17)
        questionLabel.textColor = UIColor(named: ColorsBravve.progressBarLabel.rawValue)
        questionLabel.textAlignment = .left
        questionLabel.numberOfLines = 0
        
        
        
        let answerLabel = UILabel()
        answerLabel.isUserInteractionEnabled = true
        answerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                action: #selector(labelGesture(gesture:))))
        let yourAttributes: [NSAttributedString.Key: Any] = [
            
            .font: UIFont(name: FontsBravve.regular.rawValue, size: 15) as Any,
            .foregroundColor: UIColor(named: ColorsBravve.label.rawValue) as Any
        ]
        let attributeAnswer = NSMutableAttributedString(string: answer,
                                                        attributes: yourAttributes)
        
        answerLabel.attributedText = attributeAnswer
        answerLabel.lineBreakMode = .byWordWrapping
        answerLabel.textAlignment = .left
        answerLabel.numberOfLines = 0
        answerLabel.isHidden = hideAnswerLabel
        
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
        
        if hideAnswerLabel {
            
            answerButton.setImage(UIImage(named: ButtonsBravve.mostButton.rawValue),
                                  for: .normal)
        }
        else {
            
            answerConstraint.constant = CGFloat(-10).generateSizeForScreen
            answerButton.setImage(UIImage(named: ButtonsBravve.lessButton.rawValue),
                                  for: .normal)
        }
        
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
    
    @objc func labelGesture(gesture: UITapGestureRecognizer) {
        
        guard let label = gesture.view as? UILabel else {return}
        
        print(calculateMaxLines(label))
    }
    
    func calculateWordLine(_ label: UILabel) -> Int {
        
        let maxSize = CGSize(width: label.frame.size.width,
                             height: CGFloat(Float.infinity))
        let charSize = label.font.lineHeight
        let text = (label.text ?? "") as NSString
        
        let textSize = text.boundingRect(with: maxSize,
                                         options: .usesLineFragmentOrigin,
                                         attributes: [NSAttributedString.Key.font: label.font as Any],
                                         context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        
        return linesRoundedUp
    }
    
    func calculateMaxLines(_ label: UILabel) -> Int {
        
        let maxSize = CGSize(width: label.frame.size.width,
                             height: CGFloat(Float.infinity))
        let charSize = label.font.lineHeight
        let text = (label.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize,
                                         options: .usesLineFragmentOrigin,
                                         attributes: [NSAttributedString.Key.font: label.font as Any],
                                         context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        
        return linesRoundedUp
    }
    
    private func setupDefaults() {
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            
            let navBar = PersonalProfileView()
            navBar.modalPresentationStyle = .fullScreen
            self.present(navBar, animated: false)
        }
    }
    
    private func configConstraints() {
        
        questionsScrollView.constraintOutsideTo(.top, customBar)
        questionsScrollView.constraintInsideTo(.leading, view)
        questionsScrollView.constraintInsideTo(.trailing, view)
        questionsScrollView.constraintOutsideTo(.bottom, tabBar)
        
        viewToScroll.constraintInsideTo(.top, questionsScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, questionsScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, questionsScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, questionsScrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, questionsScrollView.frameLayoutGuide)
        
        headerView.constraintInsideTo(.top, viewToScroll)
        headerView.constraintInsideTo(.leading, viewToScroll)
        headerView.constraintInsideTo(.trailing, viewToScroll)
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
        questionsStackView.constraintInsideTo(.leading, viewToScroll, CGFloat(40).generateSizeForScreen)
        questionsStackView.constraintInsideTo(.trailing, viewToScroll, CGFloat(40).generateSizeForScreen)
        questionsStackView.constraintInsideTo(.bottom, viewToScroll, CGFloat(40).generateSizeForScreen)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
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
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
