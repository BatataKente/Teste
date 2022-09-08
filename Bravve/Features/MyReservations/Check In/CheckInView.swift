//
//  CheckInView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import AVFoundation
import UIKit

class CheckInQrCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    private let customAlertFail: CustomAlert = CustomAlert()
    private let customAlertSuccess: CustomAlert = CustomAlert()
    
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
        view.lineBreakMode = .byWordWrapping
        view.textColor = .white
        view.numberOfLines = 5
        view.textAlignment = .center
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.31
        view.attributedText = NSMutableAttributedString(string: " Aponte sua câmera para o QR Code no espaço ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(19).generateSizeForScreen)
        let layoutVerticalMargins = CGFloat(50).generateSizeForScreen
        let layoutHorizontalMargins = CGFloat(50).generateSizeForScreen
        view.layoutMargins = UIEdgeInsets(top: layoutVerticalMargins, left: layoutHorizontalMargins, bottom: layoutVerticalMargins, right: layoutHorizontalMargins)
        return view
    }()
    
    private lazy var qrCodeReaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = CGFloat(29).generateSizeForScreen
        view.layer.borderColor = UIColor(named: ColorsBravve.buttonPink.rawValue)?.cgColor
        view.backgroundColor = .lightGray
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var qrCodeBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = CGFloat(29).generateSizeForScreen
        view.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        return view
    }()
    
    private lazy var qrCodeBackViewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        addViewTarget()
    }
    
    private func setupViews(){
        view.backgroundColor = .black
        view.addSubviews([backButton, cameraImageView, qrCodeBackView , qrCodeBackViewTop, qrCodeReaderView,cantScanButton, qrCodeLabel])
    }
    
    private func addViewTarget(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(action))
        self.qrCodeReaderView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func action(){
        customAlertSuccess.showAlert(image: UIImage(named: IconsBravve.checkBlue.rawValue), message: "Check-in realizado com sucesso.\nSeja Bem-Vindo ao seu espaço.", enterAttributed: "Ok", enterHandler: UIAction(handler: {[weak self] _ in
            let vc = CheckOutView()
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true)
            Flags.shared.flagReservation = 3
        }), on: self)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(28).generateSizeForScreen),
            self.backButton.heightAnchor.constraint(equalToConstant: CGFloat(21).generateSizeForScreen),
            self.backButton.widthAnchor.constraint(equalToConstant: CGFloat(13).generateSizeForScreen),
            
            self.cameraImageView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: CGFloat(40).generateSizeForScreen),
            self.cameraImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.cameraImageView.heightAnchor.constraint(equalToConstant: CGFloat(32).generateSizeForScreen),
            self.cameraImageView.widthAnchor.constraint(equalToConstant: CGFloat(38).generateSizeForScreen),
            
            self.qrCodeLabel.topAnchor.constraint(equalTo: self.cameraImageView.bottomAnchor, constant: CGFloat(30).generateSizeForScreen),
            self.qrCodeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(49).generateSizeForScreen),
            self.qrCodeLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-49).generateSizeForScreen),
            self.qrCodeLabel.widthAnchor.constraint(equalToConstant: CGFloat(277).generateSizeForScreen),
            self.qrCodeLabel.heightAnchor.constraint(equalToConstant: CGFloat(58).generateSizeForScreen),
            
            self.qrCodeReaderView.topAnchor.constraint(equalTo: self.qrCodeLabel.bottomAnchor, constant: CGFloat(55).generateSizeForScreen),
            self.qrCodeReaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.qrCodeReaderView.heightAnchor.constraint(equalToConstant: CGFloat(283).generateSizeForScreen),
            self.qrCodeReaderView.widthAnchor.constraint(equalToConstant: CGFloat(283).generateSizeForScreen),
            
            self.qrCodeBackView.topAnchor.constraint(equalTo: self.qrCodeLabel.bottomAnchor, constant: CGFloat(51).generateSizeForScreen),
            self.qrCodeBackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.qrCodeBackView.heightAnchor.constraint(equalToConstant: CGFloat(291).generateSizeForScreen),
            self.qrCodeBackView.widthAnchor.constraint(equalToConstant: CGFloat(291).generateSizeForScreen),
            
            self.qrCodeBackViewTop.topAnchor.constraint(equalTo: self.qrCodeLabel.bottomAnchor, constant: CGFloat(51).generateSizeForScreen),
            self.qrCodeBackViewTop.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.qrCodeBackViewTop.heightAnchor.constraint(equalToConstant: CGFloat(4).generateSizeForScreen),
            self.qrCodeBackViewTop.widthAnchor.constraint(equalToConstant: CGFloat(180).generateSizeForScreen),
            
            self.cantScanButton.topAnchor.constraint(equalTo: qrCodeBackView.bottomAnchor, constant: CGFloat(147).generateSizeForScreen),
            self.cantScanButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
        ])
    }
    
    @objc func backButtonTapped(){
        self.dismiss(animated: true)
    }
    
    @objc func cantScanButtonTapped(){
        customAlertFail.showAlert(image: UIImage(named: IconsBravve.questionCircleBlue_1.rawValue), message: "Por favor entre em contato com o Community Manager ou outro responsável pelo espaço.", enterAttributed: "Ok", enterHandler: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), on: self)
    }
    
}
