//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import Foundation
import UIKit

final class FilterView: UIViewController {
    
    let sessionManager = SessionManager()
    
    var typesArray: [String] = []
    var classificationsArray: [String] = []
    var categoriesArray: [String] = []
    var facilitiesArray: [String] = []
    var noisesArray: [String] = []
    var contractsArray: [String] = []
    
    var typesButtons = [UIButton]()
    var classificationButtons = [UIButton]()
    var categoriesButtons = [UIButton]()
    var facilitiesButtons = [UIButton]()
    var noisesButtons = [UIButton]()
    var contractButtons = [UIButton]()
    
    //MARK: - var and let
    let scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    
    let uiview = UIView()
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   
                                                                   ButtonsBravve.exitGray.rawValue])
    
    //MARK: - filterButton
    private lazy var filterButton: UIButton = UIButton()
    
    //MARK: - exitButton
    private lazy var exitButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.xmarkBlue.rawValue), for: .normal)
        view.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
        //        view.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        return view
    }()
    
    
    //MARK: - filterLabel
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filtrar"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - clearLabel
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 14))
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(named: ColorsBravve.blue.rawValue) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Limpar",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(clearTap), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - capacityView
    private lazy var capacityView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: - capacityLabel
    private lazy var capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Capacidade"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 11)
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        return label
    }()
    
    //MARK: numberLabel
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "16+"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: capacityButton
    private lazy var capacityButton: UIButton = {
        let view = UIButton()
//        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        view.addTarget(self, action: #selector(capacityTap), for: .touchUpInside)
        
        return view
    }()
    
    //MARK: capacityDropDown
    private lazy var capacityDropDown: UIScrollView = {
        
        let capacityDropDown = UIScrollView()
        
        var buttons = [UIButton]()
        let capacities = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16+"]
        
        for capacity in capacities {
            
            let button = UIButton()
            button.setTitle(capacity, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                 for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                             size: CGFloat(14).generateSizeForScreen)
            
            let handler = {(action: UIAction) in
                
                self.numberLabel.text = button.currentTitle
                self.capacityDropDown.frame.size = .zero
            }
            
            button.addAction(UIAction(handler: handler), for: .touchUpInside)
            
            buttons.append(button)
        }
        capacityDropDown.turnIntoAList(buttons)
        capacityDropDown.delegate = self
        
        return capacityDropDown
    }()
    
    // NÃO TEM LINE NO ENUM
    
    //MARK: lines
    let lines: [UIImageView] = {
        
        var lines:[UIImageView] = []
        
        for i in 0...6 {
            
            let line = UIImageView()
            line.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
            lines.append(line)
        }
        
        return lines
    }()
    
    //MARK: - spaceType
    private lazy var spaceType: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: roomsStackspaceType2
    private lazy var roomsStackspaceType: UIStackView = {
        let view = UIStackView()
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - ClassificationLabel
    private lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Classificação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: stackClassification
    private lazy var roomsStackClassification: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    // COR DA LABEL
    //MARK: categoryLabel
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categoria"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - stackClassification
    private lazy var roomsStackCategory: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - faciltiesLabel
    private lazy var facilitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Facilities"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - stackFacilities
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - NoiseAudio
    private lazy var NoiseLabel: UILabel = {
        let label = UILabel()
        label.text = "Conforto Auditivo"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - stackNoises1
    private lazy var stackNoises1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: roomsStackNoise
    private lazy var roomsStackNoise: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackNoises1])
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - typeOfContarctLabel
    private lazy var typeOfContarctLabel: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Contratação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: roomsImageContract
    private lazy var roomsStackContract: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - loadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        view.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        setupView()
        setupConstrains()
    }
    
    //MARK: - setupView
    private func setupView() {
        setupTypesButtons(roomsStackspaceType)
        setupClassificationsButtons(roomsStackClassification)
        setupCategoriesButtons(roomsStackCategory)
        setupFacilitiesButtons(roomsStackFacilities)
        setupNoisesButtons(roomsStackNoise)
        setupContractsButtons(roomsStackContract)
        
        view.addSubviews([scrollView, tabBar, filterButton])
        
        scrollView.addSubviews([uiview, capacityDropDown])
        
        uiview.addSubviews(lines + [exitButton,
                                    filterLabel,
                                    clearButton,
                                    capacityView,
                                    capacityLabel,
                                    numberLabel,
                                    capacityButton,
                                    spaceType,
                                    roomsStackspaceType,
                                    classificationLabel,
                                    roomsStackClassification,
                                    categoryLabel,
                                    roomsStackCategory,
                                    facilitiesLabel,
                                    roomsStackFacilities,
                                    NoiseLabel,
                                    roomsStackNoise,
                                    typeOfContarctLabel,
                                    roomsStackContract])
        
        tabBar.selectedItem = tabBar.items?[0]
        filterButton.setToBottomButtonDefaultAbove("Filtrar",
                                                   backgroundColor: .buttonPink,
                                                   above: tabBar)
    }
    
    //MARK: - ACTIONS AND METHODS
    
    //MARK: - exitTap
    @objc private func exitTap() {
        self.dismiss(animated: true)
    }
    
    //MARK: - clearTap
    @objc private func clearTap() {
        for button in typesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        for button in classificationButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        for button in categoriesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        for button in facilitiesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        for button in noisesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        for button in contractButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
        }
        selectedItemsArray = []
    }
    
    @objc private func filterButtonTapped(){
        self.dismiss(animated: true)
    }
    
    //MARK: - capacityTap
    @objc private func capacityTap() {
        
        capacityDropDown.showLikeAWindow(size: CGSize(width: capacityView.frame.size.width,
                                                      height: CGFloat(144).generateSizeForScreen),
                                         origin: CGPoint(x: capacityView.frame.maxX,
                                                         y: capacityView.frame.maxY),
                                         .downLeft)
    }
    
    //MARK: - createStackView
    private func createStackView(_ views: [UIView]) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        
            stackView.spacing = 4
            stackView.backgroundColor = .white
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
        
        return stackView
    }
    
    //MARK: - setupStackView
    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {
        
        var stackViews = [UIStackView]()
        
        var from = 0
        
        if buttons.count%2 != 0 {
            
            buttons[from].addTarget(self, action: #selector(self.selectItems),
                                    for: .touchUpInside)
            stackViews.append(self.createStackView([buttons[from]]))
            
            from += 1
        }
        
        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
                
            buttons[i].addTarget(self, action: #selector(self.selectItems),
                                 for: .touchUpInside)
            buttons[i+1].addTarget(self, action: #selector(self.selectItems),
                                   for: .touchUpInside)
            
            stackViews.append(self.createStackView([buttons[i],
                                                    buttons[i+1]]))
        }
        
        return stackViews
    }
    
    //MARK: - API Functions
    func setupTypesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesTypes) { (typesList: [SpaceType]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                print(types.name ?? "")
                (self.typesArray.append(types.name ?? ""))
            }
            
            self.typesButtons = self.createCapsuleButtons(self.typesArray,
                                                          ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.typesButtons))
        }
    }
    
    func setupClassificationsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesClassifications) {(typesList: [SpaceClassification]?) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                (self.classificationsArray.append(types.name ?? ""))
            }
            self.classificationButtons = self.createCapsuleButtons(self.classificationsArray,
                                          ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.classificationButtons))
        }
    }
    
    func setupCategoriesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesCategories) { (typesList: [SpaceCategory]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                (self.categoriesArray.append(types.name ?? ""))
            }
            self.categoriesButtons = self.createCapsuleButtons(self.categoriesArray,
                                                               ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.categoriesButtons))
        }
    }
    
    func setupFacilitiesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesFacilities) { (typesList: [SpaceFacility]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                (self.facilitiesArray.append(types.name ?? ""))
            }
            self.facilitiesButtons = self.createCapsuleButtons(self.facilitiesArray,
                                                               ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.facilitiesButtons))
        }
    }
    
    func setupNoisesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesNoises) { (typesList: [SpaceNoise]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                (self.noisesArray.append(types.name ?? ""))
            }
            self.noisesButtons = self.createCapsuleButtons(self.noisesArray,
                                                               ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.noisesButtons))
        }
    }
    
    func setupContractsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesContracts) { (typesList: [SpaceContract]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
                (self.contractsArray.append(types.name ?? ""))
            }
            self.contractButtons = self.createCapsuleButtons(self.contractsArray,
                                                               ColorsBravve.capsuleButton)
            
            stackView.addArrangedSubviews(self.setupStackView(self.contractButtons))
        }
    }
    
    //MARK: selectedItemsArray
    var selectedItemsArray: [String] = []
    
    @objc func selectItems(button: UIButton) {
        if button.isSelected == true {
            button.isSelected.toggle()
            button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
            button.configuration?.attributedTitle?.foregroundColor = .black
            let filteredArray = selectedItemsArray.filter {$0 != button.titleLabel?.text ?? ""}
            selectedItemsArray = filteredArray
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .white
                selectedItemsArray.append(button.titleLabel?.text ?? "")
            } else {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black
                let filteredArray = selectedItemsArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedItemsArray = filteredArray
            }
        }
        print(selectedItemsArray)
    }
    
    //MARK: setupConstrains
    private func setupConstrains() {
        
        let spacing = CGFloat(19).generateSizeForScreen
        
        //MARK: scrollView
        scrollView.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.leading, view)
        scrollView.constraintInsideTo(.trailing, view)
        scrollView.constraintOutsideTo(.bottom, filterButton)
        
        //MARK: Filter & Capacity & Clear
        uiview.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        uiview.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        uiview.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        uiview.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        uiview.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        //MARK: exitButton
        exitButton.constraintInsideTo(.top, uiview)
        exitButton.constraintInsideTo(.leading, uiview,
                                      CGFloat(20).generateSizeForScreen)
        exitButton.heightAnchorInSuperview(CGFloat(14).generateSizeForScreen)
        exitButton.constraintOutsideTo(.width, exitButton)
        
        //MARK: filterLabel
        filterLabel.constraintOutsideTo(.top, exitButton, spacing)
        filterLabel.constraintInsideTo(.leading, exitButton)
        
        //MARK: clearLabel
        clearButton.constraintInsideTo(.centerY, filterLabel)
        clearButton.constraintInsideTo(.trailing, uiview,
                                       CGFloat(35).generateSizeForScreen)
        
        //MARK: capacityView
        capacityView.constraintOutsideTo(.top, filterLabel, spacing)
        capacityView.constraintInsideTo(.leading, filterLabel)
        
        //MARK: capacityLabel
        capacityLabel.constraintInsideTo(.top, capacityView,
                                         CGFloat(12).generateSizeForScreen)
        capacityLabel.constraintInsideTo(.leading, capacityView,
                                         CGFloat(16).generateSizeForScreen)
        capacityLabel.constraintInsideTo(.trailing, capacityView,
                                         CGFloat(48).generateSizeForScreen)
        
        //MARK: numberLabel
        numberLabel.constraintOutsideTo(.top, capacityLabel,
                                        CGFloat(7).generateSizeForScreen)
        numberLabel.constraintInsideTo(.leading, capacityView,
                                       CGFloat(16).generateSizeForScreen)
        numberLabel.constraintInsideTo(.bottom, capacityView,
                                       CGFloat(11).generateSizeForScreen)
        
        //MARK: capacityButton
        capacityButton.constraintInsideTo(.top, capacityView)
        capacityButton.constraintOutsideTo(.leading, capacityLabel,
                                           CGFloat(10).generateSizeForScreen)
        capacityButton.constraintInsideTo(.trailing, capacityView)
        capacityButton.constraintInsideTo(.bottom, capacityView)
        
        //MARK: lines[0]
        lines[0].constraintOutsideTo(.top, capacityView,
                                      CGFloat(16).generateSizeForScreen)
        lines[0].constraintInsideTo(.leading, capacityView)
        lines[0].constraintInsideTo(.trailing, uiview,
                                     CGFloat(20).generateSizeForScreen)
        lines[0].heightAnchorInSuperview(1)
        
        //MARK: spaceType
        spaceType.constraintOutsideTo(.top, lines[0], spacing)
        spaceType.constraintInsideTo(.leading, lines[0])
        
        //MARK: roomsStackspaceType
        roomsStackspaceType.constraintOutsideTo(.top, spaceType, spacing)
        roomsStackspaceType.constraintInsideTo(.leading, lines[0])
        roomsStackspaceType.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage2
        lines[1].constraintOutsideTo(.top, roomsStackspaceType, spacing)
        lines[1].constraintInsideTo(.leading, lines[0])
        lines[1].constraintInsideTo(.trailing, lines[0])
        lines[1].constraintInsideTo(.height, lines[0])
        
        //MARK: classificationLabel
        classificationLabel.constraintOutsideTo(.top, lines[1], spacing)
        classificationLabel.constraintInsideTo(.leading, lines[0])
        
        //MARK: roomsStackClassification
        roomsStackClassification.constraintOutsideTo(.top, classificationLabel, spacing)
        roomsStackClassification.constraintInsideTo(.leading, lines[0])
        roomsStackClassification.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage3
        lines[2].constraintOutsideTo(.top, roomsStackClassification, spacing)
        lines[2].constraintInsideTo(.leading, lines[0])
        lines[2].constraintInsideTo(.trailing, lines[0])
        lines[2].constraintInsideTo(.height, lines[0])
        
        //MARK: categoryLabel
        categoryLabel.constraintOutsideTo(.top, lines[2], spacing)
        categoryLabel.constraintInsideTo(.leading, lines[0])
        
        //MARK: roomsStackCategory
        roomsStackCategory.constraintOutsideTo(.top, categoryLabel, spacing)
        roomsStackCategory.constraintInsideTo(.leading, lines[0])
        roomsStackCategory.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage4
        lines[3].constraintOutsideTo(.top, roomsStackCategory, spacing)
        lines[3].constraintInsideTo(.leading, lines[0])
        lines[3].constraintInsideTo(.trailing, lines[0])
        lines[3].constraintInsideTo(.height, lines[0])
        
        //MARK: facilitiesLabel
        facilitiesLabel.constraintOutsideTo(.top, lines[3], spacing)
        facilitiesLabel.constraintInsideTo(.leading, lines[0])
        
        //MARK: roomsStackFacilities
        roomsStackFacilities.constraintOutsideTo(.top, facilitiesLabel, spacing)
        roomsStackFacilities.constraintInsideTo(.leading, lines[0])
        roomsStackFacilities.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage5
        lines[4].constraintOutsideTo(.top, roomsStackFacilities, spacing)
        lines[4].constraintInsideTo(.leading, lines[0])
        lines[4].constraintInsideTo(.trailing, lines[0])
        lines[4].constraintInsideTo(.height, lines[0])
        
        //MARK: NoiseLabel
        NoiseLabel.constraintOutsideTo(.top, lines[4], spacing)
        NoiseLabel.constraintInsideTo(.leading, lines[0])
        
        //MARK: roomsStackNoise
        roomsStackNoise.constraintOutsideTo(.top, NoiseLabel, spacing)
        roomsStackNoise.constraintInsideTo(.leading, lines[0])
        roomsStackNoise.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage6
        lines[5].constraintOutsideTo(.top, roomsStackNoise, spacing)
        lines[5].constraintInsideTo(.leading, lines[0])
        lines[5].constraintInsideTo(.trailing, lines[0])
        lines[5].constraintInsideTo(.height, lines[0])
        
        //MARK: typeOfContarctLabel
        typeOfContarctLabel.constraintOutsideTo(.top, lines[5], spacing)
        typeOfContarctLabel.constraintInsideTo(.leading, lines[0])
        
        //MARK: lineImage6
        roomsStackContract.constraintOutsideTo(.top, typeOfContarctLabel, spacing)
        roomsStackContract.constraintInsideTo(.leading, lines[0])
        roomsStackContract.constraintInsideTo(.trailing, lines[0])
        
        //MARK: lineImage6
        lines[6].constraintOutsideTo(.top, roomsStackContract, spacing)
        lines[6].constraintInsideTo(.leading, lines[0])
        lines[6].constraintInsideTo(.trailing, lines[0])
        lines[6].constraintInsideTo(.bottom, uiview, spacing)
        lines[6].constraintInsideTo(.height, lines[0])
        
        //MARK: tabBar
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension FilterView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
