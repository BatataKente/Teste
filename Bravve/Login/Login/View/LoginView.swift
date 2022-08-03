//
//  loginView.swift
//  Bravve
//
//  Created by user217108 on 8/2/22.
//



import Foundation
import UIKit



class LoginView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        setupLayoutConstraints()
       
        
        let stackViewTap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        cellStackView.addGestureRecognizer(stackViewTap)
        passwordStackView.addGestureRecognizer(stackViewTap)
        
//
//        backButton.setToBackButtonDefault()
//        titleLabel.font = UIFont(name: FontsBravve, size: 51)
        
    }
    
    @objc func stackViewTapped() {
        cellLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        cellStackView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30)
        
        cellTextField.isHidden = false
        passwordLabel.font = UIFont(name: "Ubuntu-Light", size: 11)
        passwordTextField.isHidden = false
        
    }
    
    func setupView() {
        view.addSubviews([backgroundView,wayImage,logoImage,titleLabel,subTitleLabel,cellStackView,passwordStackView,eyeButton,passwordRecoveryButton,enterButton,newLabel,registerButton])
        
        
        
    }
    
   
    
    
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BlueBravve")
        view.translatesAutoresizingMaskIntoConstraints =  false
      
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoWhite")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints =  false
        
        return view
        
    }()
    

    private lazy var wayImage: UIImageView = {
        let view   = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image  = UIImage(named: "wayLogin")
        view.translatesAutoresizingMaskIntoConstraints =  false
        
        return view
        
    }()
      
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
//        view.font = UIFont(name: FontsBravve.medium.rawValue,
//                                                                size: CGFloat(51).generateSizeForScreen)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints =  false
        view.textColor =  UIColor(named: "WhiteBravve")
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.2
//        view.textAlignment = .center
        
        view.text = "Bem vindo(a) à Bravve "
        
//        view.lineBreakMode = .byWordWrapping
//
//        var paragraphStyle = NSMutableParagraphStyle()
//
//        paragraphStyle.lineHeightMultiple = 0.7
//        view.attributedText = NSMutableAttributedString(string: "Bem vindo(a) \nà Bravve", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let view =  UILabel()
        view.font = UIFont(name: "Ubuntu-Light", size: 16)
