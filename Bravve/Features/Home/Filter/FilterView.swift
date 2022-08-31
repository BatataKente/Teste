//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import Foundation
import UIKit

final class FilterScreen: UIViewController {
    
    init(_ spaceParameters: SpaceListParameters = SpaceListParameters(space_state_id: nil, space_city_id: nil, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil), _ seletedItemsArray: [String] = []) {
        
        self.spaceParameters = spaceParameters
        self.selectedItemsArray = seletedItemsArray
        
        super.init(nibName: nil, bundle: nil)
    }
    
    var spaceParameters: SpaceListParameters
    var selectedItemsArray: [String]
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    let sessionManager = SessionManager()
    
    var sortedTypesArray: [SpaceType] = []
    var sortedClassificationsArray: [SpaceClassification] = []
    var sortedCategoriesArray: [SpaceCategory] = []
    var sortedFacilitiesArray: [SpaceFacility] = []
    var sortedNoisesArray: [SpaceNoise] = []
    var sortedContractsArray: [SpaceContract] = []
   
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
    var contractsButtons = [UIButton]()
    
    var selectedTypesArray: [String] = []
    var selectedClassificationsArray: [String] = []
    var selectedCategoriesArray: [String] = []
    var selectedFacilitiesArray: [String] = []
    var selectedNoisesArray: [String] = []
    var selectedContractsArray: [String] = []
    
