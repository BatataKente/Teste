//
//  FilterView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/08/22.
//

import Foundation
import UIKit

final class FilterScreen: UIViewController {
    
    //MARK: var and let
    let scrollView = UIScrollView()
    let uiview = UIView()
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
       
                                                                   ButtonsBravve.exitGray.rawValue])
    
    //MARK: FinishButton
    private lazy var finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Filtrar", for: .normal)
        button.setTitleColor(UIColor(named: "buttonPink"), for: .normal)
        return button
    }()
    
    
    //MARK: FilterButton
    private lazy var filterButton: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemPink
        view.setTitle("Filtrar", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Bold", size: 16)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    //MARK: loadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        view.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        setupView()
        setupConstrains()
    }
    
    //MARK: setupView
    private func setupView() {
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        uiview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([scrollView,tabBar])
        scrollView.addSubviews([uiview,exitButton,filterLabel,clearButton,capacityView,capacityLabel,numberLabel,capacityButton,
lineImage,spaceType,roomsImage,meetingRoomButton,eventRoomButton,areaShareRoomLabel,privateRoomButton,callCabinButton,smartOfficeButton,lineImageTwo,roomsImageTwo,classificationLabel,colaborativeButton,modernButton,tecnologicButton,inspiringButton,creativeButton,comfortableButton,lineImageThree,roomsImageThree,categoryLabel,hotelButton,boxOfficeButton,coworkingButton,coolwortkingButton,lineImageFour,
    roomsImageFour,facilitiesLabel,airConditioning,bikerackButton,coffeButton,refrigeratorButton,digitizerButton,parkButton,lineImageFive,roomsImageFive,comfortableAudio,silenceButton,normalButton,noisyButton,lineImageSix,roomsImageSix,TypeOfHiring,perHourButton,perDayButton,filterButton
                                ])
        tabBar.selectedItem = tabBar.items?[0]
    }
    
    //MARK: exitButton
    private lazy var exitButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.systemBackground, for: .normal)
        view.setImage(UIImage(named: "xmarkBlue"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    //MARK: filterLabel
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "Filtrar"
        label.font = UIFont(name: "Ubuntu-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "TextFieldLabel")
       return label
    }()
    
    //MARK: clearButton
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 14))
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor(named: "blueBravve") as Any,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
             let attributeString = NSMutableAttributedString(
                string: "Limpar",
            attributes: yourAttributes)
        button.setAttributedTitle(attributeString, for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(clearTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    //MARK: ClearTap
    @objc private func clearTap() {
        print("tapClear")
        
    }
    
    //MARK: capacityView
    private lazy var capacityView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
        
    
    //MARK: capacityLabel
    private lazy var capacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Capacidade"
        label.font = UIFont(name: "Ubuntu-Regular", size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "TextFieldLabel")
       return label
    }()
    
    //MARK: numberLabel
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "16+"
        label.font = UIFont(name: "Ubuntu-Bold", size: 15)
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
    
    
    //MARK: capacityTap
    @objc private func capacityTap() {
        capacityButton.isSelected.toggle()
        
    }
        
    
    //MARK: lineImage
        private lazy var lineImage: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: spaceType
    private lazy var spaceType: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Espaço"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    //MARK: capacityView
    private lazy var roomsImage: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    

    //MARK: meetingRoomButton
    private lazy var meetingRoomButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sala de reunião", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(meetingTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: meetingTap
    @objc private func meetingTap() {
        if meetingRoomButton.backgroundColor == UIColor.white {
            meetingRoomButton.backgroundColor = UIColor(named: "blueBravve")
            meetingRoomButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            meetingRoomButton.backgroundColor = UIColor.white
            meetingRoomButton.setTitleColor(UIColor.black, for: .normal)
        }
    }


    //MARK: eventRoomButton
    private lazy var eventRoomButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sala de evento", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(eventTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    //MARK: eventTap
    @objc private func eventTap() {
        if eventRoomButton.backgroundColor == UIColor.white {
            eventRoomButton.backgroundColor = UIColor(named: "blueBravve")
            eventRoomButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            eventRoomButton.backgroundColor = UIColor.white
            eventRoomButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: areaShareRoomButton
    private lazy var areaShareRoomLabel: UIButton = {
        let view = UIButton()
        view.setTitle("Área compartilhada", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(areaTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: areaTap
    @objc private func areaTap() {
        if areaShareRoomLabel.backgroundColor == UIColor.white {
            areaShareRoomLabel.backgroundColor = UIColor(named: "blueBravve")
            areaShareRoomLabel.setTitleColor(UIColor.white, for: .normal)
        } else {
            areaShareRoomLabel.backgroundColor = UIColor.white
            areaShareRoomLabel.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: privateRoomButton
    private lazy var privateRoomButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sala privativa", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(privateTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: privateTap
    @objc private func privateTap() {
        if privateRoomButton.backgroundColor == UIColor.white {
            privateRoomButton.backgroundColor = UIColor(named: "blueBravve")
            privateRoomButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            privateRoomButton.backgroundColor = UIColor.white
            privateRoomButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: callCabinButton
    private lazy var callCabinButton: UIButton = {
        let view = UIButton()
        view.setTitle("Cabine de call", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(cabinTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK: cabinTap
    @objc private func cabinTap() {
        if callCabinButton.backgroundColor == UIColor.white {
            callCabinButton.backgroundColor = UIColor(named: "blueBravve")
            callCabinButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            callCabinButton.backgroundColor = UIColor.white
            callCabinButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: smartOfficeButton
    private lazy var smartOfficeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Smart Office", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(smartTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: smartTap
    @objc private func smartTap() {
        if smartOfficeButton.backgroundColor == UIColor.white {
            smartOfficeButton.backgroundColor = UIColor(named: "blueBravve")
            smartOfficeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            smartOfficeButton.backgroundColor = UIColor.white
            smartOfficeButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    //SEPARATOR
    
    
    
    
    //MARK: lineImageTwo
        private lazy var lineImageTwo: UIImageView = {
           let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    //SEPARATOR

    //MARK: Classification
    
    //MARK: classificationLabel
    private lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Classificação"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()


    //MARK: roomsImageTwo
    private lazy var roomsImageTwo: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()



    //MARK: colaborativeButton
    private lazy var colaborativeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Colaborativo", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(colaborativeTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: colaborativeTap
    @objc private func colaborativeTap() {
        if colaborativeButton.backgroundColor == UIColor.white {
            colaborativeButton.backgroundColor = UIColor(named: "blueBravve")
            colaborativeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            colaborativeButton.backgroundColor = UIColor.white
            colaborativeButton.setTitleColor(UIColor.black, for: .normal)
        }
    }


    //MARK: modernButton
    private lazy var modernButton: UIButton = {
        let view = UIButton()
        view.setTitle("Moderno", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(modernTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: modernTap
    @objc private func modernTap() {
        if modernButton.backgroundColor == UIColor.white {
            modernButton.backgroundColor = UIColor(named: "blueBravve")
            modernButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            modernButton.backgroundColor = UIColor.white
            modernButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: tecnologicButton
    private lazy var tecnologicButton: UIButton = {
        let view = UIButton()
        view.setTitle("Tecnológico", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(tecnlogicTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    //MARK: tecnologicTap
    @objc private func tecnlogicTap() {
        if tecnologicButton.backgroundColor == UIColor.white {
            tecnologicButton.backgroundColor = UIColor(named: "blueBravve")
            tecnologicButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            tecnologicButton.backgroundColor = UIColor.white
            tecnologicButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: inspiringButton
    private lazy var inspiringButton: UIButton = {
        let view = UIButton()
        view.setTitle("Inspirador", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(inspiringTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: inspiringTap
    @objc private func inspiringTap() {
        if inspiringButton.backgroundColor == UIColor.white {
            inspiringButton.backgroundColor = UIColor(named: "blueBravve")
            inspiringButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            inspiringButton.backgroundColor = UIColor.white
            inspiringButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: creativeButton
    private lazy var creativeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Criativo", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(creativeTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    //MARK: creativeTap
    @objc private func creativeTap() {
        if creativeButton.backgroundColor == UIColor.white {
            creativeButton.backgroundColor = UIColor(named: "blueBravve")
            creativeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            creativeButton.backgroundColor = UIColor.white
            creativeButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: comfortableButton
    private lazy var comfortableButton: UIButton = {
        let view = UIButton()
        view.setTitle("Confortável", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(comfortableTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: comfortableTap
    @objc private func comfortableTap() {
        if comfortableButton.backgroundColor == UIColor.white {
            comfortableButton.backgroundColor = UIColor(named: "blueBravve")
            comfortableButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            comfortableButton.backgroundColor = UIColor.white
            comfortableButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    // SEPARATOR

    //MARK: Category
    
    
    
    
    
    
    //MARK: lineImageThree
        private lazy var lineImageThree: UIImageView = {
           let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //MARK: categoryLabel
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categorias"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    
    //MARK: roomsImageThree
    private lazy var roomsImageThree: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: hotelButton
    private lazy var hotelButton: UIButton = {
        let view = UIButton()
        view.setTitle("Hotel", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(hotelTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: hotelTap
    @objc private func hotelTap() {
        if hotelButton.backgroundColor == UIColor.white {
            hotelButton.backgroundColor = UIColor(named: "blueBravve")
            hotelButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            hotelButton.backgroundColor = UIColor.white
            hotelButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    //MARK: boxOfficeButton
    private lazy var boxOfficeButton: UIButton = {
        let view = UIButton()
        view.setTitle("BoxOffice", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(boxOfficeTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: boxOfficeTap
    @objc private func boxOfficeTap() {
        if boxOfficeButton.backgroundColor == UIColor.white {
            boxOfficeButton.backgroundColor = UIColor(named: "blueBravve")
            boxOfficeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            boxOfficeButton.backgroundColor = UIColor.white
            boxOfficeButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    //MARK: coworkingButton
    private lazy var coworkingButton: UIButton = {
        let view = UIButton()
        view.setTitle("BoxOffice", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(coworkingTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: coworkingTap
    @objc private func coworkingTap() {
        if coworkingButton.backgroundColor == UIColor.white {
            coworkingButton.backgroundColor = UIColor(named: "blueBravve")
            coworkingButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            coworkingButton.backgroundColor = UIColor.white
            coworkingButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK: coolworkingButton
    private lazy var coolwortkingButton: UIButton = {
        let view = UIButton()
        view.setTitle("Coolworking", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(coolworkingTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: coolWorkingTap
    @objc private func coolworkingTap() {
        if coolwortkingButton.backgroundColor == UIColor.white {
            coolwortkingButton.backgroundColor = UIColor(named: "blueBravve")
            coolwortkingButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            coolwortkingButton.backgroundColor = UIColor.white
            coolwortkingButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    

    //SEPARATOR

    //MARK: Facilities
    

    
    
    //MARK: facilitiesLabel
    private lazy var facilitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Facilities"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    
    //MARK: roomsImageFour
    private lazy var roomsImageFour: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: lineImageFour
        private lazy var lineImageFour: UIImageView = {
           let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    
    //MARK: airCondintiong
    private lazy var airConditioning: UIButton = {
        let view = UIButton()
        view.setTitle("Ar Condicionado", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(airConditioningTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: airConditioningTap
    @objc private func airConditioningTap() {
        if airConditioning.backgroundColor == UIColor.white {
            airConditioning.backgroundColor = UIColor(named: "blueBravve")
            airConditioning.setTitleColor(UIColor.white, for: .normal)
        } else {
            airConditioning.backgroundColor = UIColor.white
            airConditioning.setTitleColor(UIColor.black, for: .normal)
        }
    }

    
    //MARK: bikerackButton
    private lazy var bikerackButton: UIButton = {
        let view = UIButton()
        view.setTitle("Bicicletário", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(bikerackButtonTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: bikerackButtonTap
    @objc private func bikerackButtonTap() {
        if bikerackButton.backgroundColor == UIColor.white {
            bikerackButton.backgroundColor = UIColor(named: "blueBravve")
            bikerackButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            bikerackButton.backgroundColor = UIColor.white
            bikerackButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
 
    
    
    //MARK: coffeButton
    private lazy var coffeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Café", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(coffeButtonTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: coffeButtonTap
    @objc private func coffeButtonTap() {
        if coffeButton.backgroundColor == UIColor.white {
            coffeButton.backgroundColor = UIColor(named: "blueBravve")
            coffeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            coffeButton.backgroundColor = UIColor.white
            coffeButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: digitizerButton
    private lazy var digitizerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Digitalizadora", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(digitizerButtonTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: digitizerButtonTap
    @objc private func digitizerButtonTap() {
        if digitizerButton.backgroundColor == UIColor.white {
            digitizerButton.backgroundColor = UIColor(named: "blueBravve")
            digitizerButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            digitizerButton.backgroundColor = UIColor.white
            digitizerButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK: refrigeratorButton
    private lazy var refrigeratorButton: UIButton = {
        let view = UIButton()
        view.setTitle("Geladeira", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(refrigeratorButtonTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: refrigegatorButtonTap
    @objc private func refrigeratorButtonTap() {
        if refrigeratorButton.backgroundColor == UIColor.white {
            refrigeratorButton.backgroundColor = UIColor(named: "blueBravve")
            refrigeratorButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            refrigeratorButton.backgroundColor = UIColor.white
            refrigeratorButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK: parkButton
    private lazy var parkButton: UIButton = {
        let view = UIButton()
        view.setTitle("Estacionamento", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(parkButtonTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: parkButtonTap
    @objc private func parkButtonTap() {
        if parkButton.backgroundColor == UIColor.white {
            parkButton.backgroundColor = UIColor(named: "blueBravve")
            parkButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            parkButton.backgroundColor = UIColor.white
            parkButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    //MARK: comfortableAudio
    private lazy var comfortableAudio: UILabel = {
        let label = UILabel()
        label.text = "Conforto Auditivo"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    
    //MARK: roomsImageFive
    private lazy var roomsImageFive: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: lineImageFive
        private lazy var lineImageFive: UIImageView = {
           let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    //MARK: silenceButton
    private lazy var silenceButton: UIButton = {
        let view = UIButton()
        view.setTitle("Digitalizadora", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(silenceTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: silenteTap
    @objc private func silenceTap() {
        if silenceButton.backgroundColor == UIColor.white {
            silenceButton.backgroundColor = UIColor(named: "blueBravve")
            silenceButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            silenceButton.backgroundColor = UIColor.white
            silenceButton.setTitleColor(UIColor.black, for: .normal)
        }
    }

    //MARK: normalButton
    private lazy var normalButton: UIButton = {
        let view = UIButton()
        view.setTitle("Normal", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(normalTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: normalTap
    @objc private func normalTap() {
        if normalButton.backgroundColor == UIColor.white {
            normalButton.backgroundColor = UIColor(named: "blueBravve")
            normalButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            normalButton.backgroundColor = UIColor.white
            normalButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK: noisyButton
    private lazy var noisyButton: UIButton = {
        let view = UIButton()
        view.setTitle("Barulhento", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(noisyTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: noisyTap
    @objc private func noisyTap() {
        if noisyButton.backgroundColor == UIColor.white {
            noisyButton.backgroundColor = UIColor(named: "blueBravve")
            noisyButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            noisyButton.backgroundColor = UIColor.white
            noisyButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //SEPARATOR
    
    
    
    
    //MARK: TypeOfHiring
    private lazy var TypeOfHiring: UILabel = {
        let label = UILabel()
        label.text = "Tipo de Contratação"
        label.font = UIFont(name: "Ubuntu-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
       return label
    }()
    
    
    //MARK: roomsImageSix
    private lazy var roomsImageSix: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = CGColor.init(gray: 128/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //MARK: lineImageSix
        private lazy var lineImageSix: UIImageView = {
           let view = UIImageView()
            view.backgroundColor = UIColor(named: "line")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    
    //MARK: perHourButton
    private lazy var perHourButton: UIButton = {
        let view = UIButton()
        view.setTitle("Por Hora", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(hourTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: hourTap
    @objc private func hourTap() {
        if perHourButton.backgroundColor == UIColor.white {
            perHourButton.backgroundColor = UIColor(named: "blueBravve")
            perHourButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            perHourButton.backgroundColor = UIColor.white
            perHourButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK: perDayButton
    private lazy var perDayButton: UIButton = {
        let view = UIButton()
        view.setTitle("Por Dia", for: .normal)
        view.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 13)
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderColor = CGColor(gray: 128/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.7
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(dayTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: dayTap
    @objc private func dayTap() {
        if perDayButton.backgroundColor == UIColor.white {
            perDayButton.backgroundColor = UIColor(named: "blueBravve")
            perDayButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            perDayButton.backgroundColor = UIColor.white
            perDayButton.setTitleColor(UIColor.black, for: .normal)
        }
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
            
            
            
            
            //MARK: uiview
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
            clearButton.leadingAnchor.constraint(equalTo: filterLabel.trailingAnchor, constant: 189),
        
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
            lineImage.heightAnchor.constraint(equalToConstant: 0.5),
            
 
            //SEPARATOR

            
            //MARK: Types of Space
            spaceType.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 19),
            spaceType.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            spaceType.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
            spaceType.heightAnchor.constraint(equalToConstant: 16),
            
            roomsImage.topAnchor.constraint(equalTo: spaceType.bottomAnchor, constant: 19),
            roomsImage.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImage.heightAnchor.constraint(equalToConstant: 198),

            //MARK: meetinRoomButton
            meetingRoomButton.topAnchor.constraint(equalTo: roomsImage.topAnchor),
            meetingRoomButton.leadingAnchor.constraint(equalTo: roomsImage.leadingAnchor),
            meetingRoomButton.widthAnchor.constraint(equalToConstant: 129),
            meetingRoomButton.heightAnchor.constraint(equalToConstant: 35),

            //MARK: eventRoomButton
            eventRoomButton.topAnchor.constraint(equalTo: meetingRoomButton.bottomAnchor, constant: 10),
            eventRoomButton.leadingAnchor.constraint(equalTo: roomsImage.leadingAnchor),
            eventRoomButton.widthAnchor.constraint(equalToConstant: 129),
            eventRoomButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: areaShareRoomButton
            areaShareRoomLabel.topAnchor.constraint(equalTo: eventRoomButton.bottomAnchor, constant: 10),
            areaShareRoomLabel.leadingAnchor.constraint(equalTo: roomsImage.leadingAnchor),
            areaShareRoomLabel.widthAnchor.constraint(equalToConstant: 155),
            areaShareRoomLabel.heightAnchor.constraint(equalToConstant: 35),


            //MARK: privateRoomButton
            privateRoomButton.topAnchor.constraint(equalTo: roomsImage.topAnchor),
            privateRoomButton.leadingAnchor.constraint(equalTo: meetingRoomButton.trailingAnchor, constant: 4),
            privateRoomButton.widthAnchor.constraint(equalToConstant: 129),
            privateRoomButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: callCabinButton
            callCabinButton.topAnchor.constraint(equalTo: privateRoomButton.bottomAnchor, constant: 10),
            callCabinButton.leadingAnchor.constraint(equalTo: eventRoomButton.trailingAnchor, constant: 4),
            callCabinButton.widthAnchor.constraint(equalToConstant: 129),
            callCabinButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: smartOfficeButton
            smartOfficeButton.topAnchor.constraint(equalTo: callCabinButton.bottomAnchor, constant: 10),
            smartOfficeButton.leadingAnchor.constraint(equalTo: areaShareRoomLabel.trailingAnchor, constant: 4),
            smartOfficeButton.widthAnchor.constraint(equalToConstant: 113),
            smartOfficeButton.heightAnchor.constraint(equalToConstant: 35),

//
//            //SEPARATOR
//
//
//
//
//
//            //MARK: lineImageTwo
            lineImageTwo.topAnchor.constraint(equalTo: smartOfficeButton.bottomAnchor, constant: 19),
            lineImageTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImageTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImageTwo.heightAnchor.constraint(equalToConstant: 0.5),
            
            
  
            //SEPARATOR
            
           

            //MARK: Classification
            classificationLabel.topAnchor.constraint(equalTo: lineImageTwo.bottomAnchor, constant: 19),
            classificationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            classificationLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),

            
            //MARK: roomsImageTwo
            roomsImageTwo.topAnchor.constraint(equalTo: classificationLabel.bottomAnchor, constant: 19),
            roomsImageTwo.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImageTwo.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImageTwo.heightAnchor.constraint(equalToConstant: 198),

            //MARK: colaborativeButton
            colaborativeButton.topAnchor.constraint(equalTo: roomsImageTwo.topAnchor),
            colaborativeButton.leadingAnchor.constraint(equalTo: roomsImageTwo.leadingAnchor),
            colaborativeButton.widthAnchor.constraint(equalToConstant: 114),
            colaborativeButton.heightAnchor.constraint(equalToConstant: 35),

            //MARK: modernButton
            modernButton.topAnchor.constraint(equalTo: roomsImageTwo.topAnchor),
            modernButton.leadingAnchor.constraint(equalTo: colaborativeButton.trailingAnchor, constant: 4),
            modernButton.widthAnchor.constraint(equalToConstant: 92),
            modernButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: teecnologicButton
            tecnologicButton.topAnchor.constraint(equalTo: roomsImageTwo.topAnchor),
            tecnologicButton.leadingAnchor.constraint(equalTo: modernButton.trailingAnchor, constant: 4),
            tecnologicButton.widthAnchor.constraint(equalToConstant: 109),
            tecnologicButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: inspiringButton
            inspiringButton.topAnchor.constraint(equalTo: colaborativeButton.bottomAnchor, constant: 10),
            inspiringButton.leadingAnchor.constraint(equalTo: roomsImageTwo.leadingAnchor),
            inspiringButton.widthAnchor.constraint(equalToConstant: 98),
            inspiringButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: creativeButton
            creativeButton.topAnchor.constraint(equalTo: modernButton.bottomAnchor, constant: 10),
            creativeButton.leadingAnchor.constraint(equalTo: inspiringButton.trailingAnchor, constant: 4),
            creativeButton.widthAnchor.constraint(equalToConstant: 84),
            creativeButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: comfortableButton
            comfortableButton.topAnchor.constraint(equalTo: tecnologicButton.bottomAnchor, constant: 10),
            comfortableButton.leadingAnchor.constraint(equalTo: creativeButton.trailingAnchor, constant: 4),
            comfortableButton.widthAnchor.constraint(equalToConstant: 108),
            comfortableButton.heightAnchor.constraint(equalToConstant: 35),


            //SEPARATOR
            
            
            
            //MARK: lineImageThree
            lineImageThree.topAnchor.constraint(equalTo: comfortableButton.bottomAnchor, constant: 19),
            lineImageThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImageThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImageThree.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            //MARK: Category
            
            
            //MARK: roomsImageThree
            roomsImageThree.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 19),
            roomsImageThree.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImageThree.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImageThree.heightAnchor.constraint(equalToConstant: 198),
            
            
            //MARK: categoryLabel
            categoryLabel.topAnchor.constraint(equalTo: lineImageThree.bottomAnchor, constant: 19),
            categoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            categoryLabel.widthAnchor.constraint(equalToConstant: 93),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            
            //MARK: hotelButton
            hotelButton.topAnchor.constraint(equalTo: roomsImageThree.topAnchor),
            hotelButton.leadingAnchor.constraint(equalTo: roomsImageThree.leadingAnchor),
            hotelButton.widthAnchor.constraint(equalToConstant: 70),
            hotelButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: boxOfficeButton
            boxOfficeButton.topAnchor.constraint(equalTo: roomsImageThree.topAnchor),
            boxOfficeButton.leadingAnchor.constraint(equalTo: hotelButton.trailingAnchor, constant: 4),
            boxOfficeButton.widthAnchor.constraint(equalToConstant: 97),
            boxOfficeButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: coworkingButton
            coworkingButton.topAnchor.constraint(equalTo: roomsImageThree.topAnchor),
            coworkingButton.leadingAnchor.constraint(equalTo: boxOfficeButton.trailingAnchor, constant: 4),
            coworkingButton.widthAnchor.constraint(equalToConstant: 101),
            coworkingButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: coolwortkingButton
            coolwortkingButton.topAnchor.constraint(equalTo: hotelButton.bottomAnchor, constant: 10),
            coolwortkingButton.leadingAnchor.constraint(equalTo: roomsImageThree.leadingAnchor),
            coolwortkingButton.widthAnchor.constraint(equalToConstant: 113),
            coolwortkingButton.heightAnchor.constraint(equalToConstant: 35),
            

            //SEPARATOR
            
            
            //MARK: lineImageFour
            lineImageFour.topAnchor.constraint(equalTo: coolwortkingButton.bottomAnchor, constant: 19),
            lineImageFour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImageFour.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImageFour.heightAnchor.constraint(equalToConstant: 0.5),
            

            //MARK: Facilities
            
            
            //MARK: facilitiesLabel
            facilitiesLabel.topAnchor.constraint(equalTo: lineImageFour.bottomAnchor, constant: 19),
            facilitiesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            facilitiesLabel.widthAnchor.constraint(equalToConstant: 93),
            facilitiesLabel.heightAnchor.constraint(equalToConstant: 16),
            
            //MARK: roomsImageFour
            roomsImageFour.topAnchor.constraint(equalTo: facilitiesLabel.bottomAnchor, constant: 19),
            roomsImageFour.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImageFour.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImageFour.heightAnchor.constraint(equalToConstant: 198),
            
            //MARK: airConditioning
            airConditioning.topAnchor.constraint(equalTo: roomsImageFour.topAnchor),
            airConditioning.leadingAnchor.constraint(equalTo: roomsImageFour.leadingAnchor),
            airConditioning.widthAnchor.constraint(equalToConstant: 155),
            airConditioning.heightAnchor.constraint(equalToConstant: 35),
            

            //MARK: bikerackButton
            bikerackButton.topAnchor.constraint(equalTo: roomsImageFour.topAnchor),
            bikerackButton.leadingAnchor.constraint(equalTo: airConditioning.trailingAnchor),
            bikerackButton.widthAnchor.constraint(equalToConstant: 100),
            bikerackButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: coffeButton
            coffeButton.topAnchor.constraint(equalTo: airConditioning.bottomAnchor, constant: 10),
            coffeButton.leadingAnchor.constraint(equalTo: roomsImageFour.leadingAnchor),
            coffeButton.widthAnchor.constraint(equalToConstant: 70),
            coffeButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: digitizerButton
            digitizerButton.topAnchor.constraint(equalTo: airConditioning.bottomAnchor, constant: 10),
            digitizerButton.leadingAnchor.constraint(equalTo: coffeButton.trailingAnchor, constant: 4),
            digitizerButton.widthAnchor.constraint(equalToConstant: 101),
            digitizerButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: refrigeratorButton
            refrigeratorButton.topAnchor.constraint(equalTo: bikerackButton.bottomAnchor, constant: 10),
            refrigeratorButton.leadingAnchor.constraint(equalTo: digitizerButton.trailingAnchor, constant: 4),
            refrigeratorButton.widthAnchor.constraint(equalToConstant: 113),
            refrigeratorButton.heightAnchor.constraint(equalToConstant: 35),
            
            //MARK: parkButton
            parkButton.topAnchor.constraint(equalTo: coffeButton.bottomAnchor, constant: 10),
            parkButton.leadingAnchor.constraint(equalTo: roomsImageFour.leadingAnchor),
            parkButton.widthAnchor.constraint(equalToConstant: 113),
            parkButton.heightAnchor.constraint(equalToConstant: 35),
            

            //SEPARATOR
            
            
            
            
            //MARK: lineImageFive
            lineImageFive.topAnchor.constraint(equalTo: parkButton.bottomAnchor, constant: 19),
            lineImageFive.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImageFive.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImageFive.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            
            //MARK: comfortableAudio
            
            
            //MARK: comfortableAudio
            comfortableAudio.topAnchor.constraint(equalTo: lineImageFive.bottomAnchor, constant: 19),
            comfortableAudio.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            comfortableAudio.widthAnchor.constraint(equalToConstant: 130),
            comfortableAudio.heightAnchor.constraint(equalToConstant: 16),
            
            
            //MARK: roomsImageFive
            roomsImageFive.topAnchor.constraint(equalTo: comfortableAudio.bottomAnchor, constant: 19),
            roomsImageFive.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImageFive.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImageFive.heightAnchor.constraint(equalToConstant: 198),
            
            
            //MARK: silenceButton
            silenceButton.topAnchor.constraint(equalTo: roomsImageFive.topAnchor),
            silenceButton.leadingAnchor.constraint(equalTo: roomsImageFive.leadingAnchor),
            silenceButton.widthAnchor.constraint(equalToConstant: 100),
            silenceButton.heightAnchor.constraint(equalToConstant: 35),
            
            
            //MARK: normalButton
            normalButton.topAnchor.constraint(equalTo: roomsImageFive.topAnchor),
            normalButton.leadingAnchor.constraint(equalTo: silenceButton.trailingAnchor, constant: 4),
            normalButton.widthAnchor.constraint(equalToConstant: 80),
            normalButton.heightAnchor.constraint(equalToConstant: 35),


            //MARK: noisyButton
            noisyButton.topAnchor.constraint(equalTo: roomsImageFive.topAnchor),
            noisyButton.leadingAnchor.constraint(equalTo: normalButton.trailingAnchor, constant: 4),
            noisyButton.widthAnchor.constraint(equalToConstant: 100),
            noisyButton.heightAnchor.constraint(equalToConstant: 35),
            
            
            
            
            
            
            
            
            //MARK: TypeOfHiring
            
            
            
            //MARK: lineImageSix
            lineImageSix.topAnchor.constraint(equalTo: noisyButton.bottomAnchor, constant: 16),
            lineImageSix.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineImageSix.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImageSix.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            
            
            
            
            //MARK: typeOfHiring
            TypeOfHiring.topAnchor.constraint(equalTo: lineImageSix.bottomAnchor, constant: 19),
            TypeOfHiring.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            TypeOfHiring.widthAnchor.constraint(equalToConstant: 160),
            TypeOfHiring.heightAnchor.constraint(equalToConstant: 16),
            
            
            //MARK: roomsImageSix
            roomsImageSix.topAnchor.constraint(equalTo: TypeOfHiring.bottomAnchor, constant: 19),
            roomsImageSix.leadingAnchor.constraint(equalTo: scrollView .leadingAnchor, constant: 20),
            roomsImageSix.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            roomsImageSix.heightAnchor.constraint(equalToConstant: 198),
            
            
            //MARK: perHourButton
            perHourButton.topAnchor.constraint(equalTo: roomsImageSix.topAnchor),
            perHourButton.leadingAnchor.constraint(equalTo: roomsImageSix.leadingAnchor),
            perHourButton.widthAnchor.constraint(equalToConstant: 100),
            perHourButton.heightAnchor.constraint(equalToConstant: 35),
            
            
            //MARK: perDayBytton
            perDayButton.topAnchor.constraint(equalTo: roomsImageSix.topAnchor),
            perDayButton.leadingAnchor.constraint(equalTo: perHourButton.trailingAnchor, constant: 4),
            perDayButton.widthAnchor.constraint(equalToConstant: 80),
            perDayButton.heightAnchor.constraint(equalToConstant: 35),

            //SEPARATOR
            
            
            //MARK: FilterButton
            filterButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            filterButton.heightAnchor.constraint(equalToConstant: 52),


        ])
        
        //MARK: tabBar
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        
    
        
    }
    
}




