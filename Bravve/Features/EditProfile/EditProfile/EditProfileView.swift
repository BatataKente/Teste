//
//  EditProfileView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import SDWebImage

class EditProfileView: UIViewController {
    
    private lazy var tabBar = TabBarClosed(self)
    
    private let saveButton = UIButton()
    
    let editProfileViewModel = EditProfileViewModel()
    
    struct ViewElements {
        
        let scroll: UIScrollView,
            personalDataStack: UIStackView,
            aboutWorkStack: UIStackView,
            hobbiesStack: UIStackView,
            mattersStack: UIStackView
    }
    
    private let way: UIImageView = {
        
        let way = UIImageView()
        way.image = UIImage(named: ImagesBravve.wayReserv_2.rawValue)
        
        return way
    }()
    
    private let photoView: UIImageView = {
        
        let photoView = UIImageView()
        photoView.layer.masksToBounds = false
        photoView.image = UIImage(named: ImagesBravve.photo.rawValue)
        photoView.clipsToBounds = true
        
        return photoView
    }()
    
    private lazy var editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.setImage(UIImage(named: IconsBravve.photoBlue.rawValue),
                            for: .normal)
        
        let handler = {(action: UIAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        editButton.addAction(UIAction(handler: handler), for: .touchUpInside)
        
        return editButton
    }()
    
    private lazy var imagePicker: UIImagePickerController = {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary;
        imagePicker.allowsEditing = true
        
        return imagePicker
    }()
    
    private lazy var viewElements: ViewElements = {
        
        let backButton: UIButton = {
            
            let backButton = UIButton()
            
            var attributedTitle = NSMutableAttributedString(string: "Perfil / Editar perfil")
            
            let firstAttribute: [NSAttributedString.Key: Any] = [
                
                .font: UIFont(name: FontsBravve.regular.rawValue,
                              size: CGFloat(16).generateSizeForScreen) as Any,
            ]
            let secondAttribute: [NSAttributedString.Key: Any] = [
                
                .font: UIFont(name: FontsBravve.medium.rawValue,
                              size: CGFloat(16).generateSizeForScreen) as Any,
            ]
            
            attributedTitle.addAttributes(firstAttribute, range: (attributedTitle.string as NSString).range(of: "Perfil / "))
            attributedTitle.addAttributes(secondAttribute, range: (attributedTitle.string as NSString).range(of: "Editar perfil"))
            
            backButton.setAttributedTitle(attributedTitle, for: .normal)
            return backButton
        }()
        
        let personalDataLabel = editProfileViewModel.createLabel("Dados pessoais")
        
        let personalDataStack: UIStackView = {
            
            let personalDataStack = UIStackView()
            editProfileViewModel.setupStack(personalDataStack)
            
            return personalDataStack
        }()
        
        let aboutWorkLabel = editProfileViewModel.createLabel("Sobre seu trabalho")
        
        let aboutWorkStack: UIStackView = {
            
            let aboutWorkStack = UIStackView()
            editProfileViewModel.setupStack(aboutWorkStack)
            
            return aboutWorkStack
        }()
        
        let aboutYouLabel = editProfileViewModel.createLabel("Sobre você")
        
        let hobbiesLabel = editProfileViewModel.createLabel("Hobbies", color: .buttonPink,
                                                            UIFont(name: FontsBravve.medium.rawValue,
                                                                   size: CGFloat(16).generateSizeForScreen))
        let hobbiesLimitLabel = editProfileViewModel.createLabel("(Mínimo 3)",
                                                                 color: .buttonGray,
                                                                 UIFont(name: FontsBravve.light.rawValue,
                                                                        size: CGFloat(12).generateSizeForScreen))
        
        let hobbiesStack: UIStackView = {
            
            let hobbiesStack = UIStackView()
            editProfileViewModel.setupStack(hobbiesStack, alignment: .center)
            
            return hobbiesStack
        }()
        
        let mattersLabel = editProfileViewModel.createLabel("Assuntos", color: .buttonPink,
                                                            UIFont(name: FontsBravve.medium.rawValue,
                                                                   size: CGFloat(16).generateSizeForScreen))
        let mattersLimitLabel = editProfileViewModel.createLabel("(Mínimo 3)",
                                                          color: .buttonGray,
                                                          UIFont(name: FontsBravve.light.rawValue,
                                                                 size: CGFloat(12).generateSizeForScreen))

        let mattersStack: UIStackView = {
            
            let mattersStack = UIStackView()
            editProfileViewModel.setupStack(mattersStack, alignment: .center)

            return mattersStack
        }()
                
        let viewToScroll = UIView()
        viewToScroll.addSubviews([backButton, personalDataLabel, personalDataStack, aboutWorkLabel, aboutWorkStack, aboutYouLabel, hobbiesLabel, hobbiesLimitLabel, hobbiesStack, mattersLabel, mattersLimitLabel, mattersStack])
        
        editProfileViewModel.removeMasks(of: viewToScroll)
        
        let spacing = CGFloat(15).generateSizeForScreen
        
        backButton.topAnchor.constraint(equalTo: viewToScroll.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: viewToScroll.leadingAnchor,
                                            constant: CGFloat(25).generateSizeForScreen).isActive = true
        
        personalDataLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,
                                               constant: CGFloat(25).generateSizeForScreen).isActive = true
        personalDataLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor,
                                                   constant: CGFloat(5).generateSizeForScreen).isActive = true
        personalDataLabel.trailingAnchor.constraint(equalTo: viewToScroll.trailingAnchor,
                                                   constant: CGFloat(-30).generateSizeForScreen).isActive = true
        
