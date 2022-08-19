//
//  ReservaFinalizadaView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation
import UIKit


class ReservationCompletedView: UIViewController {
    
        
        private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
        private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
        
        private let subView1: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.backgroundColor = UIColor(red: 0.02, green: 0, blue: 0.37, alpha: 1)
        return view
        }()
    
        private let subView2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = UIColor(red: 0.02, green: 0, blue: 0.37, alpha: 1)
        return view
        }()
    
        private let subView3: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = UIColor(red: 0.02, green: 0, blue: 0.37, alpha: 1)
        return view
        }()
    
    
        private let titleLabel: UILabel = {
             let titleLabel = UILabel()
             titleLabel.font = UIFont(name: "KoHo-Bold", size: 45)
             //trocar por Koho
             titleLabel.textColor = .white
             titleLabel.text = "Parabéns, Ana!"
             titleLabel.numberOfLines = 0
             titleLabel.translatesAutoresizingMaskIntoConstraints = false
             return titleLabel
         }()
         
         private let subtitleLabel: UILabel = {
             let subtitleLabel = UILabel()
             subtitleLabel.font = UIFont(name: "Ubuntu-Regular", size: 20)
             //trocar por Ununtu
             subtitleLabel.textColor = .white
             subtitleLabel.text = "Sua reserva foi realizada com \nsucesso!"
             subtitleLabel.numberOfLines = 0
             subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
             return subtitleLabel
         }()
         
         private let info1Label: UILabel = {
             let info1Label = UILabel()
             info1Label.font = UIFont(name: "Ubuntu-Regular", size: 15)
             //trocar por Ununtu
             info1Label.textColor = .white
             info1Label.text = "Agradecemos por fazer sua reserva e abaixo, estamos mostrando o novo saldo da sua carteira e alguns detalhes sobre a sua reserva."
             info1Label.numberOfLines = 0
             info1Label.translatesAutoresizingMaskIntoConstraints = false
             return info1Label
         }()
         
         private let lineView: UIView = {
             let lineView = UIView(frame: CGRect(x: 26, y: 150, width: 364, height: 2.0))
             lineView.layer.borderWidth = 1.0
             lineView.layer.borderColor = UIColor.gray.cgColor
             return lineView
         }()
    
        private let companyLabel: UILabel = {
            let companyLabel = UILabel()
            companyLabel.font = UIFont(name: "Ubuntu-Regular", size: 20)
            //trocar por Ubuntu
            companyLabel.textColor = .white
            companyLabel.text = "Foursys"
            companyLabel.numberOfLines = 0
            companyLabel.translatesAutoresizingMaskIntoConstraints = false
            return companyLabel
        }()
        
        private let newBalanceLabel: UILabel = {
            let newBalanceLabel = UILabel()
            newBalanceLabel.font = UIFont(name: "Ubuntu-Bold", size: 20)
            //trocar por bnuntu
            newBalanceLabel.textColor = .white
            newBalanceLabel.text = "Novo saldo"
            newBalanceLabel.numberOfLines = 0
            newBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
            return newBalanceLabel
        }()
        
        private let line2View: UIView = {
            let line2View = UIView(frame: CGRect(x: 26, y: 240, width: 364, height: 2.0))
            line2View.layer.borderWidth = 1.0
            line2View.layer.borderColor = UIColor.gray.cgColor
            return line2View
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
        
        private let locationLabel: UILabel = {
            let locationLabel = UILabel()
            locationLabel.font = UIFont(name: "Ubuntu-Regular", size: 12)
            //trocar por Ubuntu
            locationLabel.textColor = .white
            locationLabel.text = "Av. São João, Cj. Boulevard, nº900, Sâo Paulo. SP 06020-010, BR"
            locationLabel.numberOfLines = 0
            locationLabel.translatesAutoresizingMaskIntoConstraints = false
            return locationLabel
        }()
    
        private let schedulingLabel: UILabel = {
            let schedulingLabel = UILabel()
            schedulingLabel.font = UIFont(name: "Ubuntu-Regular", size: 12)

            //trocar por Ubuntu
            schedulingLabel.textColor = .white
            schedulingLabel.text = "Sua reserva está marcada para Segunda: 08:00h - 17:00h"
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
    
        private let line3View: UIView = {
            let line3View = UIView(frame: CGRect(x: 26, y: 155, width: 364, height: 2.0))
            line3View.layer.borderWidth = 1.0
            line3View.layer.borderColor = UIColor.gray.cgColor
            return line3View
           
        }()
    
        private let line4View: UIView = {
            let line4View = UIView(frame: CGRect(x: 26, y: 185, width: 364, height: 2.0))
            line4View.layer.borderWidth = 1.0
            line4View.layer.borderColor = UIColor.gray.cgColor
            return line4View
            
        }()
    
        private let line5View: UIView = {
            let line5View = UIView(frame: CGRect(x: 26, y: 215, width: 364, height: 2.0))
            line5View.layer.borderWidth = 1.0
            line5View.layer.borderColor = UIColor.gray.cgColor
            return line5View
            
        }()
        
        private let line6View: UIView = {
            let line6View = UIView(frame: CGRect(x: 26, y: 245, width: 364, height: 2.0))
            line6View.layer.borderWidth = 1.0
            line6View.layer.borderColor = UIColor.gray.cgColor
            return line6View
            
        }()
        
        private let line7View: UIView = {
            let line7View = UIView(frame: CGRect(x: 26, y: 275, width: 364, height: 2.0))
            line7View.layer.borderWidth = 1.0
            line7View.layer.borderColor = UIColor.gray.cgColor
            return line7View
            
        }()
        
        private let line8View: UIView = {
            let line8View = UIView(frame: CGRect(x: 26, y: 305, width: 364, height: 2.0))
            line8View.layer.borderWidth = 1.0
            line8View.layer.borderColor = UIColor.gray.cgColor
            return line8View
            
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
    
        private let balanceButton: UIButton = {
                let balanceButton = UIButton()
                balanceButton.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
            //rosa bravve
                balanceButton.setTitle("104,50 créditos", for: .normal)
            balanceButton.titleLabel?.font = .systemFont(ofSize: 18)
            //valor com fonte maior
            balanceButton.layer.cornerRadius = 4
                balanceButton.translatesAutoresizingMaskIntoConstraints = false
                return balanceButton
            }()
    
        private let doneButton: UIButton = {
                let button = UIButton()
            button.backgroundColor = UIColor(red: 1, green: 0.13, blue: 0.47, alpha: 1)
            //rosa bravve
                button.setTitle("Ir para Minhas Reservas", for: .normal)
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
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
         
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.02, green: 0, blue: 0.37, alpha: 1)
        
        setupScrollView()
        labelConstraints()
        buttonConstraints()
        iconsConstraints()
        
        doneButton.addTarget(self, action: #selector(actionDoneButton), for: .touchUpInside)
        
    }
    
    @objc func actionDoneButton() {
        let vc = CancelReservationView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func setupScrollView() {
    let margins = view.layoutMarginsGuide
    view.addSubview(scrollView)
    view.addSubview(doneButton)
        
        subView1.addSubviews([waveIcon,
                              logoIcon])
        
        subView2.addSubviews([titleLabel,
                              subtitleLabel,
                              info1Label,
                              lineView,
                              companyLabel,
                              newBalanceLabel])
        
        subView3.addSubviews([locationIcon,
                              schedulingIcon,
                              line2View,
                              balanceButton,
                              locationDetailLabel,
                              locationLabel,
                              schedulingLabel,
                              placeDetailLabel,
                              placeInfo1Label,
                              placeInfo2Label,
                              placeInfo3Label,
                              placeInfo4Label,
                              placeInfo5Label,
                              placeInfo5Label,
                              placeInfo6Label,
                              placeInfo7Label,
                              line3View,
                              line4View,
                              line5View,
                              line6View,
                              line7View,
                              line8View])
        
                   
        
    scrollView.addSubview(scrollStackViewContainer)
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    configureContainerView()
    }
    
    func labelConstraints() {
        titleLabel.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: -170).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 26).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        subtitleLabel.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: -110).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 26).isActive = true
        
        info1Label.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        info1Label.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: -50).isActive = true
        info1Label.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 26).isActive = true
        
        companyLabel.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        companyLabel.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: 30).isActive = true
        companyLabel.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 26).isActive = true
        
        newBalanceLabel.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        newBalanceLabel.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: 60).isActive = true
        newBalanceLabel.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 26).isActive = true
        
        locationDetailLabel.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        locationDetailLabel.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -270).isActive = true
        locationDetailLabel.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        locationLabel.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        locationLabel.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -230).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 46).isActive = true
        
        schedulingLabel.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        schedulingLabel.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -190).isActive = true
        schedulingLabel.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 46).isActive = true
        
        placeDetailLabel.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeDetailLabel.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -150).isActive = true
        placeDetailLabel.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo1Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo1Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -110).isActive = true
        placeInfo1Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo2Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo2Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -80).isActive = true
        placeInfo2Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo3Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo3Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -50).isActive = true
        placeInfo3Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo4Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo4Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -20).isActive = true
        placeInfo4Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo5Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo5Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: 10).isActive = true
        placeInfo5Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo6Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo6Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: 40).isActive = true
        placeInfo6Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
        placeInfo7Label.centerXAnchor.constraint(equalTo: subView3.centerXAnchor).isActive = true
        placeInfo7Label.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: 70).isActive = true
        placeInfo7Label.leadingAnchor.constraint(equalTo: subView3.leadingAnchor, constant: 26).isActive = true
        
    }
    
    func buttonConstraints() {
        
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 420).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        balanceButton.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        balanceButton.centerYAnchor.constraint(equalTo: subView2.centerYAnchor, constant: 45).isActive = true
        balanceButton.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 260).isActive = true
        balanceButton.trailingAnchor.constraint(equalTo: subView2.trailingAnchor, constant: -26).isActive = true
        balanceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
    }
    
    
    func iconsConstraints() {
        
        logoIcon.centerXAnchor.constraint(equalTo: subView1.centerXAnchor, constant: -79).isActive = true
        logoIcon.centerYAnchor.constraint(equalTo: subView1.centerYAnchor, constant: -40).isActive = true
        logoIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoIcon.widthAnchor.constraint(equalToConstant: 198.05).isActive = true
        
        waveIcon.centerXAnchor.constraint(equalTo: subView1.centerXAnchor, constant: 70).isActive = true
        waveIcon.centerYAnchor.constraint(equalTo: subView1.centerYAnchor, constant: -30).isActive = true
        waveIcon.heightAnchor.constraint(equalToConstant: 165.93).isActive = true
        waveIcon.widthAnchor.constraint(equalToConstant: 250.37).isActive = true
        
        locationIcon.centerXAnchor.constraint(equalTo: subView3.centerXAnchor, constant: -175).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -240).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 14).isActive = true
        locationIcon.widthAnchor.constraint(equalToConstant: 10.49).isActive = true
        
        schedulingIcon.centerXAnchor.constraint(equalTo: subView3.centerXAnchor, constant: -175).isActive = true
        schedulingIcon.centerYAnchor.constraint(equalTo: subView3.centerYAnchor, constant: -200).isActive = true
        schedulingIcon.heightAnchor.constraint(equalToConstant: 14).isActive = true
        schedulingIcon.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
    }
    
    private func configureContainerView() {
    scrollStackViewContainer.addArrangedSubview(subView1)
    scrollStackViewContainer.addArrangedSubview(subView2)
    scrollStackViewContainer.addArrangedSubview(subView3)
    
    }
    
    
}

