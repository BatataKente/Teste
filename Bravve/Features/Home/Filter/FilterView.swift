//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import UIKit
import Alamofire

final class FilterScreen: UIViewController {
    
    
    //MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    
    //MARK: - init
    init(_ spaceParameters: SpaceListParameters = SpaceListParameters(space_state_id: nil, space_city_id: nil, allow_workpass: nil, seats_qty: nil, space_type_id: nil, space_classification_id: nil, space_category_id: nil, space_facilities_id: nil, space_noise_level_id: nil, space_contract_Type: nil), _ seletedItemsArray: [String] = []) {
        
        self.filterViewModel = FilterViewModel(spaceParameters, seletedItemsArray)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - var and let
    
    private let filterViewModel: FilterViewModel
    
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()

    let uiview: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   
                                                                   ButtonsBravve.exitGray.rawValue])
    
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
            capacityView.widthAnchor.constraint(equalToConstant: 121),
            capacityView.heightAnchor.constraint(equalToConstant: 60),
        
            //MARK: capacityLabel
            capacityLabel.topAnchor.constraint(equalTo: capacityView.topAnchor, constant: 12),
            capacityLabel.leadingAnchor.constraint(equalTo: capacityView.leadingAnchor, constant: 16),
            
            
            //MARK: numberLabel
            numberLabel.topAnchor.constraint(equalTo: capacityLabel.bottomAnchor, constant: 7),
            numberLabel.leadingAnchor.constraint(equalTo: capacityView.leadingAnchor, constant: 16),
            numberLabel.bottomAnchor.constraint(equalTo: capacityView.bottomAnchor, constant: 11),
            
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