        personalDataStack.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: spacing).isActive = true
        personalDataStack.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor).isActive = true
        personalDataStack.trailingAnchor.constraint(equalTo: personalDataLabel.trailingAnchor).isActive = true
        
        aboutWorkLabel.topAnchor.constraint(equalTo: personalDataStack.bottomAnchor,
                                            constant: CGFloat(35).generateSizeForScreen).isActive = true
        aboutWorkLabel.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor).isActive = true
        aboutWorkLabel.trailingAnchor.constraint(equalTo: personalDataLabel.trailingAnchor).isActive = true
        
        aboutWorkStack.topAnchor.constraint(equalTo: aboutWorkLabel.bottomAnchor, constant: spacing).isActive = true
        aboutWorkStack.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor).isActive = true
        aboutWorkStack.trailingAnchor.constraint(equalTo: personalDataLabel.trailingAnchor).isActive = true
        
        aboutYouLabel.topAnchor.constraint(equalTo: aboutWorkStack.bottomAnchor, constant: spacing).isActive = true
        aboutYouLabel.leadingAnchor.constraint(equalTo: personalDataLabel.leadingAnchor).isActive = true
        aboutYouLabel.trailingAnchor.constraint(equalTo: personalDataLabel.trailingAnchor).isActive = true
        
        hobbiesLabel.topAnchor.constraint(equalTo: aboutYouLabel.bottomAnchor, constant: spacing).isActive = true
        hobbiesLabel.leadingAnchor.constraint(equalTo: aboutYouLabel.leadingAnchor,
                                              constant: CGFloat(5).generateSizeForScreen).isActive = true
        
        hobbiesLimitLabel.centerYAnchor.constraint(equalTo: hobbiesLabel.centerYAnchor).isActive = true
        hobbiesLimitLabel.leadingAnchor.constraint(equalTo: hobbiesLabel.trailingAnchor,
                                                   constant: CGFloat(15).generateSizeForScreen).isActive = true
        
        hobbiesStack.topAnchor.constraint(equalTo: hobbiesLabel.bottomAnchor, constant: spacing).isActive = true
        hobbiesStack.leadingAnchor.constraint(equalTo: aboutYouLabel.leadingAnchor).isActive = true
        hobbiesStack.trailingAnchor.constraint(equalTo: aboutYouLabel.trailingAnchor).isActive = true
        
        mattersLabel.topAnchor.constraint(equalTo: hobbiesStack.bottomAnchor, constant: spacing).isActive = true
        mattersLabel.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor).isActive = true
        
        mattersLimitLabel.centerYAnchor.constraint(equalTo: mattersLabel.centerYAnchor).isActive = true
        mattersLimitLabel.leadingAnchor.constraint(equalTo: mattersLabel.trailingAnchor,
                                                   constant: CGFloat(15).generateSizeForScreen).isActive = true
        
        mattersStack.topAnchor.constraint(equalTo: mattersLabel.bottomAnchor, constant: spacing).isActive = true
        mattersStack.leadingAnchor.constraint(equalTo: hobbiesStack.leadingAnchor).isActive = true
        mattersStack.trailingAnchor.constraint(equalTo: hobbiesStack.trailingAnchor).isActive = true
        mattersStack.bottomAnchor.constraint(equalTo: viewToScroll.bottomAnchor, constant: -spacing).isActive = true
        
        let scrollView = UIScrollView()
        scrollView.addSubview(viewToScroll)
        scrollView.delegate = self
        
        editProfileViewModel.constraint(the: viewToScroll, to: scrollView.contentLayoutGuide,
                                        by: [.top, .leading, .trailing, .bottom])
        viewToScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        return ViewElements(scroll: scrollView,
                            personalDataStack: personalDataStack,
                            aboutWorkStack: aboutWorkStack,
                            hobbiesStack: hobbiesStack,
                            mattersStack: mattersStack)
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupDefaults()
        setupConstraints()
    }
    
    func setupView() {
        
        view.setToDefaultBackgroundColor()
        view.addSubviews([way, photoView, editButton, tabBar, saveButton, viewElements.scroll])
        
        editProfileViewModel.delegate = self
        editProfileViewModel.refreshUserData()
    }
    
    func setupDefaults() {
         
        saveButton.setToBottomButtonDefaultAbove("Salvar", above: tabBar)
    }
    
    func setupConstraints() {
        
        editProfileViewModel.removeMasks(of: view)
        editProfileViewModel.constraint(the: way, to: view, by: [.top, .trailing])
        way.heightAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        way.widthAnchor.constraint(equalToConstant: CGFloat(144).generateSizeForScreen).isActive = true
        
        photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoView.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: CGFloat(40).generateSizeForScreen).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: view.frame.size.height/5).isActive = true
        photoView.widthAnchor.constraint(equalTo: photoView.heightAnchor).isActive = true
        photoView.layer.cornerRadius = view.frame.size.height/10
        
        editButton.heightAnchor.constraint(equalToConstant: CGFloat(32).generateSizeForScreen).isActive = true
        editButton.widthAnchor.constraint(equalTo: editButton.heightAnchor).isActive = true
        editProfileViewModel.constraint(the: editButton, to: photoView, by: [.centerX, .centerY], view.frame.size.height/15)
        
        viewElements.scroll.topAnchor.constraint(equalTo: photoView.bottomAnchor,
                                                 constant: CGFloat(30).generateSizeForScreen).isActive = true
        viewElements.scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewElements.scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewElements.scroll.bottomAnchor.constraint(equalTo: saveButton.topAnchor).isActive = true
        
        editProfileViewModel.constraint(the: tabBar, to: view.safeAreaLayoutGuide, by: [.leading, .trailing, .bottom])
    }
    
    @objc func saveTarget() {
        
        freezeButton()
        
        editProfileViewModel.putUser()
        if editProfileViewModel.putPhoto() {
            
            print("Prosseguir")
            return
        }
    }
    
    override var prefersStatusBarHidden: Bool {true}
}

