//
//  HomeView.swift
//  Teste
//
//  Created by Josicleison on 22/07/22.
//

import UIKit

class HomeAbertaView: UIViewController {
    
    private let detailsView: UIView = {
        
        let detailsView = UIView()
        detailsView.backgroundColor = .yellow
        
        return detailsView
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.addSubview(detailsView)
        scrollView.isHidden = true
        scrollView.alwaysBounceVertical = false
        
        return scrollView
    }()
    
    private var espacos = 10
    
    private let titleLabel = UILabel()
    
    private let reserveButton: UIButton = {
        
        let reserveButton = UIButton()
        reserveButton.isHidden = true
        
        return reserveButton
    }()
    
    private lazy var navigationBarController: (navigationBar: UINavigationBar,
                                               navigationBarStackView: UIStackView) = {
        
        guard let navigationBar = navigationController?.navigationBar else {
            
            return (navigationBar: UINavigationBar(),
                    navigationBarStackView: UIStackView())
        }
        
        let navigationBarStackViewFrame = CGRect(x: 25,
                                                 y: navigationBar.frame.size.height/4,
                                                 width: navigationBar.frame.size.width*0.8,
                                                 height: navigationBar.frame.size.height/2)
        
        let navigationBarStackView = UIStackView(frame: navigationBarStackViewFrame)
        
        navigationBarStackView.addArrangedSubview(viewElements.leftStackView)
        navigationBarStackView.addArrangedSubview(viewElements.leftButton)
        navigationBarStackView.addArrangedSubview(viewElements.rightStackView)
        navigationBarStackView.addArrangedSubview(viewElements.rightButton)
        
        navigationBarStackView.backgroundColor = .white
        navigationBarStackView.layer.cornerRadius = 8
        navigationBarStackView.setToDefaultBackgroundColor()
        navigationBarStackView.isLayoutMarginsRelativeArrangement = true
        navigationBarStackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
        navigationBar.addSubview(navigationBarStackView)
        
        return (navigationBar: navigationBar,
                navigationBarStackView: navigationBarStackView)
    }()
    
    let filterLabels: [UILabel] = {
        
        var filterLabels: [UILabel] = []
        
        let label1 = UILabel()
        label1.text = "Colaborativo"
        label1.numberOfLines = 0
        label1.backgroundColor = .blue
        label1.layer.masksToBounds = true
        label1.textColor = .white
        label1.textAlignment = .center
        
        filterLabels.append(label1)
        
        let label2 = UILabel()
        label2.text = "Colaborativo"
        label2.numberOfLines = 0
        label2.backgroundColor = .blue
        label2.layer.masksToBounds = true
        label2.textColor = .white
        label2.textAlignment = .center
        
        filterLabels.append(label2)
        
        return filterLabels
    }()
    
    private lazy var filterStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: filterLabels)
        stackView.backgroundColor = .white
        stackView.isHidden = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
        return stackView
    }()
    
    let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.register(HomeAbertaTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.layoutMargins = UIEdgeInsets(top: 20,
                                               left: 20,
                                               bottom: 20,
                                               right: 20)
        
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [filterStackView,
                                                       tableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private let viewElements: (leftStackView: UIStackView,
                               leftButton: UIButton,
                               rightStackView: UIStackView,
                               rightButton: UIButton) = {
        
        let leftButton = UIButton(),
            stateLabel = UILabel(),
            stateChosedLabel = UILabel(),
            leftStackView = UIStackView(arrangedSubviews: [stateLabel,
                                                           stateChosedLabel]),
            rightButton = UIButton(),
            cityLabel = UILabel(),
            cityChosedLabel = UILabel(),
            rightStackView = UIStackView(arrangedSubviews: [cityLabel,
                                                            cityChosedLabel])
        
        let handler = {(action: UIAction) in
            
            print(action.title)
        }
        
        stateLabel.text = "UF"
        leftButton.setMenuForButton([
            
            UIAction(title: "action1",handler: handler),
            UIAction(title: "action2",handler: handler)
        
        ])
        leftButton.setTitle("", for: .normal)
        
        cityLabel.text = "Cidade"
        rightButton.setMenuForButton([
            
            UIAction(title: "action1",handler: handler),
            UIAction(title: "action2",handler: handler)
        
        ])
        rightButton.setTitle("", for: .normal)
        
        return (leftStackView: leftStackView,
                leftButton: leftButton,
                rightStackView: rightStackView,
                rightButton: rightButton)
    }()
    
    let tabBar: UITabBar = {

        let tabBar = UITabBar()
        tabBar.barTintColor = .red

        return tabBar
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        for label in filterLabels {
            
            label.layer.cornerRadius = label.frame.size.height/2
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupDefaults()
    }
    
    private func setupView() {
        
        view.addSubviews([scrollView, stackView, tabBar, reserveButton])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        reserveButton.setToBottomButtonDefault(aboveWhom: tabBar)
    }
    
    private func setupConstraints() {
        
        viewElements.leftStackView.widthAnchorInSuperview(navigationBarController.navigationBar.frame.size.width*0.1)
        viewElements.leftButton.widthAnchorInSuperview(navigationBarController.navigationBar.frame.size.width*0.1)
        viewElements.rightStackView.addLeadingLineWithColor(color: .red)
        viewElements.rightButton.widthAnchorInSuperview(navigationBarController.navigationBar.frame.size.width*0.1)
        
        stackView.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.bottom, tabBar)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        scrollView.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        scrollView.constraintOutsideTo(.bottom, reserveButton)
        
        detailsView.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        detailsView.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        detailsView.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        detailsView.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        detailsView.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        detailsView.heightAnchorInSuperview(3500)
    }
}

extension HomeAbertaView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return espacos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if espacos > 1 {
            
            if indexPath.row == 0 {
                
                let cell = UITableViewCell()
                cell.textLabel?.setToDefault(text: "Espaços", .left)
                
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeAbertaTableViewCell
                cell?.delegate = self
                
                return cell ?? UITableViewCell()
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

extension HomeAbertaView: HomeAbertaTableViewCellProtocol {
    
    func chosePlace() {
        
        navigationBarController.navigationBarStackView.isHidden = true
        reserveButton.isHidden = false
        stackView.isHidden = true
        scrollView.isHidden = false
    }
}
