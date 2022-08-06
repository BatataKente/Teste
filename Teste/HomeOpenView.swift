//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeOpenView: UIViewController {
    
    private let seletedFilterItems: [String] = ["a", "b", "c"]
    
    private let cells: [ReserveData] = [ReserveData(title: "BOXOFFICE",
                                                    description: "Numa esquina charmosa, um hotel",
                                                    image: UIImage(named: ImagesBravve.example_1.rawValue) ?? UIImage(),
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"),
                                        ReserveData(title: "BOXOFFICE",
                                                    description: "Numa esquina charmosa, um hotel",
                                                    image: UIImage(named: ImagesBravve.example_2.rawValue) ?? UIImage(),
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo"),
                                        ReserveData(title: "BOXOFFICE",
                                                    description: "Numa esquina charmosa, um hotel",
                                                    image: UIImage(named:ImagesBravve.example_3.rawValue) ?? UIImage(),
                                                    name: "Hotel Saint",
                                                    subName: "UM Coffee Co.",
                                                    price: "3,50 crédito/ hora",
                                                    details: "São Paulo / Jardim Paulistano\nCapacidade: 6 pessoas\nEspaço privativo")]
    
    private let titleLabel = UILabel()
    
    private let customBar = UIView()
    
    private lazy var filterStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.setToDefaultBackgroundColor()
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10,
                                               left: 10,
                                               bottom: 10,
                                               right: 10)
        
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
        
        return stackView
    }()
    
    private var filterButtons = [UIButton]()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupDefaults()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
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
                
                return spaceTitleCell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeOpenTableViewCell
                cell?.delegate = self
                
                cell?.setup(cells[indexPath.row - 1])
                
                return cell ?? UITableViewCell()
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

extension HomeOpenView: HomeOpenTableViewCellProtocol {
    
    func chosePlace() {
        
        let detalhesAbertoView = OpenDetailsView()
        detalhesAbertoView.modalPresentationStyle = .fullScreen
        present(detalhesAbertoView, animated: false)
    }
}


