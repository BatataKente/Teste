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
    
    lazy var ViewElements: (view: UIView,
                            titleLabel: UILabel,
                            descriptionLabel: UILabel,
                            photoCollectionView: UICollectionView,
                            scrollView: UIScrollView) = {
        
        let scrollView = UIScrollView()
        scrollView.isHidden = true
        scrollView.alwaysBounceVertical = false
        
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemGreen
        titleLabel.text = "BOXOFFICE"
        
        let descriptionLabel = UILabel()
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        scrollView.addSubview(view)
        
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
        
        let hourPriceLabel = UILabel()
        hourPriceLabel.text = "3,50 crédito/ hora"
        
        let dayPriceLabel = UILabel()
        dayPriceLabel.text = "18,20 crédito/dia"
        
        view.addSubviews([titleLabel, descriptionLabel,
                          photoCollectionView, nameLabel,
                          hourPriceLabel, dayPriceLabel])
        
        dayPriceLabel.constraintOutsideTo(.top, hourPriceLabel)
        dayPriceLabel.constraintInsideTo(.leading, hourPriceLabel)
        dayPriceLabel.constraintInsideTo(.bottom, view, 18)
        
        nameLabel.constraintOutsideTo(.top,  photoCollectionView, 23)
        nameLabel.constraintInsideTo(.leading, photoCollectionView)
        
        hourPriceLabel.constraintOutsideTo(.top, nameLabel, 23)
        hourPriceLabel.constraintInsideTo(.leading, nameLabel)
        
        return (view: view,
                titleLabel: titleLabel,
                descriptionLabel: descriptionLabel,
                photoCollectionView: photoCollectionView,
                scrollView: scrollView)
    }()
    
    private var espacos = 10
    
    private let titleLabel = UILabel()
    
    private lazy var customBar: UIView = {
        
        let customBar = UIView()
        customBar.setToDefaultCustomBarWithFilter()
        
        return customBar
    }()
    
    private lazy var filterStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
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
    
//    @objc func pushToNextVC() {
//        let newVC = UIViewController()
//        newVC.view.backgroundColor = UIColor.red
//        self.navigationController?.pushViewController(newVC, animated:
//        true)
//    }
    
    var filterButtons = [UIButton]()
    
    lazy var tabBar = UITabBarController()
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupDefaults()
        
//        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2.50, y: view.bounds.height / 2, width: 100, height: 50))
//        button.backgroundColor = UIColor.black
//        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
//        self.view.addSubview(button)
        
//        let favoritesVC = NomeView()
//        favoritesVC.title = "Favorites"
//        favoritesVC.view.backgroundColor = UIColor.orange
//
//        let downloadsVC = FotoView()
//        downloadsVC.title = "Downloads"
//        downloadsVC.view.backgroundColor = UIColor.blue
//
//        let historyVC = ConfirmationCodeView()
//        historyVC.title = "History"
//        historyVC.view.backgroundColor = UIColor.cyan
//
//        let controllers = [favoritesVC, downloadsVC, historyVC]
//        tabBar.viewControllers = controllers
//        tabBar.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
    
    private func setupView() {
        
        view.addSubviews([ViewElements.scrollView, stackView, customBar])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ViewElements.photoCollectionView.dataSource = self
        ViewElements.photoCollectionView.delegate = self
        
        filterButtons = createCapsuleButtons(["a"])
        
        filterStackView.addArrangedSubviews(filterButtons)
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupConstraints() {
        
        customBar.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        customBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        customBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        customBar.heightAnchorInSuperview(100)
        
        stackView.constraintOutsideTo(.top, customBar)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
        
        ViewElements.scrollView.constraintOutsideTo(.top, customBar)
        ViewElements.scrollView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        ViewElements.scrollView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        ViewElements.scrollView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        ViewElements.view.constraintInsideTo(.top, ViewElements.scrollView.contentLayoutGuide)
        ViewElements.view.constraintInsideTo(.leading, ViewElements.scrollView.contentLayoutGuide)
        ViewElements.view.constraintInsideTo(.trailing, ViewElements.scrollView.contentLayoutGuide)
        ViewElements.view.constraintInsideTo(.bottom, ViewElements.scrollView.contentLayoutGuide)
        ViewElements.view.constraintInsideTo(.width, ViewElements.scrollView.frameLayoutGuide)
        
        ViewElements.titleLabel.constraintInsideTo(.top, ViewElements.view)
        ViewElements.titleLabel.constraintInsideTo(.leading, ViewElements.view, 21)
        
        ViewElements.descriptionLabel.constraintOutsideTo(.top, ViewElements.titleLabel, 23)
        ViewElements.descriptionLabel.constraintInsideTo(.leading, ViewElements.titleLabel)
        ViewElements.descriptionLabel.widthAnchorInSuperview(215)
        
        ViewElements.photoCollectionView.constraintOutsideTo(.top, ViewElements.descriptionLabel, 22)
        ViewElements.photoCollectionView.constraintInsideTo(.leading, ViewElements.descriptionLabel)
        ViewElements.photoCollectionView.constraintInsideTo(.trailing, ViewElements.view)
        ViewElements.photoCollectionView.heightAnchorInSuperview(collectionViewFlowLayout.itemSize.height)
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeAbertaCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeAbertaView: HomeAbertaTableViewCellProtocol {
    
    func chosePlace() {
        
        stackView.isHidden = true
        ViewElements.scrollView.isHidden = false
    }
}


