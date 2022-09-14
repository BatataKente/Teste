//
//  NomeView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class FotoView: UIViewController {
    
    private let userUUID: String
    
    private var imageURL: URL?
    
    init(userUUID: String) {
        self.userUUID = userUUID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let bravveIcon = UIImageView()
        
    private let registerButton = UIButton()
    
    private let firstWay = UIImageView(),
        secondWay = UIImageView()
    
    private lazy var progressBarStackView: UIStackView = {
        
        let buttons = createProgressBarButtons([IconsBravve.photoBlue.rawValue,
                                                IconsBravve.noteGray.rawValue,
                                                IconsBravve.hobbiesGray.rawValue,
                                                IconsBravve.activitiesGray.rawValue])
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let infoLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.setToDefault(text: "Quer adicionar uma foto ao seu perfil, agora? Esse passo é opcional!")
        
        return infoLabel
    }()
    
    private let tutorialLabel: UILabel = {
        
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.setToDefault(text: "Recomendado: 512x512\nMáximo: 2MB")
        
        return infoLabel
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.image = UIImage(named: ImagesBravve.photo.rawValue)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setImage(UIImage(named: ButtonsBravve.photoButtonPink.rawValue),
                            for: .normal)
        
        return editButton
    }()
    
    let imagePicker = UIImagePickerController()
    
    let sessionManager = SessionManager()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    override func viewDidLoad() {
        
        setupView()
        setupDefaults()
        setupConstraints()
        
        registerButton.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        
        editButton.addTarget(self, action: #selector(showGallery), for: .touchUpInside)
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary;
        imagePicker.allowsEditing = true
        
        
        let handler = {(action: UIAction) in
            let vc = ProfessionView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
        view.createRegisterCustomBar(jumpAction: UIAction(handler: handler)) {_ in
                if let tokenView = self.presentingViewController,
                   let confirmDataView = tokenView.presentingViewController,
                   let passwordView = confirmDataView.presentingViewController,
                   let emailView = passwordView.presentingViewController,
                   let phoneView = emailView.presentingViewController,
                   let nomeView = phoneView.presentingViewController,
                   let loginView = nomeView.presentingViewController{
                    
                    tokenView.view.isHidden = true
                    confirmDataView.view.isHidden = true
                    passwordView.view.isHidden = true
                    emailView.view.isHidden = true
                    phoneView.view.isHidden = true
                    nomeView.view.isHidden = true
                    loginView.dismiss(animated: false)
                }
            }

        
        super.viewDidLoad()
    }
    
    private func setupView() {
        
        view.addSubviews([firstWay, secondWay, bravveIcon, progressBarStackView, infoLabel, registerButton, imageView, editButton, tutorialLabel])
        
        view.setToDefaultBackgroundColor()
    }
    
    private func setupDefaults() {
        
        firstWay.setWayToDefault(.wayPhoto)
        secondWay.setWayToDefault(.wayConfirm_2)
        bravveIcon.setLogoToDefault()
       
        registerButton.setToBottomButtonKeyboardDefault(backgroundColor: .buttonPink)
    }

    private func setupConstraints() {
        
        let height = view.frame.size.height
        imageView.layer.cornerRadius = height/10
        
        NSLayoutConstraint.activate([
            progressBarStackView.topAnchor.constraint(equalTo: bravveIcon.bottomAnchor, constant: 50),
            progressBarStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: progressBarStackView.bottomAnchor, constant: 50),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: height/5),
            imageView.heightAnchor.constraint(equalToConstant: height/5),
            
            tutorialLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            tutorialLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            editButton.widthAnchor.constraint(equalToConstant: 32),
            editButton.heightAnchor.constraint(equalToConstant: 32),
            editButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: height/15),
            editButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: height/15),
        ])
        
    }
    
    @objc func actionRegisterButton() {
        
        guard let imageURL = imageURL else {
            return
        }
        
        sessionManager.uploadPictureWithResponse(uuid: userUUID,endpoint: .usersPictures, picture_url: imageURL) { (statusCode, error, updatedPicture: UploadPicture?) in
            
            guard let updatedPicture = updatedPicture else {
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }

            let vc = ProfessionView()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
    }
    
   
}

extension FotoView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func showGallery() {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            DispatchQueue.main.async {
                self.imageView.image = pickedImage
            }
            
            guard let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
            
            self.imageURL = imageURL
            
            dismiss(animated: true)
            
        }
    }
}
