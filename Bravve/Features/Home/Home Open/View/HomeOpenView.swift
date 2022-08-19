//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class HomeOpenView: UIViewController {
    
    let sessionManager = SessionManager()
    
    private let cellIdentifier = "Cell"
    
    private let seletedFilterItems: [String] = ["Sala de Reunião", "Colaborativo", "a", "b", "c"]
    
    private var cells: [Space] = []
     
    private let titleLabel = UILabel()
    
    private lazy var filterStackView: UIStackView = {
        
        let margins = CGFloat(10).generateSizeForScreen
        
        let stackView = UIStackView()
        stackView.setToDefaultBackgroundColor()
        stackView.isHidden = false
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: margins,
                                               left: margins,
                                               bottom: margins,
                                               right: margins)
        
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        
        let margins = CGFloat(20).generateSizeForScreen
        
        let tableView = UITableView()
        tableView.setToDefaultBackgroundColor()
        tableView.register(HomeOpenTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
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
    
    private lazy var tabBar = BravveTabBar(self,
                                           itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                            ButtonsBravve.exitGray.rawValue
                                                            ])
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: ImagesBravve.logoWhite.rawValue)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let coverView: UIView = {
        
        let coverView = UIView()
        coverView.backgroundColor = UIColor(red: 4/255, green: 0, blue: 94/255, alpha: 1)
        
        return coverView
    }()
    
    private lazy var leftDropDown: UIScrollView = {

        let leftDropDown = UIScrollView(frame: CGRect(x: 0, y: 0,
                                                      width: view.frame.size.width/5,
                                                      height: view.frame.size.height/3))
        leftDropDown.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        leftDropDown.delegate = self

        return leftDropDown
    }()
    
    private lazy var rightDropDown: UIScrollView = {

        let rightDropDown = UIScrollView(frame: CGRect(x: 0, y: 0,
                                                       width: view.frame.size.width/2,
                                                       height: view.frame.size.height/2.5))
        rightDropDown.layer.cornerRadius = CGFloat(8).generateSizeForScreen
        rightDropDown.delegate = self

        return rightDropDown
    }()
    
    private lazy var homeOpenViewModel: HomeOpenViewModel = {
        
        let homeOpenViewModel = HomeOpenViewModel(customBarWithFilter)
        return homeOpenViewModel
    }()
    
    private let customBar = UIView()
    
    private lazy var customBarWithFilter: CustomBarWithFilter = {
        
        let customBarWithFilter = customBar.setToDefaultCustomBarWithFilter() {_ in

            let filterView = FilterScreen()
            filterView.modalPresentationStyle = .fullScreen
            self.present(filterView, animated: true)
        }
        
        return customBarWithFilter
    }()
    
    init(_ willLoad: Bool = false) {
        
        imageView.isHidden = willLoad
        coverView.isHidden = willLoad
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        reduceDropDowns()
    }
    
    private func setupView() {
        
        view.addSubviews([stackView, customBar, tabBar, coverView, imageView, leftDropDown, rightDropDown])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        filterButtons = createCapsuleButtons(seletedFilterItems)
        
        for button in filterButtons {
            
            let handler = {(action: UIAction) in
                
                self.reduceDropDowns()
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
        }
        
        filterStackView.addArrangedSubviews(filterButtons)
        tabBar.selectedItem = tabBar.items?[0]
        
        let dropDownsY = CGFloat(100).generateSizeForScreen
        
        let leftDropDownOrigin = CGPoint(x: view.frame.size.width * 0.2,
                                         y: dropDownsY)
        let rightDropDownOrigin = CGPoint(x: view.frame.size.width * 0.8,
                                          y: dropDownsY)
        
        let leftHandler = {(action: UIAction) in
            
            self.customBarWithFilter.rightButton.isSelected = false
            self.rightDropDown.frame.size = .zero
        }
        
        let rightHandler = {(action: UIAction) in
            
            self.customBarWithFilter.leftButton.isSelected = false
            self.leftDropDown.frame.size = .zero
        }
        
        customBarWithFilter.leftButton.addAction(UIAction(handler: leftHandler), for: .touchUpInside)
        customBarWithFilter.leftButton.addSubWindow(leftDropDown,
                                                    origin:   leftDropDownOrigin)
        
        customBarWithFilter.rightButton.addAction(UIAction(handler: rightHandler), for: .touchUpInside)
        customBarWithFilter.rightButton.addSubWindow(rightDropDown, .downLeft,
                                                     origin: rightDropDownOrigin)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    private func setupDefaults() {
        
        view.setToDefaultBackgroundColor()
        
        homeOpenViewModel.delegate = self
        homeOpenViewModel.manageCustomBar()
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
        
        coverView.constraintInsideTo(.top, view)
        coverView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        coverView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        coverView.constraintInsideTo(.bottom, view)
        
        imageView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        imageView.constraintInsideTo(.centerY, view.safeAreaLayoutGuide)
        imageView.constraintInsideTo(.height, view.safeAreaLayoutGuide, multiplier: 0.08)
        imageView.constraintInsideTo(.width, view.safeAreaLayoutGuide, multiplier: 0.6634)
    }
}

extension HomeOpenView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        reduceDropDowns()
    }
    
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
                
                cell?.setup(cells[indexPath.row - 1], IndexPath(row: indexPath.row - 1,
                                                                section: indexPath.section - 1))
                
                return cell ?? UITableViewCell()
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        
        return cell
    }
}

extension HomeOpenView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}

extension HomeOpenView: HomeOpenTableViewCellProtocol {
    
    func chosePlace(_ indexPath: IndexPath) {
        
        guard let spaceId = cells[indexPath.row].id else { return }
        
        sessionManager.getOpenData(id: "\(spaceId)", endpoint: .spacesId) { (space: SpaceDetail?) in
            guard let space = space else {
                return
            }
            let detalhesAbertoView = OpenDetailsView(space)
            detalhesAbertoView.modalPresentationStyle = .fullScreen
            self.present(detalhesAbertoView, animated: false)
        }
    }
}

extension HomeOpenView: HomeOpenViewModelProtocol {
    
    func setSpaces(_ spaces: [Space]) {
        
        self.cells = spaces
        self.tableView.reloadData()
    }
    
    func setCoverView(_ alpha: CGFloat) {
        
        self.coverView.alpha = alpha
        self.imageView.alpha = alpha
    }
    
    func reduceDropDowns() {
        
        self.customBarWithFilter.leftButton.isSelected = false
        leftDropDown.frame.size = .zero
        rightDropDown.frame.size = .zero
    }
    
    func setupLeftDropDown(_ buttons: [UIButton]) {
        
        leftDropDown.turnIntoAList(buttons)
    }
    
    func setupRightDropDown(_ buttons: [UIButton]){
        
        rightDropDown.turnIntoAList(buttons)
    }
}
