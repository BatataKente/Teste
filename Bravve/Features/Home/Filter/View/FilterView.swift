

import Foundation
import UIKit


final class FilterScreen: UIViewController {
    
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
        return view
    }()
    
    //MARK: - stackSpaceType
    private lazy var stackSpaceType2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()
    
    //MARK: - stackSpaceType3
    private lazy var stackSpaceType3: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()
    

    private var spaceTypeButtonsLine1 = [UIButton]()
    private let nameSpaceTypeButtonsLine1: [String] = ["Sala de reunião", "Sala privativa"]
    private var spaceTypeButtonsLine2 = [UIButton]()
    private let nameSpaceTypeButtonsLine2: [String] = ["Sala de eventos", "Cabine de call"]
    private var spaceTypeButtonsLine3 = [UIButton]()
    private let nameSpaceTypeButtonsLine3: [String] = ["Área compartilhada", "Smart Office"]
    
    
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
        return view
    }()
    
    //MARK: - stackClassification2
    private lazy var stackClassification2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.layer.borderColor = UIColor(named: ColorsBravve.textFieldBorder.rawValue)?.cgColor
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()

    private var classificationButtonsLine1 = [UIButton]()
    private let nameClassificationTypeButtonsLine1: [String] = ["Colaborativo", "Moderno", "Tecnológico"]
    private var classificationButtonsLine2 = [UIButton]()
    private let nameClassificationTypeButtonsLine2: [String] = ["Inspirador", "Criativo", "Confortável"]
    
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
        return view
    }()
    
    
    //MARK: - stackClassification2
    private lazy var stackCategory2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()

    private var categoryButtonsLine1 = [UIButton]()
    private let nameCatergoryTypeButtonsLine1: [String] = ["Hotel", "BoxOffice", "Coworking"]
    private var categoryButtonsLine2 = [UIButton]()
    private let nameCategoryTypeButtonsLine2: [String] = ["CoolWorking"]
    
    
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
        return view
    }()
    
    //MARK: stackFacilities2
    private lazy var stackFacilities2: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()
    
    //MARK: - stackFacilities3
    private lazy var stackFacilities3: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()

    private var facilitiesButtonsLine1 = [UIButton]()
    private let namefacilitiesTypeButtonsLine1: [String] = ["Ar condicionado", "Bicicletário"]
    private var facilitiesButtonsLine2 = [UIButton]()
    private let namefacilitiesTypeButtonsLine2: [String] = ["Café", "Digitalizadora", "Geladeira"]
    private var facilitiesButtonsLine3 = [UIButton]()
    private let namefacilitiesTypeButtonsLine3: [String] = ["Estacionamento"]
    
    //MARK: - stackClassification
    private lazy var roomsStackFacilities: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackFacilities1,stackFacilities2,stackFacilities3])
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
    
    
    
    //MARK: - ComfortableAudio
    private lazy var comfortableLabel: UILabel = {
        let label = UILabel()
        label.text = "Conforto Auditivo"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()

    //MARK: - stackComfortable1
    private lazy var stackComfortable1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()

    private var comfortableButtons = [UIButton]()
    private let nameComfortableButtons: [String] = ["Sala de reunião", "Sala privativa"]

    //MARK: roomsStackComfortable
    private lazy var roomsStackComfortable: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackComfortable1])
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
 
    //MARK: - TypeOfHiringLabel
    private lazy var TypeOfHiringLabel: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Contratação"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    
    //MARK: - stackHiring1
    private lazy var stackHiring1: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.backgroundColor = .white
        view.axis = .horizontal
        return view
    }()
    
    
    //MARK: - stackHiring2
    private lazy var stackHiring2: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.axis = .horizontal
        view.spacing = 4
        return view
    }()
    
    private var hiringsButtons = [UIButton]()
    private let nameButtonsHiring: [String] = ["Por hora", "Por dia"]
    
    //MARK: roomsImageHiring
    private lazy var roomsStackHiring: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackHiring1,stackHiring2])
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
                                comfortableLabel,
                                roomsStackComfortable,
                                lineImage6,
                                TypeOfHiringLabel,
                                roomsStackHiring,
                                lineImage7,
                                filterButton,
                                ])
        
       
        tabBar.selectedItem = tabBar.items?[0]
        
        //MARK: CapsuleButtonsSpaceType
        spaceTypeButtonsLine1 = createCapsuleButtons(nameSpaceTypeButtonsLine1,ColorsBravve.capsuleButton)
        stackSpaceType1.addArrangedSubviews(spaceTypeButtonsLine1)
        spaceTypeButtonsLine2 = createCapsuleButtons(nameSpaceTypeButtonsLine2,ColorsBravve.capsuleButton)
        stackSpaceType2.addArrangedSubviews(spaceTypeButtonsLine2)
        spaceTypeButtonsLine3 = createCapsuleButtons(nameSpaceTypeButtonsLine3,ColorsBravve.capsuleButton)
        stackSpaceType3.addArrangedSubviews(spaceTypeButtonsLine3)
        
        
        //MARK: CapsuleButtonsClassification
        classificationButtonsLine1 = createCapsuleButtons(nameClassificationTypeButtonsLine1,ColorsBravve.capsuleButton)
        stackClassification1.addArrangedSubviews(classificationButtonsLine1)
        classificationButtonsLine2 = createCapsuleButtons(nameClassificationTypeButtonsLine2,ColorsBravve.capsuleButton)
        stackClassification2.addArrangedSubviews(classificationButtonsLine2)
        
        
        //MARK: CapsuleButtonsCategory
        categoryButtonsLine1 = createCapsuleButtons(nameCatergoryTypeButtonsLine1,ColorsBravve.capsuleButton)
        stackCategory1.addArrangedSubviews(categoryButtonsLine1)
        categoryButtonsLine2 = createCapsuleButtons(nameCategoryTypeButtonsLine2,ColorsBravve.capsuleButton)
        stackCategory2.addArrangedSubviews(categoryButtonsLine2)
        
        //MARK: CapsuleButtonsFacilities
        facilitiesButtonsLine1 = createCapsuleButtons(namefacilitiesTypeButtonsLine1,ColorsBravve.capsuleButton)
        stackFacilities1.addArrangedSubviews(facilitiesButtonsLine1)
        facilitiesButtonsLine2 = createCapsuleButtons(namefacilitiesTypeButtonsLine2,ColorsBravve.capsuleButton)
        stackFacilities2.addArrangedSubviews(facilitiesButtonsLine2)
        facilitiesButtonsLine3 = createCapsuleButtons(namefacilitiesTypeButtonsLine3,ColorsBravve.capsuleButton)
        stackFacilities3.addArrangedSubviews(facilitiesButtonsLine3)
        

        //MARK: CapsuleButtonsComfortable
        comfortableButtons = createCapsuleButtons(nameComfortableButtons,ColorsBravve.capsuleButton)
        stackComfortable1.addArrangedSubviews(comfortableButtons)


        //MARK: CapsuleButtonsHiring
        hiringsButtons = createCapsuleButtons(nameButtonsHiring,ColorsBravve.capsuleButton)
        stackHiring1.addArrangedSubviews(hiringsButtons)

    }
    
    //MARK: - ACTIONS AND METHODS
    
    //MARK: - exitTap
    @objc private func exitTap() {
        self.dismiss(animated: true)
    }
    
    //MARK: - clearTap
    @objc private func clearTap() {
        print("tapClear")
        
    }
    
    @objc private func filterButtonTapped(){
        self.dismiss(animated: true)
    }
    
    //MARK: - capacityTap
    @objc private func capacityTap() {
        capacityButton.isSelected.toggle()
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
            
            
            
            comfortableLabel.topAnchor.constraint(equalTo: lineImage5.bottomAnchor, constant: 19),
            comfortableLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackComfortable.topAnchor.constraint(equalTo: comfortableLabel.bottomAnchor, constant: 19),
            roomsStackComfortable.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackComfortable.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            
            //MARK: lineImage6
            lineImage6.topAnchor.constraint(equalTo: roomsStackComfortable.bottomAnchor, constant: 19),
            lineImage6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage6.heightAnchor.constraint(equalToConstant: 1),
            
            
            
            TypeOfHiringLabel.topAnchor.constraint(equalTo: lineImage6.bottomAnchor, constant: 19),
            TypeOfHiringLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
            roomsStackHiring.topAnchor.constraint(equalTo: TypeOfHiringLabel.bottomAnchor, constant: 19),
            roomsStackHiring.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsStackHiring.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            
            //MARK: lineImage6
            lineImage7.topAnchor.constraint(equalTo: roomsStackHiring.bottomAnchor, constant: 19),
            lineImage7.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImage7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage7.heightAnchor.constraint(equalToConstant: 1),
            
        
            //MARK: FilterButton
            filterButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            filterButton.heightAnchor.constraint(equalToConstant: 52),

        ])
        
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)

    }
    
}




