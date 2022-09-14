//
//  FilterViewClosed.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 26/08/22.
//

import UIKit

final class FilterViewClosed: UIViewController {
    
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    
    //MARK: - init
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
    
    
    //MARK: - var and let
    
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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    private lazy var  uiview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var tabBar = TabBarClosed(self)
    
    //MARK: - filterButton
    private lazy var filterButton: UIButton = UIButton()
    
    //MARK: - exitButton
    private lazy var exitButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.xmarkBlue.rawValue), for: .normal)
        view.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - filterLabel
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filtrar"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - capacityView
    private lazy var capacityView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: ColorsBravve.cards.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - capacityLabel
    private lazy var capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Capacidade"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 11)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: numberLabel
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: capacityButton
    private lazy var capacityButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        view.addTarget(self, action: #selector(capacityTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - capacityDropDown
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
                
                
                self.numberLabel.text =  button.currentTitle
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
            line.translatesAutoresizingMaskIntoConstraints = false
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: roomsStackspaceType2
    private lazy var roomsStackspaceType: UIStackView = {
        let view = UIStackView()
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - ClassificationLabel
    private lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Classificação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: stackClassification
    private lazy var roomsStackClassification: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: categoryLabel
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categoria"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - stackClassification
    private lazy var roomsStackCategory: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - faciltiesLabel
    private lazy var facilitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Facilities"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - stackFacilities
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - NoiseAudio
    private lazy var NoiseLabel: UILabel = {
        let label = UILabel()
        label.text = "Conforto Auditivo"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - stackNoises1
    private lazy var stackNoises1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: roomsStackNoise
    private lazy var roomsStackNoise: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackNoises1])
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - typeOfContarctLabel
    private lazy var typeOfContarctLabel: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Contratação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: roomsImageContract
    private lazy var roomsStackContract: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - createStackView
    private func createStackView(_ views: [UIView]) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        
        stackView.spacing = 4
        stackView.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    
   
    //MARK: - loadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        view.heightAnchor.constraint(equalToConstant: 1700).isActive = true
        setupView()
        setupConstrains()
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - setupView
    private func setupView() {
        setupTypesButtons(roomsStackspaceType)
        setupClassificationsButtons(roomsStackClassification)
        setupCategoriesButtons(roomsStackCategory)
        setupFacilitiesButtons(roomsStackFacilities)
        setupNoisesButtons(roomsStackNoise)
        setupContractsButtons(roomsStackContract)
        selectedItemsArray = []
        
        if spaceParameters.seats_qty != nil {
            if let seatLabel = spaceParameters.seats_qty {
                numberLabel.text = String(seatLabel)
            }
        }
        
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
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedTypesArray = []
                selectedItemsArray = []
        }
        
        for button in classificationButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedClassificationsArray = []
                selectedItemsArray = []
        }
        
        for button in categoriesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedCategoriesArray = []
                selectedItemsArray = []
        }
        
        for button in facilitiesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedFacilitiesArray = []
                selectedItemsArray = []
        }
        
        for button in noisesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedNoisesArray = []
                selectedItemsArray = []
        }
        
        for button in contractsButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
                selectedContractsArray = []
                selectedItemsArray = []
        }
        
        numberLabel.text = nil
        spaceNoiseId = nil
        spaceContractId = nil
        spaceTypeId = nil
        spaceClassificationId = nil
        spaceCategoryId = nil
        spaceFacilitiesId = nil
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

        let homeClosedView = HomeClosedView(true, spaceParameters, selectedItemsArray)
        homeClosedView.modalPresentationStyle = .fullScreen
        present(homeClosedView, animated: false)
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
            var selectedType = ""
            self.sortedTypesArray = typesList
            
            for type in typesList {
                self.typesArray.append(type.name ?? "")
                if self.spaceParameters.space_type_id != nil {
                    self.spaceTypeId = self.spaceParameters.space_type_id
                    if self.spaceParameters.space_type_id == type.id {
                        selectedType = type.name ?? ""
                    }
                }
            }
            
            self.typesButtons = self.createCapsuleButtons(self.typesArray,
                                                          ColorsBravve.capsuleButton)
            
            for button in self.typesButtons {
                button.addTarget(self, action: #selector(self.selectType), for: .touchUpInside)
                if button.titleLabel?.text == selectedType {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedTypesArray.append(button.titleLabel?.text ?? "")
                }
            }
            stackView.addArrangedSubviews(self.setupStackView(self.typesButtons))
        }
    }
    
    func setupClassificationsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesClassifications) {(statusCode, error, classificationsList: [SpaceClassification]?) in
            
            guard let classificationsList = classificationsList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            var selectedClassification = ""
            self.sortedClassificationsArray = classificationsList
            
            for classification in classificationsList {
                self.classificationsArray.append(classification.name ?? "")
                if self.spaceParameters.space_classification_id != nil {
                    self.spaceClassificationId = self.spaceParameters.space_classification_id
                    if self.spaceParameters.space_classification_id == classification.id {
                        selectedClassification = classification.name ?? ""
                    }
                }
            }
            self.classificationButtons = self.createCapsuleButtons(self.classificationsArray,
                                          ColorsBravve.capsuleButton)
            
            for button in self.classificationButtons {
                button.addTarget(self, action: #selector(self.selectClassification), for: .touchUpInside)
                if button.titleLabel?.text == selectedClassification {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedClassificationsArray.append(button.titleLabel?.text ?? "")
                }
            }
            stackView.addArrangedSubviews(self.setupStackView(self.classificationButtons))
        }
    }
    
    func setupCategoriesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesCategories) { (statusCode, error, categoriesList: [SpaceCategory]? ) in
            
            guard let categoriesList = categoriesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            var selectedcategory = ""
            self.sortedCategoriesArray = categoriesList
            
            for category in categoriesList {
                self.categoriesArray.append(category.name ?? "")
                if self.spaceParameters.space_category_id != nil {
                    self.spaceCategoryId = self.spaceParameters.space_category_id
                    if self.spaceParameters.space_category_id == category.id {
                        selectedcategory = category.name ?? ""
                    }
                }
                
            }
            self.categoriesButtons = self.createCapsuleButtons(self.categoriesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.categoriesButtons {
                button.addTarget(self, action: #selector(self.selectCategories), for: .touchUpInside)
                if button.titleLabel?.text == selectedcategory {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedCategoriesArray.append(button.titleLabel?.text ?? "")
                }
            }
            stackView.addArrangedSubviews(self.setupStackView(self.categoriesButtons))
        }
    }
    
    func setupFacilitiesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesFacilities) { (statusCode, error, facilitiesList: [SpaceFacility]? ) in
            
            guard let facilitiesList = facilitiesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            var selectedFacilities: [String] = []
            self.sortedFacilitiesArray = facilitiesList
            
            for facility in facilitiesList {
                self.facilitiesArray.append(facility.name ?? "")
                if self.spaceParameters.space_facilities_id != nil {
                    self.spaceFacilitiesId = self.spaceParameters.space_facilities_id
                    for space in self.spaceParameters.space_facilities_id ?? [] {
                        if space == facility.id {
                            selectedFacilities.append(facility.name ?? "")
                        }
                    }
                    
                }
            }
            self.facilitiesButtons = self.createCapsuleButtons(self.facilitiesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.facilitiesButtons {
                button.addTarget(self, action: #selector(self.selectFacilities), for: .touchUpInside)
                for facility in selectedFacilities {
                    if button.titleLabel?.text == facility {
                        button.isSelected = true
                        button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                        button.configuration?.baseForegroundColor = .white
                        self.selectedFacilitiesArray.append(button.titleLabel?.text ?? "")
                    }
                }
            }
            stackView.addArrangedSubviews(self.setupStackView(self.facilitiesButtons))
        }
    }
    
    func setupNoisesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesNoises) { (statusCode, error, noisesList: [SpaceNoise]? ) in
            
            guard let noisesList = noisesList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
                
            }
            var selectedNoise = ""
            self.sortedNoisesArray = noisesList
            
            for noise in noisesList {
                self.noisesArray.append(noise.name ?? "")
                if self.spaceParameters.space_noise_level_id != nil {
                    self.spaceNoiseId = self.spaceParameters.space_noise_level_id
                    if self.spaceParameters.space_noise_level_id == noise.id {
                        selectedNoise = noise.name ?? ""
                    }
                }
            }
            self.noisesButtons = self.createCapsuleButtons(self.noisesArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.noisesButtons {
                button.addTarget(self, action: #selector(self.selectNoise), for: .touchUpInside)
                if button.titleLabel?.text == selectedNoise {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedNoisesArray.append(button.titleLabel?.text ?? "")
                }
            }
            stackView.addArrangedSubviews(self.setupStackView(self.noisesButtons))
        }
    }
    
    func setupContractsButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesContracts) { (statusCode, error, contractList: [SpaceContract]? ) in
            
            guard let contractList = contractList else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            var selectedContract = ""
            self.sortedContractsArray = contractList
            
            for contract in contractList {
                self.contractsArray.append(contract.name ?? "")
                if self.spaceParameters.space_contract_Type != nil {
                    self.spaceContractId = self.spaceParameters.space_contract_Type
                    if self.spaceParameters.space_contract_Type == contract.id {
                        selectedContract = contract.name ?? ""
                    }
                }

            }
            self.contractsButtons = self.createCapsuleButtons(self.contractsArray,
                                                               ColorsBravve.capsuleButton)
            
            for button in self.contractsButtons {
                button.addTarget(self, action: #selector(self.selectContract), for: .touchUpInside)
                if button.titleLabel?.text == selectedContract {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    self.selectedContractsArray.append(button.titleLabel?.text ?? "")
                    button.configuration?.baseForegroundColor = .white
                }
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
                    let facilityId = facility.id
                    let filteredIds = spaceFacilitiesId?.filter {$0 != facilityId}
                    spaceFacilitiesId = filteredIds
                }
            }
          
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
                        let facilityId = facility.id ?? 0
                        let filteredIds = spaceFacilitiesId?.filter {$0 != facilityId}
                        spaceFacilitiesId = filteredIds
                    }
                }
            }
        }
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
    
        
        NSLayoutConstraint.activate([
        
            //MARK: scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            
            //MARK: uiview
            uiview.topAnchor.constraint(equalTo: scrollView.topAnchor),
            uiview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            uiview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            uiview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            uiview.widthAnchor.constraint(equalTo: view.widthAnchor),
            uiview.heightAnchor.constraint(equalToConstant: 1680),
            
            
            //MARK: exitButton
            exitButton.topAnchor.constraint(equalTo: uiview.topAnchor, constant: 20),
            exitButton.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            exitButton.widthAnchor.constraint(equalToConstant: 14),
            exitButton.heightAnchor.constraint(equalToConstant: 14),
            
            
            //MARK: filterLabel
            filterLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 19),
            filterLabel.leadingAnchor.constraint(equalTo: exitButton.leadingAnchor),
            filterLabel.widthAnchor.constraint(equalToConstant: 120),
            
            
            //MARK: clearLabel
            clearButton.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -35),
            
            
            //MARK: capacityView
            capacityView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 19),
            capacityView.leadingAnchor.constraint(equalTo: filterLabel.leadingAnchor),
           
        
            //MARK: capacityLabel
            capacityLabel.topAnchor.constraint(equalTo: capacityView.topAnchor, constant: 12),
            capacityLabel.leadingAnchor.constraint(equalTo: capacityView.leadingAnchor, constant: 16),
            
            
            capacityButton.centerYAnchor.constraint(equalTo: capacityView.centerYAnchor),
            capacityButton.trailingAnchor.constraint(equalTo: capacityView.trailingAnchor, constant: -12),
            
            //MARK: lines[0]
            lines[0].topAnchor.constraint(equalTo: capacityView.bottomAnchor, constant: 19),
            lines[0].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[0].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[0].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: spaceType
            spaceType.topAnchor.constraint(equalTo: lines[0].bottomAnchor, constant: 19),
            spaceType.leadingAnchor.constraint(equalTo: lines[0].leadingAnchor),
            
            //MARK: roomsStackspaceType
            roomsStackspaceType.topAnchor.constraint(equalTo: spaceType.bottomAnchor, constant: 19),
            roomsStackspaceType.leadingAnchor.constraint(equalTo: lines[0].leadingAnchor),
            roomsStackspaceType.trailingAnchor.constraint(equalTo: lines[0].trailingAnchor),
            
            
            //MARK: lines[1]
            lines[1].topAnchor.constraint(equalTo: roomsStackspaceType.bottomAnchor, constant: 19),
            lines[1].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[1].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[1].heightAnchor.constraint(equalToConstant: 1),
            
            
            classificationLabel.topAnchor.constraint(equalTo: lines[1].bottomAnchor, constant: 19),
            classificationLabel.leadingAnchor.constraint(equalTo: lines[1].leadingAnchor),
            
            
            //MARK: roomsStackClassification
            roomsStackClassification.topAnchor.constraint(equalTo: classificationLabel.bottomAnchor, constant: 19),
            roomsStackClassification.leadingAnchor.constraint(equalTo: lines[1].leadingAnchor),
            roomsStackClassification.trailingAnchor.constraint(equalTo: lines[1].trailingAnchor),
            
            
            //MARK: lines[2]
            lines[2].topAnchor.constraint(equalTo: roomsStackClassification.bottomAnchor, constant: 19),
            lines[2].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[2].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[2].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: categoryLabel
            categoryLabel.topAnchor.constraint(equalTo: lines[2].bottomAnchor, constant: 19),
            categoryLabel.leadingAnchor.constraint(equalTo: lines[2].leadingAnchor),
            
            
            //MARK: roomsStackCategory
            roomsStackCategory.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 19),
            roomsStackCategory.leadingAnchor.constraint(equalTo: lines[2].leadingAnchor),
            roomsStackCategory.trailingAnchor.constraint(equalTo: lines[2].trailingAnchor),
            
            
            //MARK: lines[3]
            lines[3].topAnchor.constraint(equalTo: roomsStackCategory.bottomAnchor, constant: 19),
            lines[3].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[3].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[3].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: facilitiesLabel
            facilitiesLabel.topAnchor.constraint(equalTo: lines[3].bottomAnchor, constant: 19),
            facilitiesLabel.leadingAnchor.constraint(equalTo: lines[3].leadingAnchor),
            
            
            //MARK: roomsStackFacilities
            roomsStackFacilities.topAnchor.constraint(equalTo: facilitiesLabel.bottomAnchor, constant: 19),
            roomsStackFacilities.leadingAnchor.constraint(equalTo: lines[3].leadingAnchor),
            roomsStackFacilities.trailingAnchor.constraint(equalTo: lines[3].trailingAnchor),
            
            
            //MARK: lines[4]
            lines[4].topAnchor.constraint(equalTo: roomsStackFacilities.bottomAnchor, constant: 19),
            lines[4].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[4].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[4].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: NoiseLabel
            NoiseLabel.topAnchor.constraint(equalTo: lines[4].bottomAnchor, constant: 19),
            NoiseLabel.leadingAnchor.constraint(equalTo: lines[4].leadingAnchor),
            
            
            //MARK: roomsStackNoise
            roomsStackNoise.topAnchor.constraint(equalTo: NoiseLabel.bottomAnchor, constant: 19),
            roomsStackNoise.leadingAnchor.constraint(equalTo: lines[4].leadingAnchor),
            roomsStackNoise.trailingAnchor.constraint(equalTo: lines[4].trailingAnchor),
            
            
            //MARK: lines[5]
            lines[5].topAnchor.constraint(equalTo: roomsStackNoise.bottomAnchor, constant: 19),
            lines[5].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[5].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[5].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: typeOfContarctLabel
            typeOfContarctLabel.topAnchor.constraint(equalTo: lines[5].bottomAnchor, constant: 19),
            typeOfContarctLabel.leadingAnchor.constraint(equalTo: lines[5].leadingAnchor),
            
            
            //MARK: roomsStackContract
            roomsStackContract.topAnchor.constraint(equalTo: typeOfContarctLabel.bottomAnchor, constant: 19),
            roomsStackContract.leadingAnchor.constraint(equalTo: lines[5].leadingAnchor),
            roomsStackContract.trailingAnchor.constraint(equalTo: lines[5].trailingAnchor),
            
            
            //MARK: lines[6]
            lines[6].topAnchor.constraint(equalTo: roomsStackContract.bottomAnchor, constant: 19),
            lines[6].leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            lines[6].trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            lines[6].heightAnchor.constraint(equalToConstant: 1),
            
            
            //MARK: tabBar
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
        ])
}
    
}

extension FilterViewClosed: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
