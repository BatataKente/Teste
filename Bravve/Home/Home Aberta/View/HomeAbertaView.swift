//
//  HomeAbertaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeAbertaView: UIViewController {
    
    private var espacos = 10
    
    private let titleLabel = UILabel()
    
    let customBar = UIView()
    
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
    }
    
    private func setupView() {
        
        view.addSubviews([stackView, customBar])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        filterButtons = createCapsuleButtons(["a"])
        
        filterStackView.addArrangedSubviews(filterButtons)
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        customBar.setToDefaultCustomBarWithFilter()
    }
    
    private func setupConstraints() {
        
        stackView.constraintOutsideTo(.top, customBar)
        stackView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        stackView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        tableView.widthAnchorInSuperview(view.frame.size.width)
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

extension HomeAbertaView: HomeAbertaTableViewCellProtocol {
    
    func chosePlace() {
        
        let detalhesDoEspacoView = DetalhesDoEspacoView()
        detalhesDoEspacoView.modalPresentationStyle = .fullScreen
        present(detalhesDoEspacoView, animated: false)
    }
}


