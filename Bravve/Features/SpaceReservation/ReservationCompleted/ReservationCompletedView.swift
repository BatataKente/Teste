//
//  ReservaFinalizadaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//


import UIKit

class ReservationCompletedView: UIViewController {
    
    var clientName = "Ana"
    var locationAddress = "Av. São João, Cj. Boulevard, nº900, Sâo Paulo. SP 06020-010, BR"
    var schedulingData = "Sua reserva está marcada para Segunda: 08:00h - 17:00h"
    
    let buttonReservation = UIButton()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let testStack: UIStackView = {
       let testStack = UIStackView()
        testStack.backgroundColor = .black
        return testStack
    }()
    
    private let viewToScroll: UIView = {
        let viewToScroll = UIView()
        return viewToScroll
    }()
   
    private lazy var titleLabel: UILabel = {
         let titleLabel = UILabel()
         titleLabel.font = UIFont(name: "KoHo-Bold", size: 45)
         titleLabel.textColor = .white
         titleLabel.text = "Parabéns, \(clientName)!"
         titleLabel.numberOfLines = 0
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         return titleLabel
     }()
     
     private let subtitleLabel: UILabel = {
         let subtitleLabel = UILabel()
         subtitleLabel.font = UIFont(name: "Ubuntu-Regular", size: 20)
         subtitleLabel.textColor = .white
         subtitleLabel.text = "Sua reserva foi realizada com \nsucesso!"
         subtitleLabel.numberOfLines = 0
         subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
         return subtitleLabel
     }()
     
     private let info1Label: UILabel = {
         let info1Label = UILabel()
         info1Label.font = UIFont(name: "Ubuntu-Regular", size: 15)
         info1Label.textColor = .white
         info1Label.text = "Agradecemos por fazer sua reserva e abaixo, estamos mostrando o novo saldo da sua carteira e alguns detalhes sobre a sua reserva."
         info1Label.numberOfLines = 0
         info1Label.translatesAutoresizingMaskIntoConstraints = false
         return info1Label
     }()
    