    var spaceTypeId: Int?
    var spaceClassificationId: Int?
    var spaceCategoryId: Int?
    var spaceFacilitiesId: [Int]?
    var spaceNoiseId: Int?
    var spaceContractId: Int?
    
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
        return view
    }()
    
    
    //MARK: - filterLabel
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filtrar"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - clearLabel
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 14))
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(named: ColorsBravve.blue_cyan.rawValue) as Any,
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
        view.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        return view
    }()
    
    
    //MARK: - capacityLabel
    private lazy var capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Capacidade"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 11)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: numberLabel
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: capacityButton
    private lazy var capacityButton: UIButton = {
        let view = UIButton()
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
    
    //MARK: lines
    let lines: [UIImageView] = {
        
        var lines:[UIImageView] = []
        
        for i in 0...6 {
            
            let line = UIImageView()
            line.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
            lines.append(line)
        }
        
        return lines
    }()
    
    //MARK: - spaceType
    private lazy var spaceType: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: roomsStackspaceType2
    private lazy var roomsStackspaceType: UIStackView = {
        let view = UIStackView()
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
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
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: stackClassification
    private lazy var roomsStackClassification: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: categoryLabel
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categoria"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - stackClassification
    private lazy var roomsStackCategory: UIStackView = {
        let view = UIStackView()
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
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - stackFacilities
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView()
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
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: - stackNoises1
    private lazy var stackNoises1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: roomsStackNoise
    private lazy var roomsStackNoise: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackNoises1])
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
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: roomsImageContract
    private lazy var roomsStackContract: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - createStackView
    private func createStackView(_ views: [UIView]) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        
            stackView.spacing = 4
        stackView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
        
        return stackView
    }
    
    //MARK: - setupStackView
    func setupStackView(_ buttons: [UIButton]) -> [UIStackView] {
        
        var stackViews = [UIStackView]()
        
        var from = 0
        
        if buttons.count%2 != 0 {
            
            stackViews.append(self.createStackView([buttons[from]]))
            
            from += 1
        }
        
        for i in stride(from: from,
                        to: buttons.count - 1,
                        by: 2) {
            
            stackViews.append(self.createStackView([buttons[i],
                                                    buttons[i+1]]))
        }
        
        return stackViews
    }
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: - loadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
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
        filterButton.addTarget(self, action: #selector(self.filterButtonTapped), for: .touchUpInside)
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
                selectedTypesArray = []
                selectedItemsArray = []
        }
        for button in classificationButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
                selectedClassificationsArray = []
                selectedItemsArray = []
        }
        for button in categoriesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
                selectedCategoriesArray = []
                selectedItemsArray = []
        }
        for button in facilitiesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
                selectedFacilitiesArray = []
                selectedItemsArray = []
        }
        for button in noisesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
                selectedNoisesArray = []
                selectedItemsArray = []
        }
        for button in contractsButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.attributedTitle?.foregroundColor = .black}
                selectedContractsArray = []
                selectedItemsArray = []
        }
        
        numberLabel.text = nil
    }
    
    @objc private func filterButtonTapped(){
        
        if selectedTypesArray.count > 0 {
            selectedItemsArray.append(selectedTypesArray[0])
        }
        if selectedClassificationsArray.count > 0 {
            selectedItemsArray.append(selectedClassificationsArray[0])
        }
        if selectedCategoriesArray.count > 0 {
            selectedItemsArray.append(selectedCategoriesArray[0])
        }
        if selectedNoisesArray.count > 0 {
            selectedItemsArray.append(selectedNoisesArray[0])
        }
        if selectedContractsArray.count > 0 {
            selectedItemsArray.append(selectedContractsArray[0])
        }
        selectedItemsArray.append(contentsOf: selectedFacilitiesArray)
        print(selectedItemsArray)
        
        spaceParameters.space_type_id = spaceTypeId
        spaceParameters.space_classification_id = spaceClassificationId
        spaceParameters.space_category_id = spaceCategoryId
        spaceParameters.space_noise_level_id = spaceNoiseId
        spaceParameters.space_contract_Type = spaceContractId
        spaceParameters.space_facilities_id = spaceFacilitiesId
        
        if numberLabel.text == "16+" {
            numberLabel.text = "16"
        }
        spaceParameters.seats_qty = Int(numberLabel.text ?? "")

        let HomeOpenView = HomeOpenView(true, spaceParameters, selectedItemsArray)
        HomeOpenView.modalPresentationStyle = .fullScreen
        present(HomeOpenView, animated: false)
    }
    
    //MARK: - capacityTap
    @objc private func capacityTap() {
        
        capacityDropDown.showLikeAWindow(size: CGSize(width: capacityView.frame.size.width,
                                                      height: CGFloat(144).generateSizeForScreen),
                                         origin: CGPoint(x: capacityView.frame.maxX,
                                                         y: capacityView.frame.maxY),
                                         .downLeft)
    }
    
    //MARK: - API Functions
    func setupTypesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesTypes) { (statusCode, error, typesList: [SpaceType]? ) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            print(typesList)
            self.sortedTypesArray = typesList
            
            for types in typesList {
                self.typesArray.append(types.name ?? "")
            }
            
            self.typesButtons = self.createCapsuleButtons(self.typesArray,
                                                          ColorsBravve.capsuleButton)
            
            for button in self.typesButtons {
                button.addTarget(self, action: #selector(self.selectType), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.typesButtons))
        }
    }
    
    func setupClassificationsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesClassifications) {(statusCode, error, typesList: [SpaceClassification]?) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            print(typesList)
            self.sortedClassificationsArray = typesList
            
            for types in typesList {
                self.classificationsArray.append(types.name ?? "")
            }
            self.classificationButtons = self.createCapsuleButtons(self.classificationsArray,
                                          ColorsBravve.capsuleButton)
            
            for button in self.classificationButtons {
                button.addTarget(self, action: #selector(self.selectClassification), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.classificationButtons))
        }
    }
    
    func setupCategoriesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesCategories) { (statusCode, error, typesList: [SpaceCategory]? ) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            print(typesList)
            self.sortedCategoriesArray = typesList
            
            for types in typesList {
                self.categoriesArray.append(types.name ?? "")
            }
            self.categoriesButtons = self.createCapsuleButtons(self.categoriesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.categoriesButtons {
                button.addTarget(self, action: #selector(self.selectCategories), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.categoriesButtons))
        }
    }
    
    func setupFacilitiesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesFacilities) { (statusCode, error, typesList: [SpaceFacility]? ) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            self.sortedFacilitiesArray = typesList
            
            for types in typesList {
                self.facilitiesArray.append(types.name ?? "")
            }
            self.facilitiesButtons = self.createCapsuleButtons(self.facilitiesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.facilitiesButtons {
                button.addTarget(self, action: #selector(self.selectFacilities), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.facilitiesButtons))
        }
    }
    
    func setupNoisesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesNoises) { (statusCode, error, typesList: [SpaceNoise]? ) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            print(typesList)
            self.sortedNoisesArray = typesList
            
            for types in typesList {
                self.noisesArray.append(types.name ?? "")
            }
            self.noisesButtons = self.createCapsuleButtons(self.noisesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.noisesButtons {
                button.addTarget(self, action: #selector(self.selectNoise), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.noisesButtons))
        }
    }
    
    func setupContractsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesContracts) { (statusCode, error, typesList: [SpaceContract]? ) in
            
            guard let typesList = typesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            print(typesList)
            self.sortedContractsArray = typesList
            for types in typesList {
                self.contractsArray.append(types.name ?? "")
            }
            self.contractsButtons = self.createCapsuleButtons(self.contractsArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.contractsButtons {
                button.addTarget(self, action: #selector(self.selectContract), for: .touchUpInside)
            }
            stackView.addArrangedSubviews(self.setupStackView(self.contractsButtons))
        }
    }
    
    //MARK: selectedItemsArray

    @objc func selectType(button: UIButton) {
        if selectedTypesArray.count >= 1 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = selectedTypesArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedTypesArray = filteredArray
                spaceTypeId = nil
            } else {
                print("Escolha no máximo 1 tipo de espaço.")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedTypesArray.append(button.titleLabel?.text ?? "")
                for type in sortedTypesArray {
                    if button.titleLabel?.text == type.name {
                        spaceTypeId = type.id
                    }
                }
            }
        }
    }
    
    @objc func selectClassification(button: UIButton) {
        if selectedClassificationsArray.count >= 1 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = selectedClassificationsArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedClassificationsArray = filteredArray
                spaceClassificationId = nil
            } else {
                print("Escolha no máximo 1 classificação.")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedClassificationsArray.append(button.titleLabel?.text ?? "")
                for classification in sortedClassificationsArray {
                    if button.titleLabel?.text == classification.name {
                        spaceClassificationId = classification.id
                    }
                }
            }
        }
    }
    
    @objc func selectCategories(button: UIButton) {
        if selectedCategoriesArray.count >= 1 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = selectedCategoriesArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedCategoriesArray = filteredArray
                spaceCategoryId = nil
            } else {
                print("Escolha no máximo 1 categoria.")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedCategoriesArray.append(button.titleLabel?.text ?? "")
                for category in sortedCategoriesArray {
                    if button.titleLabel?.text == category.name {
                        spaceCategoryId = category.id
                    }
                }
            }
        }
    }
    
    @objc func selectFacilities(button: UIButton) {
        if button.isSelected == true {
            button.isSelected.toggle()
            button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
            button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            let filteredArray = selectedFacilitiesArray.filter {$0 != button.titleLabel?.text ?? ""}
            selectedFacilitiesArray = filteredArray
            for facility in sortedFacilitiesArray {
                if button.titleLabel?.text == facility.name{
                    let typeId = facility.id
                    let filteredIds = spaceFacilitiesId?.filter {$0 != typeId}
                    spaceFacilitiesId = filteredIds
                }
            }
            print("kaueteste \(sortedFacilitiesArray)")
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedFacilitiesArray.append(button.titleLabel?.text ?? "")
                for facility in sortedFacilitiesArray {
                  
                    if button.titleLabel?.text == facility.name {
                        guard let facilityId = facility.id else {return}
                        
                        if spaceFacilitiesId == nil {
                            spaceFacilitiesId = []
                        }
                        spaceFacilitiesId?.append(facilityId)
                    }
                }
                
            } else {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = .white
                let filteredArray = selectedFacilitiesArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedFacilitiesArray = filteredArray
                for facility in sortedFacilitiesArray {
                    if button.titleLabel?.text == facility.name?.description {
                        let typeId = facility.id ?? 0
                        let filteredIds = spaceFacilitiesId?.filter {$0 != typeId}
                        spaceFacilitiesId = filteredIds
                    }
                }
            }
        }
        print("kaue \(selectedFacilitiesArray)")
        print("kaue \(spaceFacilitiesId)")
    }
    
    @objc func selectNoise(button: UIButton) {
        if selectedNoisesArray.count >= 1 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = selectedNoisesArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedNoisesArray = filteredArray
                spaceNoiseId = nil
            } else {
                print("Escolha no máximo 1 tipo de conforto auditivo.")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedNoisesArray.append(button.titleLabel?.text ?? "")
                for noise in sortedNoisesArray {
                    if button.titleLabel?.text == noise.name {
                        spaceNoiseId = noise.id
                    }
                }
            }
        }
    }
    
    @objc func selectContract(button: UIButton) {
        if selectedContractsArray.count >= 1 {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
                let filteredArray = selectedContractsArray.filter {$0 != button.titleLabel?.text ?? ""}
                selectedContractsArray = filteredArray
                spaceContractId = nil
            } else {
                print("Escolha no máximo 1 tipo de contrato.")
            }
        } else {
            button.isSelected.toggle()
            if button.isSelected {
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                button.configuration?.baseForegroundColor = .white
                selectedContractsArray.append(button.titleLabel?.text ?? "")
                for contract in sortedContractsArray {
                    if button.titleLabel?.text == contract.name {
                        spaceContractId = contract.id
                    }
                }
            } 
        }
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

extension FilterScreen: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