//        view.font = UIFont.appFont(ofSize: 16, weight: .bold)
        view.textColor = UIColor(named: "WhiteBravve")
        view.text = "O futuro do trabalho é hibrído, remoto,\nconectado e humano!"
        view.numberOfLines = 4
        view.translatesAutoresizingMaskIntoConstraints =  false
        
        return view
    }()
    
    private lazy var cellLabel: UILabel = {
        let view = UILabel()
        view.text =  "Número de Celular"
        view.font = UIFont(name: "Ubuntu-Light", size: 15)
        view.textColor = UIColor(named: "GrayBravveLabel")
        return view
    }()
    private lazy var cellTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont(name: "Ubuntu-Medium", size: 16)
        view.isHidden = true
        view.keyboardType = .namePhonePad
        return view
    }()
    
    private lazy var  cellStackView: UIStackView = {
        
        let stackMargins: CGFloat = 20
        
        let cellStackView = UIStackView(arrangedSubviews: [cellLabel,cellTextField])
        cellStackView.spacing = 2
        cellStackView.axis = .vertical
        cellStackView.backgroundColor = .white
        cellStackView.layer.cornerRadius = 8
        cellStackView.isLayoutMarginsRelativeArrangement = true
        cellStackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                   left: stackMargins,
                                                   bottom: stackMargins,
                                                   right: stackMargins)
        cellStackView.translatesAutoresizingMaskIntoConstraints =  false
        return cellStackView
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.text =  "Senha"
        view.font = UIFont(name: "Ubuntu-Light", size: 15)
        view.textColor = UIColor(named: "GrayBravveLabel")
        return view
    }()
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.font = UIFont(name: "Ubuntu-Medium", size: 16)
        view.isHidden = true
        view.keyboardType = .namePhonePad
        return view
    }()
    
    private lazy var eyeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "eyeOpen"), for: .normal)
        view.setImage(UIImage(named: "eyeClose"), for: .selected)
        view.frame = CGRect(x:0, y:0, width:20.03, height:15.97)
        view.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints =  false
        return view
    }()
    
    @objc func tapEyeButton () {
        
        eyeButton.isSelected.toggle()
        
        if eyeButton.isSelected {
            passwordTextField.isSecureTextEntry = true
            
        } else {
            eyeButton.isSelected == false
            passwordTextField.isSecureTextEntry  = false
        }
    }

    
    private lazy var  passwordStackView: UIStackView = {
        
        let stackMargins: CGFloat = 20
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel,passwordTextField])
        passwordStackView.spacing = 2
        passwordStackView.axis = .vertical
        passwordStackView.backgroundColor = .white
        passwordStackView.layer.cornerRadius = 8
        passwordStackView.isLayoutMarginsRelativeArrangement = true
        passwordStackView.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                   left: stackMargins,
                                                   bottom: stackMargins,
                                                   right: stackMargins)
        passwordStackView.translatesAutoresizingMaskIntoConstraints =  false
        return passwordStackView
    }()
    
    
    
        private lazy var passwordRecoveryButton : UIButton = {
            let view = UIButton()
          
            let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1,
            NSAttributedString.Key.font: UIFont(name: "Ubuntu-Light", size: 15),
            NSAttributedString.Key.foregroundColor: UIColor(named: "BlueBravve2")]

            let attributedString = NSMutableAttributedString(string: "Esqueci minha senha", attributes: attributes)
            view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
            view.translatesAutoresizingMaskIntoConstraints =  false
            
            return view
    }()
    
        private lazy var enterButton: UIButton = {
            let view = UIButton()
            view.backgroundColor = UIColor(named: "PinkBravve")
            view.layer.cornerRadius = 12

            
            let stackMargins : CGFloat = 20
            view.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                       left: stackMargins,
                                                       bottom: stackMargins,
                                                       right: stackMargins)
            
            
            
            let attributesFont: [NSAttributedString.Key : Any] = [
            
            NSAttributedString.Key.font: UIFont(name: "Ubuntu-Bold", size: 16),
            NSAttributedString.Key.foregroundColor: UIColor(named: "WhiteBravve")]

            let attributedString = NSMutableAttributedString(string: "Entrar", attributes: attributesFont)
            view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
            view.translatesAutoresizingMaskIntoConstraints =  false
            return view
    }()
    
    
    private lazy var newLabel : UILabel  = {
        let view = UILabel()
        view.font = UIFont(name: "Ubuntu-Light", size: 15)
        view.text = "Novo por aqui?"
        view.textColor = UIColor(named: "WhiteBravve")
        
        view.translatesAutoresizingMaskIntoConstraints =  false
    
    return view
    }()
    
    
        private lazy var registerButton: UIButton = {
            let view = UIButton()
            view.backgroundColor = UIColor(named: "BlueBravve")
            view.layer.cornerRadius = 12
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            let stackMargins : CGFloat = 20
            view.layoutMargins = UIEdgeInsets(top: stackMargins,
                                                       left: stackMargins,
                                                       bottom: stackMargins,
                                                       right: stackMargins)
            
            view.translatesAutoresizingMaskIntoConstraints =  false
            
            let attributesFont: [NSAttributedString.Key : Any] = [
               
            NSAttributedString.Key.font: UIFont(name: "Ubuntu-Bold", size: 16),
            NSAttributedString.Key.foregroundColor: UIColor(named: "WhiteBravve")]
            
            let attributedString = NSMutableAttributedString(string: "Cadastre-se", attributes: attributesFont)
            view.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
            
            return view
    }()
    


        
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
    
            
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            

            wayImage.topAnchor.constraint(equalTo: view.topAnchor,constant: -15),
            wayImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:0),

            wayImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4533),
            wayImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3078),
////
//            logoImage.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 10),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22.79),
           
            
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),

            
            titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8702),
//            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2857),
            
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
           
            
            subTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8826),
            
            cellStackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor,constant: 20),
            cellStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            cellStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -22),
            
            cellStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8826),

            
            passwordStackView.topAnchor.constraint(equalTo: cellStackView.bottomAnchor,constant: 15),
            passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 22),
            passwordStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8826),

            eyeButton.heightAnchor.constraint(equalToConstant: 15),
            eyeButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor,constant: -10),
            eyeButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor,constant: -10),
            
            passwordRecoveryButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor,constant: 19),
            passwordRecoveryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 26),
           
            enterButton.topAnchor.constraint(equalTo: passwordRecoveryButton.bottomAnchor,constant: 23.5),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:22),
            enterButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8826),
            enterButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0628),
            
            newLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor,constant: 30),
            newLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            
            registerButton.topAnchor.constraint(equalTo: newLabel.bottomAnchor,constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8826),
            registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0628)
            
            
            
            
            
            
            
    
    
    ])
            
        

    }
    
}


