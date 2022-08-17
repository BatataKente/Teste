//
//  FAQScrollViewTesteViewController.swift
//  Teste
//
//  Created by user217584 on 15/08/22.
//

import Foundation
import UIKit

class FAQScrollViewTesteViewController: UIViewController {
    
    private var viewModel: HelpViewModel = HelpViewModel()
    private let customBar = UIView()
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
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
        scroll.addSubviews([uiView, backgroundCellView, wayHelpImageView, vectorHelpImageView, FAQViewLabel])
        return scroll
    }()
    
    private lazy var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        view.addSubviews([scrollView,customBar])
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
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.view.heightAnchor.constraint(equalToConstant: 1000),
            
            self.scrollView.topAnchor.constraint(equalTo: self.customBar.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.uiView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.uiView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.uiView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.uiView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: CGFloat(-20).generateSizeForScreen),
            self.uiView.heightAnchor.constraint(equalToConstant: CGFloat(980).generateSizeForScreen),
            self.uiView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            self.backgroundCellView.topAnchor.constraint(equalTo: self.customBar.bottomAnchor),
            self.backgroundCellView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.backgroundCellView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
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
            ])
    }
}
