//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import UIKit
import Alamofire

final class FilterScreen: UIViewController {
    
    init(_ spaceParameters: SpaceListParameters = SpaceListParameters(space_state_id: nil, space_city_id: nil, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil), _ seletedItemsArray: [String] = []) {
        
        self.filterViewModel = FilterViewModel(spaceParameters, seletedItemsArray)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - var and let
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        
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
 
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    private let filterViewModel: FilterViewModel
    
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
        
        filterViewModel.delegate = self
        filterViewModel.setupTypesButtons(roomsStackspaceType)
        filterViewModel.setupClassificationsButtons(roomsStackClassification)
        filterViewModel.setupCategoriesButtons(roomsStackCategory)
        filterViewModel.setupFacilitiesButtons(roomsStackFacilities)
        filterViewModel.setupNoisesButtons(roomsStackNoise)
        filterViewModel.setupContractsButtons(roomsStackContract)
        filterViewModel.selectedItemsArray = []
        
        if filterViewModel.spaceParameters.seats_qty != nil {
            if let seatLabel = filterViewModel.spaceParameters.seats_qty {
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
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - clearTap
    @objc private func clearTap() {
        
        for button in filterViewModel.typesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedTypesArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        for button in filterViewModel.classificationButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedClassificationsArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        for button in filterViewModel.categoriesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedCategoriesArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        for button in filterViewModel.facilitiesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedFacilitiesArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        for button in filterViewModel.noisesButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedNoisesArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        for button in filterViewModel.contractsButtons {
            if button.isSelected == true {
                button.isSelected.toggle()
                button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
                button.configuration?.baseForegroundColor = UIColor(named: ColorsBravve.textField.rawValue)
            }
            filterViewModel.selectedContractsArray = []
            filterViewModel.selectedItemsArray = []
        }
        
        numberLabel.text = nil
        filterViewModel.spaceNoiseId = nil
        filterViewModel.spaceContractId = nil
        filterViewModel.spaceTypeId = nil
        filterViewModel.spaceClassificationId = nil
        filterViewModel.spaceCategoryId = nil
        filterViewModel.spaceFacilitiesId = nil
    }
    
    @objc private func filterButtonTapped(){
        
        if filterViewModel.selectedTypesArray.count > 0 {
            filterViewModel.selectedItemsArray.append(filterViewModel.selectedTypesArray[0])
        }
        if filterViewModel.selectedClassificationsArray.count > 0 {
            filterViewModel.selectedItemsArray.append(filterViewModel.selectedClassificationsArray[0])
        }
        if filterViewModel.selectedCategoriesArray.count > 0 {
            filterViewModel.selectedItemsArray.append(filterViewModel.selectedCategoriesArray[0])
        }
        if filterViewModel.selectedNoisesArray.count > 0 {
            filterViewModel.selectedItemsArray.append(filterViewModel.selectedNoisesArray[0])
        }
        if filterViewModel.selectedContractsArray.count > 0 {
            filterViewModel.selectedItemsArray.append(filterViewModel.selectedContractsArray[0])
        }
        filterViewModel.selectedItemsArray.append(contentsOf: filterViewModel.selectedFacilitiesArray)
        print(filterViewModel.selectedItemsArray)
        
        filterViewModel.spaceParameters.space_type_id = filterViewModel.spaceTypeId
        filterViewModel.spaceParameters.space_classification_id = filterViewModel.spaceClassificationId
        filterViewModel.spaceParameters.space_category_id = filterViewModel.spaceCategoryId
        filterViewModel.spaceParameters.space_noise_level_id = filterViewModel.spaceNoiseId
        filterViewModel.spaceParameters.space_contract_Type = filterViewModel.spaceContractId
        filterViewModel.spaceParameters.space_facilities_id = filterViewModel.spaceFacilitiesId
        
        if numberLabel.text == "16+" {
            numberLabel.text = "16"
        }
        filterViewModel.spaceParameters.seats_qty = Int(numberLabel.text ?? "")

        let HomeOpenView = HomeOpenView(true, filterViewModel.spaceParameters,
                                        filterViewModel.selectedItemsArray)
        self.navigationController?.pushViewController(HomeOpenView, animated: true)
    }
    
    //MARK: - capacityTap
    @objc private func capacityTap() {
        
        capacityDropDown.showLikeAWindow(size: CGSize(width: capacityView.frame.size.width,
                                                      height: CGFloat(144).generateSizeForScreen),
                                         origin: CGPoint(x: capacityView.frame.maxX,
                                                         y: capacityView.frame.maxY),
                                         .downLeft)
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

extension FilterScreen: FilterViewModelProtocol {
    
    func setTypes(_ stackView: UIStackView) {
        
        filterViewModel.typesButtons = self.createCapsuleButtons(filterViewModel.typesArray,
                                                      ColorsBravve.capsuleButton)
        
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.typesButtons, by: 2))
    }
    
    func setClassifications(_ stackView: UIStackView) {
        
        filterViewModel.classificationButtons = self.createCapsuleButtons(filterViewModel.classificationsArray,
                                      ColorsBravve.capsuleButton)
        
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.classificationButtons, by: 2))
    }
    
    func setCategories(_ stackView: UIStackView) {
        
        filterViewModel.categoriesButtons = self.createCapsuleButtons(filterViewModel.categoriesArray,
                                                           ColorsBravve.capsuleButton)
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.categoriesButtons, by: 2))
    }
    
    func setFacilities(_ stackView: UIStackView) {
        
        filterViewModel.facilitiesButtons = self.createCapsuleButtons(filterViewModel.facilitiesArray,
                                                           ColorsBravve.capsuleButton)
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.facilitiesButtons, by: 2))
    }
    
    func setNoises(_ stackView: UIStackView) {
        
        filterViewModel.noisesButtons = self.createCapsuleButtons(filterViewModel.noisesArray,
                                                           ColorsBravve.capsuleButton)
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.noisesButtons, by: 2))
    }
    
    func setContracts(_ stackView: UIStackView) {
        
        filterViewModel.contractsButtons = self.createCapsuleButtons(filterViewModel.contractsArray,
                                                           ColorsBravve.capsuleButton)
        stackView.addArrangedSubviews(filterViewModel.createStackViews(filterViewModel.contractsButtons, by: 2))
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
