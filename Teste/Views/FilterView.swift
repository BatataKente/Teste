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
    let scrollView = UIScrollView()
    let uiview = UIView()
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   
                                                                   ButtonsBravve.exitGray.rawValue])
    
    //MARK: - filterButton
    private lazy var filterButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        view.setTitle("Filtrar", for: .normal)
        view.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue, size: 16)
        view.titleLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: 13)
        view.setTitleColor(UIColor.white, for: .normal)
        //        view.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        return view
    }()
    
    
    //MARK: - exitButton
    private lazy var exitButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: ButtonsBravve.xmarkBlue.rawValue), for: .normal)
        view.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        return view
    }()
    
    
    //MARK: - filterLabel
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filtrar"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - capacityView
    private lazy var capacityView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: - capacityLabel
    private lazy var capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Capacidade"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: ColorsBravve.textFieldLabel.rawValue)
        return label
    }()
    
    //MARK: numberLabel
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "16+"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: capacityButton
    private lazy var capacityButton: UIButton = {
        let view = UIButton()
//        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.setImage(UIImage(named: ButtonsBravve.arrowDown.rawValue), for: .normal)
        
        let origin = CGPoint(x: 20,
                             y: 187)
        
        view.addSubWindow(capacityDropDown, origin: origin)
//        view.addTarget(self, action: #selector(capacityTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: capacityDropDown
    private lazy var capacityDropDown: UIScrollView = {
        
        let capacityDropDown = UIScrollView(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: 121, height: 180))
        
        var buttons = [UIButton]()
        let capacities = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16+"]
        
        for capacity in capacities {
            
            let button = UIButton()
            button.setTitle(capacity, for: .normal)
            button.setTitleColor(UIColor(named: ColorsBravve.label.rawValue),
                                 for: .normal)
            button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue,
                                             size: CGFloat(14).generateSizeForScreen)
            
            buttons.append(button)
        }
        capacityDropDown.turnIntoAList(buttons)
        capacityDropDown.delegate = self
        
        return capacityDropDown
    }()
    
    // NÃO TEM LINE NO ENUM
    //MARK: lineImage
    private lazy var lineImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - spaceType
    private lazy var spaceType: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Espaço"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: roomsStackspaceType2
    private lazy var roomsStackspaceType: UIStackView = {
        let view = UIStackView()
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    // NÃO TEM LINE NO ENUM
    //MARK: lineImage2
    private lazy var lineImage2: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - ClassificationLabel
    private lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Classificação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: stackClassification
    private lazy var roomsStackClassification: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - lineImage3
    private lazy var lineImage3: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // COR DA LABEL
    //MARK: categoryLabel
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categoria"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - stackClassification
    private lazy var roomsStackCategory: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - lineImage4
    private lazy var lineImage4: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - faciltiesLabel
    private lazy var facilitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Facilities"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - stackFacilities
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - lineImage5
    private lazy var lineImage5: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - NoiseAudio
    private lazy var NoiseLabel: UILabel = {
        let label = UILabel()
        label.text = "Conforto Auditivo"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - lineImage6
    private lazy var lineImage6: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - typeOfContarctLabel
    private lazy var typeOfContarctLabel: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Contratação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: roomsImageContract
    private lazy var roomsStackContract: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.spacing = 4
        view.alignment = .leading
        view.axis = .vertical
        return view
    }()
    
    //MARK: - lineImage7
    private lazy var lineImage7: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: ColorsBravve.grayAlertLabel.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        uiview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([scrollView,tabBar])
        scrollView.addSubviews([uiview,
                                exitButton,
                                filterLabel,
                                clearButton,
                                capacityView,
                                capacityLabel,
                                numberLabel,
                                capacityButton,
                                lineImage,
                                spaceType,
                                roomsStackspaceType,
                                lineImage2,
                                classificationLabel,
                                roomsStackClassification,
                                lineImage3,
                                categoryLabel,
                                roomsStackCategory,
                                lineImage4,
                                facilitiesLabel,
                                roomsStackFacilities,
                                lineImage5,
                                NoiseLabel,
                                roomsStackNoise,
                                lineImage6,
                                typeOfContarctLabel,
                                roomsStackContract,
                                lineImage7,
                                filterButton,
                                capacityDropDown,
                               ])
        
        tabBar.selectedItem = tabBar.items?[0]
        
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
        capacityButton.isSelected.toggle()
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
    
    //MARK: - API Functions
    
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
    
    func setupTypesButtons(_ stackView: UIStackView) {
        
        sessionManager.getOpenDataArray(endpoint: .spacesTypes) { (typesList: [SpaceType]? ) in
            
            guard let typesList = typesList else {return}
            
            for types in typesList {
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
        NSLayoutConstraint.activate([
            
            //MARK: scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //MARK: Filter & Capacity & Clear
            uiview.topAnchor.constraint(equalTo: scrollView.topAnchor),
            uiview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            uiview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            uiview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            uiview.heightAnchor.constraint(equalToConstant: 1250),
            uiview.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            //MARK: exitButton
            exitButton.topAnchor.constraint(equalTo: uiview.topAnchor, constant: 35),
            exitButton.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            exitButton.widthAnchor.constraint(equalToConstant: 14),
            exitButton.heightAnchor.constraint(equalToConstant: 14),
            
            //MARK: filterLabel
            filterLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 19),
            filterLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            filterLabel.widthAnchor.constraint(equalToConstant: 93),
            filterLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //MARK: clearLabel
            clearButton.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -35),
            
            //MARK: capacityView
            capacityView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 19),
            capacityView.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            capacityView.widthAnchor.constraint(equalToConstant: 121),
            capacityView.heightAnchor.constraint(equalToConstant: 60),
            
            //MARK: capacityLabel
            capacityLabel.topAnchor.constraint(equalTo: capacityView.topAnchor, constant: 12),
            capacityLabel.leadingAnchor.constraint(equalTo: capacityView.leadingAnchor, constant: 16),
            capacityLabel.trailingAnchor.constraint(equalTo: capacityView.trailingAnchor, constant: -48),
            capacityLabel.widthAnchor.constraint(equalToConstant: 67),
            capacityLabel.heightAnchor.constraint(equalToConstant: 13),
            
            //MARK: numberLabel
            numberLabel.topAnchor.constraint(equalTo: capacityLabel.bottomAnchor, constant: 7),
            numberLabel.leadingAnchor.constraint(equalTo: capacityView.leadingAnchor, constant: 16),
            numberLabel.widthAnchor.constraint(equalToConstant: 26),
            numberLabel.heightAnchor.constraint(equalToConstant: 17),
            
            //MARK: capacityButton
            capacityButton.topAnchor.constraint(equalTo: capacityView.topAnchor, constant: 28),
            capacityButton.centerYAnchor.constraint(equalTo: capacityView.centerYAnchor),
            capacityButton.leadingAnchor.constraint(equalTo: capacityLabel.trailingAnchor, constant: 22),
            capacityButton.widthAnchor.constraint(equalToConstant: 13.3),
            capacityButton.heightAnchor.constraint(equalToConstant: 7.66),
            
            //MARK: lineImage
            lineImage.topAnchor.constraint(equalTo: capacityView.bottomAnchor, constant: 16),
            lineImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage.heightAnchor.constraint(equalToConstant: 1),
            
            spaceType.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 19),
            spaceType.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackspaceType.topAnchor.constraint(equalTo: spaceType.bottomAnchor, constant: 19),
            roomsStackspaceType.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackspaceType.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage2
            lineImage2.topAnchor.constraint(equalTo: roomsStackspaceType.bottomAnchor, constant: 19),
            lineImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage2.heightAnchor.constraint(equalToConstant: 1),
            
            classificationLabel.topAnchor.constraint(equalTo: lineImage2.bottomAnchor, constant: 19),
            classificationLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackClassification.topAnchor.constraint(equalTo: classificationLabel.bottomAnchor, constant: 19),
            roomsStackClassification.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackClassification.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage3
            lineImage3.topAnchor.constraint(equalTo: roomsStackClassification.bottomAnchor, constant: 19),
            lineImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage3.heightAnchor.constraint(equalToConstant: 1),
            
            categoryLabel.topAnchor.constraint(equalTo: lineImage3.bottomAnchor, constant: 19),
            categoryLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackCategory.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 19),
            roomsStackCategory.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackCategory.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage4
            lineImage4.topAnchor.constraint(equalTo: roomsStackCategory.bottomAnchor, constant: 19),
            lineImage4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage4.heightAnchor.constraint(equalToConstant: 1),
            
            facilitiesLabel.topAnchor.constraint(equalTo: lineImage4.bottomAnchor, constant: 19),
            facilitiesLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackFacilities.topAnchor.constraint(equalTo: facilitiesLabel.bottomAnchor, constant: 19),
            roomsStackFacilities.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackFacilities.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage5
            lineImage5.topAnchor.constraint(equalTo: roomsStackFacilities.bottomAnchor, constant: 19),
            lineImage5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage5.heightAnchor.constraint(equalToConstant: 1),
            
            NoiseLabel.topAnchor.constraint(equalTo: lineImage5.bottomAnchor, constant: 19),
            NoiseLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackNoise.topAnchor.constraint(equalTo: NoiseLabel.bottomAnchor, constant: 19),
            roomsStackNoise.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackNoise.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage6
            lineImage6.topAnchor.constraint(equalTo: roomsStackNoise.bottomAnchor, constant: 19),
            lineImage6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage6.heightAnchor.constraint(equalToConstant: 1),
            
            typeOfContarctLabel.topAnchor.constraint(equalTo: lineImage6.bottomAnchor, constant: 19),
            typeOfContarctLabel.leadingAnchor.constraint(equalTo: uiview.leadingAnchor, constant: 20),
            
            roomsStackContract.topAnchor.constraint(equalTo: typeOfContarctLabel.bottomAnchor, constant: 19),
            roomsStackContract.leadingAnchor.constraint(equalTo: uiview .leadingAnchor, constant: 20),
            roomsStackContract.trailingAnchor.constraint(equalTo: uiview.trailingAnchor, constant: -20),
            
            //MARK: lineImage6
            lineImage7.topAnchor.constraint(equalTo: roomsStackContract.bottomAnchor, constant: 19),
            lineImage7.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage7.heightAnchor.constraint(equalToConstant: 1),
            
            //MARK: FilterButton
            filterButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            filterButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
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
