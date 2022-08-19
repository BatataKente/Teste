//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import Foundation
import UIKit


final class FilterScreen: UIViewController {
    
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
        view.setImage(UIImage(named: "arrowUp"), for: .selected)
        view.setImage(UIImage(named: "arrowDown"), for: .normal)
        view.addTarget(self, action: #selector(capacityTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
    
    
    //MARK: - stackSpaceType
    private lazy var stackSpaceType1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackSpaceType
    private lazy var stackSpaceType2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackSpaceType3
    private lazy var stackSpaceType3: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: roomsStackspaceType2
    private lazy var roomsStackspaceType: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackSpaceType1,stackSpaceType2,stackSpaceType3])
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
    
    //MARK: - stackClassification1
    private lazy var stackClassification1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackClassification2
    private lazy var stackClassification2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: stackClassification
    private lazy var roomsStackClassification: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackClassification1,stackClassification2])
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
    
    //MARK: - stackClassification1
    private lazy var stackCategory1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackClassification2
    private lazy var stackCategory2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackClassification
    private lazy var roomsStackCategory: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackCategory1,stackCategory2])
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
    
    //MARK: - stackFacilities1
    private lazy var stackFacilities1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: stackFacilities2
    private lazy var stackFacilities2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities3
    private lazy var stackFacilities3: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities4
    private lazy var stackFacilities4: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities5
    private lazy var stackFacilities5: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities6
    private lazy var stackFacilities6: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities7
    private lazy var stackFacilities7: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities8
    private lazy var stackFacilities8: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities9
    private lazy var stackFacilities9: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities10
    private lazy var stackFacilities10: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    //MARK: - stackFacilities
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackFacilities1,stackFacilities2,stackFacilities3, stackFacilities4, stackFacilities5,stackFacilities6,stackFacilities7, stackFacilities8, stackFacilities9, stackFacilities10])
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
    
    //MARK: - stackContract1
    private lazy var stackContract1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()
    
    //MARK: - stackContract2
    private lazy var stackContract2: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.axis = .horizontal
        view.spacing = 4
        return view
    }()
    
    //MARK: roomsImageContract
    private lazy var roomsStackContract: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackContract1,stackContract2])
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
        setupTypesButtons()
        setupClassificationsButtons()
        setupCategoriesButtons()
        setupFacilitiesButtons()
        setupNoisesButtons()
        setupContractsButtons()
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
    
    //MARK: - API Functions
    func setupTypesButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesTypes) { (typesList: [SpaceType]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.typesArray.append(types.name ?? ""))
            }
            self.typesButtons = self.createCapsuleButtons(self.typesArray, ColorsBravve.capsuleButton)
            
            for button in self.typesButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackSpaceType1 .addArrangedSubviews([self.typesButtons[0], self.typesButtons[1]])
            self.stackSpaceType2 .addArrangedSubviews([self.typesButtons[2], self.typesButtons[3]])
            self.stackSpaceType3 .addArrangedSubviews([self.typesButtons[4], self.typesButtons[5]])
        }
    }
    
    func setupClassificationsButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesClassifications) { (typesList: [SpaceClassification]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.classificationsArray.append(types.name ?? ""))
            }
            self.classificationButtons = self.createCapsuleButtons(self.classificationsArray, ColorsBravve.capsuleButton)
            
            for button in self.classificationButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackClassification1 .addArrangedSubviews([self.classificationButtons[0], self.classificationButtons[1]])
            self.stackClassification2 .addArrangedSubviews([self.classificationButtons[2], self.classificationButtons[3]])
        }
    }
    
    func setupCategoriesButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesCategories) { (typesList: [SpaceCategory]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.categoriesArray.append(types.name ?? ""))
            }
            self.categoriesButtons = self.createCapsuleButtons(self.categoriesArray, ColorsBravve.capsuleButton)
            
            for button in self.categoriesButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackCategory1 .addArrangedSubviews([self.categoriesButtons[0], self.categoriesButtons[1]])
            self.stackCategory2 .addArrangedSubviews([self.categoriesButtons[2], self.categoriesButtons[3]])
        }
    }
    
    func setupFacilitiesButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesFacilities) { (typesList: [SpaceFacility]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.facilitiesArray.append(types.name ?? ""))
            }
            self.facilitiesButtons = self.createCapsuleButtons(self.facilitiesArray, ColorsBravve.capsuleButton)
            
            for button in self.facilitiesButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackFacilities1 .addArrangedSubviews([self.facilitiesButtons[0], self.facilitiesButtons[1]])
            self.stackFacilities2 .addArrangedSubviews([self.facilitiesButtons[2], self.facilitiesButtons[3]])
            self.stackFacilities3 .addArrangedSubviews([self.facilitiesButtons[4], self.facilitiesButtons[5]])
            self.stackFacilities4 .addArrangedSubviews([self.facilitiesButtons[6], self.facilitiesButtons[7]])
            self.stackFacilities5 .addArrangedSubviews([self.facilitiesButtons[8], self.facilitiesButtons[9]])
            self.stackFacilities6 .addArrangedSubviews([self.facilitiesButtons[10], self.facilitiesButtons[11]])
            self.stackFacilities7 .addArrangedSubviews([self.facilitiesButtons[12], self.facilitiesButtons[13]])
            self.stackFacilities8 .addArrangedSubviews([self.facilitiesButtons[14], self.facilitiesButtons[15]])
            self.stackFacilities9 .addArrangedSubviews([self.facilitiesButtons[16], self.facilitiesButtons[17]])
            self.stackFacilities10 .addArrangedSubviews([self.facilitiesButtons[18], self.facilitiesButtons[19]])
        }
    }
    
    func setupNoisesButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesNoises) { (typesList: [SpaceNoise]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.noisesArray.append(types.name ?? ""))
            }
            self.noisesButtons = self.createCapsuleButtons(self.noisesArray, ColorsBravve.capsuleButton)
            
            for button in self.noisesButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackNoises1 .addArrangedSubviews([self.noisesButtons[0], self.noisesButtons[1]])
        }
    }
    
    func setupContractsButtons() {
        
        sessionManager.getOpenDataArray(endpoint: .spacesContracts) { (typesList: [SpaceContract]? ) in
            
            guard let typesList = typesList else { return }
            
            for types in typesList {
                (self.contractsArray.append(types.name ?? ""))
            }
            self.contractButtons = self.createCapsuleButtons(self.contractsArray, ColorsBravve.capsuleButton)
            
            for button in self.contractButtons {
                button.addTarget(self, action: #selector(self.selectItems), for: .touchUpInside)
            }
            self.stackContract1 .addArrangedSubviews([self.contractButtons[0], self.contractButtons[1]])
            self.stackContract2 .addArrangedSubviews([self.contractButtons[2], self.contractButtons[3]])
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
            
            //MARK: scroolView
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
            exitButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 35),
            exitButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            exitButton.widthAnchor.constraint(equalToConstant: 14),
            exitButton.heightAnchor.constraint(equalToConstant: 14),
            
            //MARK: filterLabel
            filterLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 19),
            filterLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            filterLabel.widthAnchor.constraint(equalToConstant: 93),
            filterLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //MARK: clearLabel
            clearButton.centerYAnchor.constraint(equalTo: filterLabel.centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -35),
            
            //MARK: capacityView
            capacityView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 19),
            capacityView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
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
            spaceType.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackspaceType.topAnchor.constraint(equalTo: spaceType.bottomAnchor, constant: 19),
            roomsStackspaceType.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackspaceType.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            //MARK: lineImage2
            lineImage2.topAnchor.constraint(equalTo: roomsStackspaceType.bottomAnchor, constant: 19),
            lineImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage2.heightAnchor.constraint(equalToConstant: 1),
            
            classificationLabel.topAnchor.constraint(equalTo: lineImage2.bottomAnchor, constant: 19),
            classificationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackClassification.topAnchor.constraint(equalTo: classificationLabel.bottomAnchor, constant: 19),
            roomsStackClassification.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackClassification.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            //MARK: lineImage3
            lineImage3.topAnchor.constraint(equalTo: roomsStackClassification.bottomAnchor, constant: 19),
            lineImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage3.heightAnchor.constraint(equalToConstant: 1),
            
            categoryLabel.topAnchor.constraint(equalTo: lineImage3.bottomAnchor, constant: 19),
            categoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackCategory.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 19),
            roomsStackCategory.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackCategory.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            //MARK: lineImage4
            lineImage4.topAnchor.constraint(equalTo: roomsStackCategory.bottomAnchor, constant: 19),
            lineImage4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage4.heightAnchor.constraint(equalToConstant: 1),
            
            facilitiesLabel.topAnchor.constraint(equalTo: lineImage4.bottomAnchor, constant: 19),
            facilitiesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackFacilities.topAnchor.constraint(equalTo: facilitiesLabel.bottomAnchor, constant: 19),
            roomsStackFacilities.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackFacilities.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            //MARK: lineImage5
            lineImage5.topAnchor.constraint(equalTo: roomsStackFacilities.bottomAnchor, constant: 19),
            lineImage5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage5.heightAnchor.constraint(equalToConstant: 1),
            
            NoiseLabel.topAnchor.constraint(equalTo: lineImage5.bottomAnchor, constant: 19),
            NoiseLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackNoise.topAnchor.constraint(equalTo: NoiseLabel.bottomAnchor, constant: 19),
            roomsStackNoise.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackNoise.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            //MARK: lineImage6
            lineImage6.topAnchor.constraint(equalTo: roomsStackNoise.bottomAnchor, constant: 19),
            lineImage6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage6.heightAnchor.constraint(equalToConstant: 1),
            
            typeOfContarctLabel.topAnchor.constraint(equalTo: lineImage6.bottomAnchor, constant: 19),
            typeOfContarctLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackContract.topAnchor.constraint(equalTo: typeOfContarctLabel.bottomAnchor, constant: 19),
            roomsStackContract.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackContract.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
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