extension EditProfileView: EditProfileViewModelProtocol {
    
    func setHobbiesStack(_ hobbies: [Hobbies], userHobbies: [String]) {
        
        let buttons = editProfileViewModel.setupHobbiesButtons(hobbies,
                                                        createCapsuleButtons(editProfileViewModel.convertHobbiesToString(hobbies), .capsuleButton))
        
        let hobbiesStacks = createStackViews(buttons)
        editProfileViewModel.selectButtons(stacks: hobbiesStacks,
                                           editProfileViewModel.convertHobbiesToString(hobbies),
                                           selectedItems: userHobbies)
        viewElements.hobbiesStack.addArrangedSubviews(hobbiesStacks)
    }
    
    func setInterestsStack(_ interests: [Interests], userInterests: [String]) {
        
        let buttons = editProfileViewModel.setupInterestsButtons(interests,
                                                                 createCapsuleButtons(editProfileViewModel.convertInterestsToString(interests), .capsuleButton))
        
        let interestStacks = createStackViews(buttons)
        editProfileViewModel.selectButtons(stacks: interestStacks,
                                           editProfileViewModel.convertInterestsToString(interests),
                                           selectedItems: userInterests)
        viewElements.mattersStack.addArrangedSubviews(interestStacks)
    }
    
    func setImage(URL: URL?, placeholderImage: UIImage?) {
        
        photoView.sd_setImage(with: URL, placeholderImage: placeholderImage)
    }
    
    func setStacks(personalDataStacks: [UIStackView], aboutWorkStacks: [UIStackView]) {
        
        viewElements.personalDataStack.addArrangedSubviews(personalDataStacks)
        
        viewElements.aboutWorkStack.addArrangedSubviews(aboutWorkStacks)
    }
    
    func unfreezeButton() {
        
        saveButton.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        saveButton.addTarget(nil, action: #selector(saveTarget), for: .touchUpInside)
    }
    
    func freezeButton() {
        
        saveButton.backgroundColor = UIColor(named: ColorsBravve.buttonGray.rawValue)
        saveButton.removeTarget(nil, action: #selector(saveTarget), for: .touchUpInside)
    }
}

extension EditProfileView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}

extension EditProfileView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            DispatchQueue.main.async {self.photoView.image = pickedImage}
            
            guard let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else {return}
            
            editProfileViewModel.photo = imageURL
            unfreezeButton()
            dismiss(animated: true)
        }
    }
}
