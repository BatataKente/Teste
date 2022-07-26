//
//  HomeView.swift
//  Teste
//
//  Created by Josicleison on 22/07/22.
//

import UIKit

class HomeAbertaView: UIViewController {
    
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: 256, height: 256)
        
        return collectionViewFlowLayout
    }()
    
    lazy var scrollViewElements: (view: UIView,
                                  titleLabel: UILabel,
                                  descriptionLabel: UILabel,
                                  photoCollectionView: UICollectionView,
                                  nameLabel: UILabel,
                                  priceLabel: UILabel,
                                  detailsLabel: UILabel) = {
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemGreen
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
//        view.layer.shadowOffset
        
        let photoCollectionView = UICollectionView(frame: self.view.frame,
                                                   collectionViewLayout: collectionViewFlowLayout)
        
        photoCollectionView.register(HomeAbertaCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        let nameLabel = UILabel()
        nameLabel.text = "Hotel Saint"
        
        let priceLabel = UILabel()
        priceLabel.text = "3,50 crédito/ hora"
        
        let detailsLabel = UILabel()
        detailsLabel.text = "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"
        detailsLabel.numberOfLines = 0
        
        view.addSubviews([titleLabel, descriptionLabel, photoCollectionView, nameLabel, priceLabel, detailsLabel])
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                photoCollectionView: photoCollectionView,
                nameLabel: nameLabel,
                priceLabel: priceLabel,
                detailsLabel: detailsLabel)
    }()
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollViewElements.view)
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
    
    private lazy var navigationBar: (bar: UINavigationBar,
                                     stackView: UIStackView) = {
        
        guard let bar = navigationController?.navigationBar else {
            
            return (bar: UINavigationBar(),
                    stackView: UIStackView())
        }
        
        let navigationBarStackViewFrame = CGRect(x: 25,
                                                 y: bar.frame.size.height/4,
                                                 width: bar.frame.size.width*0.8,
                                                 height: bar.frame.size.height/2)
        
        let stackView = UIStackView(frame: navigationBarStackViewFrame)
        
        stackView.addArrangedSubview(viewElements.leftStackView)
        stackView.addArrangedSubview(viewElements.leftButton)
        stackView.addArrangedSubview(viewElements.rightStackView)
        stackView.addArrangedSubview(viewElements.rightButton)
        
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        stackView.setToDefaultBackgroundColor()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
        bar.addSubview(stackView)
        
        return (bar: bar,
                stackView: stackView)
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
        
        scrollViewElements.photoCollectionView.dataSource = self
        scrollViewElements.photoCollectionView.delegate = self
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        reserveButton.setToBottomButtonDefault(aboveWhom: tabBar)
    }
    
    private func setupConstraints() {
        
        viewElements.leftStackView.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        viewElements.leftButton.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        viewElements.rightStackView.addLeadingLineWithColor(color: .red)
        viewElements.rightButton.widthAnchorInSuperview(navigationBar.bar.frame.size.width*0.1)
        
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
        
        scrollViewElements.view.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        scrollViewElements.view.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        scrollViewElements.titleLabel.constraintInsideTo(.top, scrollViewElements.view)
        scrollViewElements.titleLabel.constraintInsideTo(.leading, scrollViewElements.view, 21)
        
        scrollViewElements.descriptionLabel.constraintOutsideTo(.top, scrollViewElements.titleLabel, 23)
        scrollViewElements.descriptionLabel.constraintInsideTo(.leading, scrollViewElements.titleLabel)
        scrollViewElements.descriptionLabel.widthAnchorInSuperview(215)
        
        scrollViewElements.photoCollectionView.constraintOutsideTo(.top, scrollViewElements.descriptionLabel, 22)
        scrollViewElements.photoCollectionView.constraintInsideTo(.leading, scrollViewElements.descriptionLabel)
        scrollViewElements.photoCollectionView.constraintInsideTo(.trailing, scrollViewElements.view)
        scrollViewElements.photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
        
        scrollViewElements.nameLabel.constraintOutsideTo(.top, scrollViewElements.photoCollectionView, 23)
        scrollViewElements.nameLabel.constraintInsideTo(.leading, scrollViewElements.photoCollectionView)
        
        scrollViewElements.priceLabel.constraintOutsideTo(.top, scrollViewElements.photoCollectionView, 23)
        scrollViewElements.priceLabel.constraintInsideTo(.trailing, scrollViewElements.photoCollectionView, 18)
        
        scrollViewElements.detailsLabel.constraintOutsideTo(.top, scrollViewElements.nameLabel, 23)
        scrollViewElements.detailsLabel.constraintInsideTo(.leading, scrollViewElements.nameLabel)
        scrollViewElements.detailsLabel.constraintInsideTo(.bottom, scrollViewElements.view, 18)
    }
}

extension HomeAbertaView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.count > 1 {
            
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

extension HomeAbertaView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = scrollViewElements.photoCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeAbertaCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeAbertaView: HomeAbertaTableViewCellProtocol {
    
    func chosePlace() {
        
        navigationBar.stackView.isHidden = true
        reserveButton.isHidden = false
        stackView.isHidden = true
        scrollView.isHidden = false
    }
}
