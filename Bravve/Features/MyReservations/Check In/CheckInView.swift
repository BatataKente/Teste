//
//  CheckInView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import Foundation
import UIKit

class CheckInQrCodeViewController: UIViewController{
    
    private let customAlert: CustomAlert = CustomAlert()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setBackgroundImage(UIImage(named: ButtonsBravve.backWhite.rawValue), for: .normal)
        view.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var cameraImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: IconsBravve.photoWhite.rawValue)
        return view
    }()
    
    private lazy var qrCodeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Aponte sua câmera para o QR Code no espaço"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(19).generateSizeForScreen)
        return view
    }()
    
    private lazy var qrCodeReaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = CGFloat(5).generateSizeForScreen
        view.layer.cornerRadius = CGFloat(29).generateSizeForScreen
        view.layer.borderColor = UIColor(named: ColorsBravve.buttonPink.rawValue)?.cgColor
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var cantScanButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "Não consigo escanear", attributes: [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue, NSAttributedString.Key.underlineColor : UIColor.link, NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(19).generateSizeForScreen) ?? UIFont.systemFont(ofSize: 19)]), for: .normal)
        view.setTitleColor(.link, for: .normal)
        view.addTarget(self, action: #selector(cantScanButtonTapped), for: .touchUpInside)
        return view
    }()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.backgroundColor = .black
        view.addSubviews([backButton, cameraImageView, qrCodeReaderView, cantScanButton, qrCodeLabel])
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(28).generateSizeForScreen),
            self.backButton.heightAnchor.constraint(equalToConstant: CGFloat(21).generateSizeForScreen),
            self.backButton.widthAnchor.constraint(equalToConstant: CGFloat(13).generateSizeForScreen),
            
            self.cameraImageView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: CGFloat(40).generateSizeForScreen),
            self.cameraImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.qrCodeLabel.topAnchor.constraint(equalTo: self.cameraImageView.bottomAnchor, constant: CGFloat(30).generateSizeForScreen),
            self.qrCodeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(49).generateSizeForScreen),
            self.qrCodeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: CGFloat(-49).generateSizeForScreen),
            
            
            self.qrCodeReaderView.topAnchor.constraint(equalTo: self.qrCodeLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            self.qrCodeReaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.qrCodeReaderView.heightAnchor.constraint(equalToConstant: CGFloat(285).generateSizeForScreen),
            self.qrCodeReaderView.widthAnchor.constraint(equalToConstant: CGFloat(285).generateSizeForScreen),
            
            self.cantScanButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(-84).generateSizeForScreen),
            self.cantScanButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
        ])
    }
    
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
    
    @objc func cantScanButtonTapped(){
        customAlert.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Por favor entre em contato com o Community Manager ou outro responsável pelo espaço.", enterAttributed: "Ok", enterHandler: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), on: self)
    }
    
}
