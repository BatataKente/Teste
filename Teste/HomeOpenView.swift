//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeOpenView: UIViewController {
    
    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupDefaults()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
    
    private let seletedFilterItems: [String] = ["a", "b", "c"]
    
    private let cells: [ReserveData] = [ReserveData(title: "BOXOFFICE",
                                                    description: "Numa esquina charmosa, um hotel",
                                                    image: UIImage(named: ImagesBravve.example_1.rawValue) ?? UIImage(),
                                                    photoTitle: "WORKPASS",
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"),
                                        ReserveData(title: "BOXOFFICE",
                                                    description: "Pelos poderes de greyskull",
                                                    image: UIImage(named: ImagesBravve.example_2.rawValue) ?? UIImage(),
                                                    photoTitle: "WORKPASS",
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"),
                                        ReserveData(title: "BOXOFFICE",
                                                    description: "Numa esquina charmosa, um hotel",
                                                    image: UIImage(named:ImagesBravve.example_3.rawValue) ?? UIImage(),
                                                    photoTitle: "WORKPASS",
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo")]
    
    private let titleLabel = UILabel()
    
    private let customBar = UIView()
    
    private lazy var filterStackView: UIStackView = {
        
        let margins = CGFloat(20).generateSizeForScreen
        
        let stackView = UIStackView()
        stackView.setToDefaultBackgroundColor()
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: CGFloat(10).generateSizeForScreen,
                                               right: margins)
        
        return stackView
    }()
    
    private let tableView: UITableView = {
        
        let margins = CGFloat(20).generateSizeForScreen
        
        let tableView = UITableView()
        tableView.register(HomeOpenTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: margins,
                                               right: margins)
        
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [filterStackView,
                                                       tableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: 0)
        
        return stackView
    }()
    
    private var filterButtons = [UIButton]()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
    private func setupView() {
        
        view.addSubviews([stackView, customBar, tabBar])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        filterButtons = createCapsuleButtons(seletedFilterItems)
        
        filterStackView.addArrangedSubviews(filterButtons)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        customBar.setToDefaultCustomBarWithFilter()
    }
    
    private func setupConstraints() {
        
        stackView.constraintOutsideTo(.top, customBar)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintOutsideTo(.bottom, tabBar)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension HomeOpenView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.count > 1 {
            
            if indexPath.row == 0 {
                
                let spaceTitleCell = UITableViewCell()
                spaceTitleCell.textLabel?.setToDefault(text: "Espaços", .left)
                spaceTitleCell.textLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                                        size: CGFloat(20).generateSizeForScreen)
                spaceTitleCell.setToDefaultBackgroundColor()
                
                return spaceTitleCell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeOpenTableViewCell
                cell?.delegate = self
                
                cell?.indexPath = IndexPath(row: indexPath.row - 1,
                                            section: indexPath.section - 1)
                cell?.setup(cells[indexPath.row - 1])
                
                return cell ?? UITableViewCell()
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

extension HomeOpenView: HomeOpenTableViewCellProtocol {
    
    func chosePlace(_ indexPath: IndexPath) {
        
        let detalhesAbertoView = OpenDetailsView(cells[indexPath.row])
        detalhesAbertoView.modalPresentationStyle = .fullScreen
        present(detalhesAbertoView, animated: false)
    }
}


