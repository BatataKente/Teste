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
        
        let parameters = SpaceListParameters(space_state_id: 1, space_city_id: 2, allow_workpass: true, seats_qty: 3, space_type_id: 4, space_classification_id: 5, space_category_id: 6, space_facilities_id: [0], space_noise_level_id: 7, space_contract_Type: 8)
        
            self.authManager.postDataWithResponse(parameters: parameters) { (spaces: [Space]?) in
                
                if let spaces = spaces {
                    
                    self.cells = spaces
                }
            }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
    
    let authManager = AuthManager()
    
    private let cellIdentifier = "Cell"
    
    private let seletedFilterItems: [String] = ["a", "b", "c"]
    
    private var cells: [Space] = []
    
    private let titleLabel = UILabel()
    
    private let customBar = UIView()
    
    private lazy var filterStackView: UIStackView = {
        
        let margins = CGFloat(13).generateSizeForScreen
        
        let stackView = UIStackView()
        stackView.setToDefaultBackgroundColor()
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: CGFloat(13).generateSizeForScreen,
                                               right: margins)
        
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.setToDefaultBackgroundColor()
        tableView.register(HomeOpenTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
    
    private lazy var tabBar: BravveTabBar = BravveTabBar(self)
    
    private func setupView() {
        
        view.addSubviews([stackView, customBar, tabBar])
        
        filterButtons = createCapsuleButtons(seletedFilterItems)
        
        filterStackView.addArrangedSubviews(filterButtons)
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        
        var customBarWithFilter: CustomBarWithFilter
        let smallFont = UIFont(name: FontsBravve.light.rawValue,
                               size: CGFloat(11).generateSizeForScreen)
        
        customBarWithFilter = customBar.setToDefaultCustomBarWithFilter() {_ in

            let filterView = FilterScreen()
            filterView.modalPresentationStyle = .fullScreen
            self.present(filterView, animated: true)
        }
        
        authManager.getDataArray { (states: [States]?) in

            guard let states = states else {
                return
            }

            var actions = [UIAction]()

            let stateHandler = {(action: UIAction) in

                for state in states {

                    if state.code == action.title {

                        self.authManager.getDataArray(id: "\(state.id)", endpoint: .utilsCities) { (cities: [Cities]?) in

                            guard let cities = cities else {return}

                            var actions = [UIAction]()

                            let cityHandler = {(action: UIAction) in
                                
                                customBarWithFilter.cityChosedLabel.text = action.title
                                customBarWithFilter.cityLabel.font = smallFont
                            }
                            
                            for city in cities {

                                guard let cityname = city.name else {return}

                                actions.append(UIAction(title: cityname,
                                                        handler: cityHandler))
                            }
                            
                            customBarWithFilter.stateChosedLabel.text = action.title
                            customBarWithFilter.stateLabel.font = smallFont

                            customBarWithFilter.rightButton.setMenuForButton(actions)
                        }
                    }
                }
            }
            
            for state in states {

                actions.append(UIAction(title: state.code,
                                        handler: stateHandler))
            }

            customBarWithFilter.leftButton.setMenuForButton(actions)
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        
        return cell
    }
}

extension HomeOpenView: HomeOpenTableViewCellProtocol {
    
    func chosePlace(_ indexPath: IndexPath) {
        
//        let openDetailsView = OpenDetailsView(cells[indexPath.row])
//        
//        openDetailsView.modalPresentationStyle = .fullScreen
//        present(openDetailsView, animated: false)
    }
}


