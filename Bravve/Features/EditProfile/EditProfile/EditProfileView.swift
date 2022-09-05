//
//  EditProfileView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class EditProfileView: UIViewController {
    
    struct ViewElements {
        
        let scroll: UIScrollView, hobbiesStack: UIStackView, mattersStack: UIStackView
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
    
    private let editButton: UIButton = {
        
        let editButton = UIButton()
        editButton.setImage(UIImage(named: IconsBravve.photoBlue.rawValue),
                            for: .normal)
        
        return editButton
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
            
            let numberStack = editProfileViewModel.createStackView(labelText: "Número",
                                              textFieldText: "+55 11 95585-1111",
                                              textFieldTextColor: .gray)
            
            let emailStack = editProfileViewModel.createStackView(labelText: "Email",
                                             textFieldText: "ana.maria@teste.com.br",
                                             textFieldTextColor: .gray)
            
            let nameStack = editProfileViewModel.createStackView(labelText: "Nome Completo",
                                            textFieldText: "Ana Maria Silva",
                                            buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let passwordStack = editProfileViewModel.createStackView(labelText: "Senha",
                                                textFieldText: "1234567",
                                                isSecureTextEntry: true,
                                                buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let personalDataStack = UIStackView(arrangedSubviews: [numberStack, emailStack, nameStack, passwordStack])
            editProfileViewModel.setupStack(personalDataStack)
            
            return personalDataStack
        }()
        
        let aboutWorkLabel = editProfileViewModel.createLabel("Sobre seu trabalho")
        
        let aboutWorkStack: UIStackView = {
            
            let officeStack = editProfileViewModel.createStackView(labelText: "Área",
                                              textFieldText: "Marketing",
                                              buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let workRegimeStack = editProfileViewModel.createStackView(labelText: "Regime de trabalho",
                                              textFieldText: "Pessoa Juridica",
                                              buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let aboutWorkStack = UIStackView(arrangedSubviews: [officeStack, workRegimeStack])
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
        
        editProfileViewModel.constraint(the: viewToScroll, to: scrollView.contentLayoutGuide,
                                        by: [.top, .leading, .trailing, .bottom])
        viewToScroll.constraintInsideTo(.width, scrollView.frameLayoutGuide)
        
        return ViewElements(scroll: scrollView,
                            hobbiesStack: hobbiesStack,
                            mattersStack: mattersStack)
    }()
    
    private lazy var tabBar = TabBarClosed(self)
    
    private let saveButton = UIButton()
    
    let editProfileViewModel = EditProfileViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        setupDefaults()
        setupConstraints()
    }
    
    func setupView() {
        
        view.setToDefaultBackgroundColor()
        view.addSubviews([way, photoView, editButton, tabBar, saveButton, viewElements.scroll])
        
        editProfileViewModel.removeMasks(of: view)
        editProfileViewModel.delegate = self
        
        editProfileViewModel.setupHobbies()
        editProfileViewModel.setupMatters()
    }
    
    func setupDefaults() {
         
        saveButton.setToBottomButtonDefaultAbove("Salvar", above: tabBar)
    }
    
    func setupConstraints() {
        
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
    
    override var prefersStatusBarHidden: Bool {true}
}

extension EditProfileView: EditProfileViewModelProtocol {
    
    func setHobbiesStack(_ hobbies: [String]) {
        
        let hobbiesStacks = editProfileViewModel.createStackViews(createCapsuleButtons(hobbies))
        viewElements.hobbiesStack.addArrangedSubviews(hobbiesStacks)
    }
    
    func setMattersStack(_ matters: [String]) {
        
        let mattersStacks = editProfileViewModel.createStackViews(createCapsuleButtons(matters))
        viewElements.mattersStack.addArrangedSubviews(mattersStacks)
    }
}
