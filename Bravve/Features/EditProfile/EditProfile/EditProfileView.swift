//
//  ProfileEditingView.swift
//  Teste
//
//  Created by Josicleison on 01/09/22.
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
            
            let numberStack = editProfileViewModel.createFieldStackView(labelText: "Número",
                                              textFieldText: "+55 11 95585-1111",
                                              textFieldTextColor: .gray)
            
            let emailStack = editProfileViewModel.createFieldStackView(labelText: "Email",
                                             textFieldText: "ana.maria@teste.com.br",
                                             textFieldTextColor: .gray)
            
            let nameStack = editProfileViewModel.createFieldStackView(labelText: "Nome Completo",
                                            textFieldText: "Ana Maria Silva",
                                            buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let passwordStack = editProfileViewModel.createFieldStackView(labelText: "Senha",
                                                textFieldText: "1234567",
                                                isSecureTextEntry: true,
                                                buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let personalDataStack = UIStackView(arrangedSubviews: [numberStack, emailStack, nameStack, passwordStack])
            editProfileViewModel.setupStack(personalDataStack)
            
            return personalDataStack
        }()
        
        let aboutWorkLabel = editProfileViewModel.createLabel("Sobre seu trabalho")
        
        let aboutWorkStack: UIStackView = {
            
            let officeStack = editProfileViewModel.createFieldStackView(labelText: "Área",
                                              textFieldText: "Marketing",
                                              buttonImage: UIImage(named: IconsBravve.edit_blue.rawValue))
            
            let workRegimeStack = editProfileViewModel.createFieldStackView(labelText: "Regime de trabalho",
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
        
        backButton.constraintInsideTo(.top, viewToScroll)
        backButton.constraintInsideTo(.leading, viewToScroll, CGFloat(25).generateSizeForScreen)
        
        personalDataLabel.constraintOutsideTo(.top, backButton,
                                              CGFloat(25).generateSizeForScreen)
        personalDataLabel.constraintInsideTo(.leading, backButton,
                                             CGFloat(5).generateSizeForScreen)
        personalDataLabel.constraintInsideTo(.trailing, viewToScroll,
                                             CGFloat(30).generateSizeForScreen)
        
        personalDataStack.constraintOutsideTo(.top, personalDataLabel,
                                              CGFloat(15).generateSizeForScreen)
        personalDataStack.constraintInsideTo(.leading, personalDataLabel)
        personalDataStack.constraintInsideTo(.trailing, personalDataLabel)
        
        aboutWorkLabel.constraintOutsideTo(.top, personalDataStack,
                                           CGFloat(35).generateSizeForScreen)
        aboutWorkLabel.constraintInsideTo(.leading, personalDataStack)
        aboutWorkLabel.constraintInsideTo(.trailing, personalDataStack)
        
        aboutWorkStack.constraintOutsideTo(.top, aboutWorkLabel,
                                           CGFloat(15).generateSizeForScreen)
        aboutWorkStack.constraintInsideTo(.leading, aboutWorkLabel)
        aboutWorkStack.constraintInsideTo(.trailing, aboutWorkLabel)
        
        aboutYouLabel.constraintOutsideTo(.top, aboutWorkStack,
                                          CGFloat(15).generateSizeForScreen)
        aboutYouLabel.constraintInsideTo(.leading, aboutWorkStack)
        aboutYouLabel.constraintInsideTo(.trailing, aboutWorkStack)
        
        hobbiesLabel.constraintOutsideTo(.top, aboutYouLabel,
                                         CGFloat(15).generateSizeForScreen)
        hobbiesLabel.constraintInsideTo(.leading, aboutYouLabel,
                                        CGFloat(5).generateSizeForScreen)
        
        hobbiesLimitLabel.constraintInsideTo(.centerY, hobbiesLabel)
        hobbiesLimitLabel.constraintOutsideTo(.leading, hobbiesLabel,
                                              CGFloat(15).generateSizeForScreen)
        
        hobbiesStack.constraintOutsideTo(.top, hobbiesLabel,
                                         CGFloat(15).generateSizeForScreen)
        hobbiesStack.constraintInsideTo(.leading, aboutYouLabel)
        hobbiesStack.constraintInsideTo(.trailing, aboutYouLabel)
        
        mattersLabel.constraintOutsideTo(.top, hobbiesStack,
                                         CGFloat(15).generateSizeForScreen)
        mattersLabel.constraintInsideTo(.leading, personalDataStack)
        
        mattersLimitLabel.constraintInsideTo(.centerY, mattersLabel)
        mattersLimitLabel.constraintOutsideTo(.leading, mattersLabel,
                                              CGFloat(15).generateSizeForScreen)
        
        mattersStack.constraintOutsideTo(.top, mattersLabel,
                                         CGFloat(15).generateSizeForScreen)
        mattersStack.constraintInsideTo(.leading, hobbiesStack)
        mattersStack.constraintInsideTo(.trailing, hobbiesStack)
        mattersStack.constraintInsideTo(.bottom, viewToScroll,
                                        CGFloat(15).generateSizeForScreen)
        
        let scrollView = UIScrollView()
        scrollView.addSubview(viewToScroll)
        
        viewToScroll.constraintInsideTo(.top, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.leading, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.trailing, scrollView.contentLayoutGuide)
        viewToScroll.constraintInsideTo(.bottom, scrollView.contentLayoutGuide)
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
        
        editProfileViewModel.delegate = self
        
        editProfileViewModel.setupHobbies()
        editProfileViewModel.setupMatters()
    }
    
    func setupDefaults() {
         
        saveButton.setToBottomButtonDefaultAbove("Salvar", above: tabBar)
    }
    
    func setupConstraints() {
        
        way.constraintInsideTo(.top, view)
        way.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        way.heightAnchorInSuperview(CGFloat(150).generateSizeForScreen)
        way.widthAnchorInSuperview(CGFloat(144).generateSizeForScreen)
        
        photoView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        photoView.constraintInsideTo(.top, view,
                                     CGFloat(40).generateSizeForScreen)
        photoView.sizeAnchorInSuperview(view.frame.size.height/5)
        photoView.layer.cornerRadius = view.frame.size.height/10
        
        editButton.sizeAnchorInSuperview(CGFloat(32).generateSizeForScreen)
        editButton.constraintInsideTo(.centerX, photoView, view.frame.size.height/15)
        editButton.constraintInsideTo(.centerY, photoView, view.frame.size.height/15)
        
        viewElements.scroll.constraintOutsideTo(.top, photoView,
                                       CGFloat(30).generateSizeForScreen)
        viewElements.scroll.constraintInsideTo(.leading, view)
        viewElements.scroll.constraintInsideTo(.trailing, view)
        viewElements.scroll.constraintOutsideTo(.bottom, saveButton)
        
        tabBar.constraintInsideTo(.leading, view)
        tabBar.constraintInsideTo(.trailing, view)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
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