    private let locationDetailLabel: UILabel = {
        let locationDetailLabel = UILabel()
        locationDetailLabel.font = UIFont(name: "Ubuntu-Bold", size: 20)
        //trocar por Ubuntu
        locationDetailLabel.textColor = .white
        locationDetailLabel.text = "Detalhe do local"
        locationDetailLabel.numberOfLines = 0
        locationDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationDetailLabel
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ubuntu
        locationLabel.textColor = .white
        locationLabel.text = "\(locationAddress)"
        locationLabel.numberOfLines = 0
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()

    private lazy var schedulingLabel: UILabel = {
        let schedulingLabel = UILabel()
        schedulingLabel.font = UIFont(name: "Ubuntu-Regular", size: 12)

        //trocar por Ubuntu
        schedulingLabel.textColor = .white
        schedulingLabel.text = "\(schedulingData)"
        schedulingLabel.numberOfLines = 0
        schedulingLabel.translatesAutoresizingMaskIntoConstraints = false
        return schedulingLabel
    }()

    private let placeDetailLabel: UILabel = {
        let placeDetailLabel = UILabel()
        placeDetailLabel.font = UIFont(name: "Ubuntu-Bold", size: 20)
        //trocar por Ununtu
        placeDetailLabel.textColor = .white
        placeDetailLabel.text = "Detalhe do espaço"
        placeDetailLabel.numberOfLines = 0
        placeDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return placeDetailLabel
    }()
    
    private let placeInfo1Label: UILabel = {
        let placeInfo1Label = UILabel()
       placeInfo1Label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ununtu
        placeInfo1Label.textColor = .white
        placeInfo1Label.text = "Aceita animais de estimação"
        placeInfo1Label.numberOfLines = 0
        placeInfo1Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo1Label
    }()
  
    
    private let placeInfo2Label: UILabel = {
        let placeInfo2Label = UILabel()
       placeInfo2Label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ununtu
        placeInfo2Label.textColor = .white
        placeInfo2Label.text = "Impressoras empresariais"
        placeInfo2Label.numberOfLines = 0
        placeInfo2Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo2Label
    }()

    private let placeInfo3Label: UILabel = {
        let placeInfo3Label = UILabel()
       placeInfo3Label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ununtu
        placeInfo3Label.textColor = .white
        placeInfo3Label.text = "Cafeteria"
        placeInfo3Label.numberOfLines = 0
        placeInfo3Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo3Label
    }()
    
    private let placeInfo4Label: UILabel = {
        let placeInfo4Label = UILabel()
       placeInfo4Label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ununtu
        placeInfo4Label.textColor = .white
        placeInfo4Label.text = "Espaço ao ar livre"
        placeInfo4Label.numberOfLines = 0
        placeInfo4Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo4Label
    }()
    
    private let placeInfo5Label: UILabel = {
        let placeInfo5Label = UILabel()
       placeInfo5Label.font = UIFont(name: "Ubuntu-Regular", size: 12)

        //trocar por Ununtu
        placeInfo5Label.textColor = .white
        placeInfo5Label.text = "Estacionamento"
        placeInfo5Label.numberOfLines = 0
        placeInfo5Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo5Label
    }()
    
    private let placeInfo6Label: UILabel = {
        let placeInfo6Label = UILabel()
       placeInfo6Label.font = UIFont(name: "Ubuntu-Regular", size: 12)

        //trocar por Ununtu
        placeInfo6Label.textColor = .white
        placeInfo6Label.text = "Bicicletário"
        placeInfo6Label.numberOfLines = 0
        placeInfo6Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo6Label
    }()
    
    private let placeInfo7Label: UILabel = {
        let placeInfo7Label = UILabel()
        placeInfo7Label.font = UIFont(name: "Ubuntu-Regular", size: 12)
        //trocar por Ununtu
        placeInfo7Label.textColor = .white
        placeInfo7Label.text = "Farmácia próxima"
        placeInfo7Label.numberOfLines = 0
        placeInfo7Label.translatesAutoresizingMaskIntoConstraints = false
        return placeInfo7Label
    }()
    
    private let locationIcon: UIImageView = {
       let locationIcon = UIImageView(image: UIImage(named: "locationBlue"))
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        return locationIcon
    }()
    
    private let schedulingIcon: UIImageView = {
        let schedulingIcon = UIImageView(image: UIImage(named: "clock"))
        schedulingIcon.translatesAutoresizingMaskIntoConstraints = false
        return schedulingIcon
    }()

    private let logoIcon: UIImageView = {
        let logoIcon = UIImageView(image: UIImage(named: "logoWhite"))
        logoIcon.translatesAutoresizingMaskIntoConstraints = false
        return logoIcon
    }()

    private let waveIcon: UIImageView = {
        let waveIcon = UIImageView(image: UIImage(named: "wayLogin"))
        waveIcon.translatesAutoresizingMaskIntoConstraints = false
        return waveIcon
    }()
    
    private let line1View: UIView = {
        let line1View = UIView()
        line1View.backgroundColor = .gray
        return line1View
    }()
    
    private let line2View: UIView = {
        let line2View = UIView()
        line2View.backgroundColor = .gray
        return line2View
    }()
    
    private let line3View: UIView = {
        let line3View = UIView()
        line3View.backgroundColor = .gray
        return line3View
    }()
    
    private let line4View: UIView = {
        let line4View = UIView()
        line4View.backgroundColor = .gray
        return line4View
    }()
    
    private let line5View: UIView = {
        let line5View = UIView()
        line5View.backgroundColor = .gray
        return line5View
    }()
    
    private let line6View: UIView = {
        let line6View = UIView()
        line6View.backgroundColor = .gray
        return line6View
    }()
    
    private let line7View: UIView = {
        let line7View = UIView()
        line7View.backgroundColor = .gray
        return line7View
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.backgroundBravve.rawValue)
        view.addSubviews([logoIcon, waveIcon, buttonReservation, scrollView])
        scrollView.addSubview(viewToScroll)
        viewToScroll.addSubviews([titleLabel, subtitleLabel, info1Label, locationDetailLabel, locationLabel, schedulingLabel, placeDetailLabel, placeInfo1Label, placeInfo2Label, placeInfo3Label, placeInfo4Label, placeInfo5Label, placeInfo6Label, placeInfo7Label, line1View, line2View, line3View, line4View, line5View, line6View, line7View, locationIcon, schedulingIcon])
        self.buttonReservation.setToBottomButtonKeyboardDefault("Ir para Minhas Reservas", backgroundColor: .buttonPink)
        iconsConstraints()
        viewsConstraints()
        viewElementsConstraints()
        
//        self.buttonReservation.isHidden = true
        
    }
    
    
    
    
    func iconsConstraints() {
        
        logoIcon.constraintInsideTo(.top, view, 56)
        logoIcon.constraintInsideTo(.leading, view, 26)
        logoIcon.heightAnchorInSuperview(50)
        logoIcon.widthAnchorInSuperview(198.05)
        
//        logoIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
//        logoIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
//        logoIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        logoIcon.widthAnchor.constraint(equalToConstant: 198.05).isActive = true
        
        waveIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        waveIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        waveIcon.heightAnchor.constraint(equalToConstant: 165.93).isActive = true
        waveIcon.widthAnchor.constraint(equalToConstant: 250.37).isActive = true
        

        
    }
    
