//
//  FilterModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import UIKit

protocol FilterViewModelProtocol {
    
    func setTypes(_ stackView: UIStackView)
    func setClassifications(_ stackView: UIStackView)
    func setCategories(_ stackView: UIStackView)
    func setFacilities(_ stackView: UIStackView)
    func setNoises(_ stackView: UIStackView)
    func setContracts(_ stackView: UIStackView)
}

class FilterViewModel {
    
    init(_ spaceParameters: SpaceListParameters, _ seletedItemsArray: [String]) {
        
        self.spaceParameters = spaceParameters
        self.selectedItemsArray = seletedItemsArray
    }
    
    var delegate: FilterViewModelProtocol?
    
    var spaceParameters: SpaceListParameters
    var selectedItemsArray: [String]
    
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
    
    /// This function create stackViews with buttons, but organize a custom number of buttons(by) in every stack created
    /// - Parameters:
    ///   - buttons: the buttons
    ///   - by: number of buttons by line(must be > 0)
    /// - Returns: array of stackView
    func createStackViews(_ buttons: [UIButton], by: Int = 3) -> [UIStackView] {

        let createStackView = {(_ views: [UIView]) -> UIStackView in

            let stackView = UIStackView(arrangedSubviews: views)

            stackView.spacing = 4
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally

            return stackView
        }

        var stackViews = [UIStackView]()
        
        if by == 0 {return stackViews}
        if buttons.isEmpty {return stackViews}
        if buttons.count < by {

            stackViews.append(createStackView(buttons))

            return stackViews
        }

        var buttonsSample: [UIButton] = []

        for i in 0...buttons.count%by {

            buttonsSample.append(buttons[i])
        }

        stackViews.append(createStackView(buttonsSample))

        for i in stride(from: buttons.count%by,
                        to: buttons.count - 1,
                        by: by) {

            var buttonsSample: [UIButton] = []

            for j in 0...by-1 {

                buttonsSample.append(buttons[i+j])
            }

            stackViews.append(createStackView(buttonsSample))
        }

        return stackViews
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
            
            self.delegate?.setTypes(stackView)
            
            for button in self.typesButtons {
                button.addTarget(self, action: #selector(self.selectType), for: .touchUpInside)
                if button.titleLabel?.text == selectedType {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedTypesArray.append(button.titleLabel?.text ?? "")
                }
            }
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
            
            self.delegate?.setClassifications(stackView)
            
            for button in self.classificationButtons {
                button.addTarget(self, action: #selector(self.selectClassification), for: .touchUpInside)
                if button.titleLabel?.text == selectedClassification {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedClassificationsArray.append(button.titleLabel?.text ?? "")
                }
            }
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
            
            self.delegate?.setCategories(stackView)
            
            for button in self.categoriesButtons {
                button.addTarget(self, action: #selector(self.selectCategories), for: .touchUpInside)
                if button.titleLabel?.text == selectedcategory {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedCategoriesArray.append(button.titleLabel?.text ?? "")
                }
            }
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
            
            self.delegate?.setFacilities(stackView)
            
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
            
            self.delegate?.setNoises(stackView)
            
            for button in self.noisesButtons {
                button.addTarget(self, action: #selector(self.selectNoise), for: .touchUpInside)
                if button.titleLabel?.text == selectedNoise {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    button.configuration?.baseForegroundColor = .white
                    self.selectedNoisesArray.append(button.titleLabel?.text ?? "")
                }
            }
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
            
            self.delegate?.setContracts(stackView)
            
            for button in self.contractsButtons {
                button.addTarget(self, action: #selector(self.selectContract), for: .touchUpInside)
                if button.titleLabel?.text == selectedContract {
                    button.isSelected = true
                    button.configuration?.background.backgroundColor = UIColor(named: ColorsBravve.capsuleButtonSelected.rawValue)
                    self.selectedContractsArray.append(button.titleLabel?.text ?? "")
                    button.configuration?.baseForegroundColor = .white
                }
            }
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
}