    func viewsConstraints() {
        
        scrollView.constraintOutsideTo(.top, waveIcon)
        scrollView.constraintInsideTo(.leading, view, 26)
        scrollView.constraintInsideTo(.trailing, view, 26)
        scrollView.constraintOutsideTo(.bottom, buttonReservation, 2)
        
//        scrollView.topAnchor.constraint(equalTo: waveIcon.bottomAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: buttonReservation.topAnchor, constant: -2).isActive = true
        
        
        viewToScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
//        viewToScroll.heightAnchorInSuperview(650)
        
//        viewToScroll.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
//        viewToScroll.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
//        viewToScroll.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
//        viewToScroll.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
//        viewToScroll.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
//        viewToScroll.heightAnchorInSuperview(650)

        
    }
    
    func viewElementsConstraints() {
        
        titleLabel.topAnchor.constraint(equalTo: viewToScroll.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: viewToScroll.trailingAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        info1Label.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        info1Label.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        info1Label.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        
        line1View.topAnchor.constraint(equalTo: info1Label.bottomAnchor, constant: 24).isActive = true
        line1View.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        line1View.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: -5).isActive = true
        line1View.heightAnchorInSuperview(1)
        
        locationDetailLabel.topAnchor.constraint(equalTo: line1View.bottomAnchor, constant: 20).isActive = true
        locationDetailLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        locationDetailLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        
        locationIcon.topAnchor.constraint(equalTo: locationDetailLabel.bottomAnchor, constant: 20).isActive = true
        locationIcon.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 14).isActive = true
        locationIcon.widthAnchor.constraint(equalToConstant: 10.49).isActive = true
        
        schedulingIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 34).isActive = true
        schedulingIcon.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor).isActive = true
        schedulingIcon.heightAnchor.constraint(equalToConstant: 14).isActive = true
        schedulingIcon.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: locationIcon.topAnchor).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: locationIcon.leadingAnchor, constant: 17).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        
        schedulingLabel.topAnchor.constraint(equalTo: schedulingIcon.topAnchor).isActive = true
        schedulingLabel.leadingAnchor.constraint(equalTo: schedulingIcon.leadingAnchor, constant: 20).isActive = true
        schedulingLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        
        placeDetailLabel.topAnchor.constraint(equalTo: schedulingLabel.bottomAnchor, constant: 20).isActive = true
        placeDetailLabel.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeDetailLabel.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        placeInfo1Label.topAnchor.constraint(equalTo: placeDetailLabel.bottomAnchor, constant: 20).isActive = true
        placeInfo1Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo1Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line2View.topAnchor.constraint(equalTo: placeInfo1Label.bottomAnchor, constant: 8).isActive = true
        line2View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line2View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line2View.heightAnchorInSuperview(1)
        
        placeInfo2Label.topAnchor.constraint(equalTo: placeInfo1Label.bottomAnchor, constant: 16).isActive = true
        placeInfo2Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo2Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line3View.topAnchor.constraint(equalTo: placeInfo2Label.bottomAnchor, constant: 8).isActive = true
        line3View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line3View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line3View.heightAnchorInSuperview(1)
        
        placeInfo3Label.topAnchor.constraint(equalTo: placeInfo2Label.bottomAnchor, constant: 16).isActive = true
        placeInfo3Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo3Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line4View.topAnchor.constraint(equalTo: placeInfo3Label.bottomAnchor, constant: 8).isActive = true
        line4View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line4View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line4View.heightAnchorInSuperview(1)
        
        placeInfo4Label.topAnchor.constraint(equalTo: placeInfo3Label.bottomAnchor, constant: 16).isActive = true
        placeInfo4Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo4Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line5View.topAnchor.constraint(equalTo: placeInfo4Label.bottomAnchor, constant: 8).isActive = true
        line5View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line5View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line5View.heightAnchorInSuperview(1)
        
        placeInfo5Label.topAnchor.constraint(equalTo: placeInfo4Label.bottomAnchor, constant: 16).isActive = true
        placeInfo5Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo5Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line6View.topAnchor.constraint(equalTo: placeInfo5Label.bottomAnchor, constant: 8).isActive = true
        line6View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line6View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line6View.heightAnchorInSuperview(1)
     
        placeInfo6Label.topAnchor.constraint(equalTo: placeInfo5Label.bottomAnchor, constant: 16).isActive = true
        placeInfo6Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo6Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        
        line7View.topAnchor.constraint(equalTo: placeInfo6Label.bottomAnchor, constant: 8).isActive = true
        line7View.leadingAnchor.constraint(equalTo: line1View.leadingAnchor).isActive = true
        line7View.trailingAnchor.constraint(equalTo: line1View.trailingAnchor).isActive = true
        line7View.heightAnchorInSuperview(1)
        
        placeInfo7Label.topAnchor.constraint(equalTo: placeInfo6Label.bottomAnchor, constant: 16).isActive = true
        placeInfo7Label.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor).isActive = true
        placeInfo7Label.trailingAnchor.constraint(equalTo: locationDetailLabel.trailingAnchor).isActive = true
        placeInfo7Label.bottomAnchor.constraint(equalTo: viewToScroll.bottomAnchor, constant: -50).isActive = true
        
    }
    
}
