//
//  PerfilPessoalView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit
import SwiftUI
import SDWebImage

//MARK: TabBar

class PersonalProfileView: UIViewController{
    
    var alertEmailDidTapButton: (() -> Void)?
    
    lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    //MARK: SessionManager
    
    private let sessionManager = SessionManager()
    
    var uuid: String {
        guard let uuid = UserDefaults.standard.string(forKey: "userUUID") else {
            print("Unable to get user uuid")
            return ""
        }
        return uuid
    }
    
    //MARK: wayImage
    
    private lazy var wayImage: UIImageView = {
        let image = UIImageView()
        image.setWayToDefault(.wayPassword)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: profilePic
    
    private lazy var profilePic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImagesBravve.photo.rawValue)
        image.layer.masksToBounds = false
        image.layer.cornerRadius = 61
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: userEditIcon
    
    private lazy var userEditIconPic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.user.rawValue)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: InfoCircle
    
    private lazy var infoCircleIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.info_circle.rawValue)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: HelloLabel
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Ana!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(30).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        return label
    }()
    
    //MARK: SubtitleLabel
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ana.maria@teste.com.br"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(16).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.black_black.rawValue)
        return label
    }()
    
    //MARK: myWallet
    
    private lazy var myWallet: UILabel = {
        let label = UILabel()
        label.text = "Minha carteira"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(14).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    //MARK: personalAccount
    
    private lazy var personalAccount: UILabel = {
        let label = UILabel()
        label.text = "Conta pessoal"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    //MARK: changeWalletButton
    
    private lazy var changeWalletButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alternar carteira", for: .normal)
        button.titleLabel?.font = UIFont(name: FontsBravve.medium.rawValue , size: 13)
        button.setTitleColor(UIColor(named: ColorsBravve.buttonPink.rawValue), for: .normal)
        button.addTarget(self, action: #selector(changeWalletTap), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //MARK: createMyUiView
    
    private lazy var createMyUiView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 0.3
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: EditProfile
    
    private lazy var editProfile: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 16)
        label.text = "Editar perfil"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    //MARK: backView
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(named: "borderAccounts")?.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: separatorView
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorsBravve.gray_gray.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor =  UIColor(named: "borderAccounts")?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: helpLabel
    
    private lazy var helpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ajuda"
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: 16)
        return label
    }()
    
    //MARK: nextPageButton
    
    private lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowProfile.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: separatorView2
    
    private lazy var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: nextPageButton2
    
    private lazy var nextPageButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ButtonsBravve.arrowProfile.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: separatorView3
    
    private lazy var separatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: bookIcon
    
    private lazy var bookIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.book.rawValue)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: policyLabel
    
    private lazy var policyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Política e Termos de uso"
        label.font = UIFont(name: FontsBravve.regular.rawValue , size: 16)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    //MARK: historyIcon
    
    private lazy var historyIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "historyClock")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: bookHistoryLabel
    
    private lazy var bookHistoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Histórico de reservas"
        label.font = UIFont(name: FontsBravve.regular.rawValue , size: 16)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        return label
    }()
    
    //MARK: nextPageButton3
    
    private lazy var nextPageButton3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowProfile.rawValue), for: .normal)
        return button
    }()
    
    //MARK: separatorView4
    
    private lazy var separatorView4: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    //MARK: logouButton
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(goOutPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: logoutImage
    
    private lazy var logoutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: IconsBravve.exitProfile.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: nextPageButton4
    
    private lazy var nextPageButton4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ButtonsBravve.arrowProfile.rawValue), for: .normal)
        return button
    }()
    
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    
    //MARK: viewDidLoad
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[2]
    }
    
    //MARK: - loadView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userData()
        
        tabBar.selectedItem = tabBar.items?[2]
        
        view.backgroundColor = UIColor(named: "background")
        view.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [self] in view.isHidden = false
      }
        
        view.addSubviews([ wayImage, profilePic, helloLabel, subtitleLabel, createMyUiView,myWallet,changeWalletButton,personalAccount, userEditIconPic, editProfile ,backView, infoCircleIcon ,bookHistoryLabel , separatorView, helpLabel, nextPageButton, separatorView2, nextPageButton2, separatorView3, bookIcon, policyLabel,nextPageButton3, separatorView4, historyIcon, logoutButton, logoutImage, nextPageButton4,tabBar])
        self.navigationController?.isNavigationBarHidden = true
        nextPageButton.addTarget(self, action: #selector(editProfileTap), for: .touchUpInside)
        nextPageButton2.addTarget(self, action: #selector(helpTap), for: .touchUpInside)
        nextPageButton3.addTarget(self, action: #selector(policyPage), for: .touchUpInside)
        nextPageButton4.addTarget(self, action: #selector(bookingHistory), for: .touchUpInside)
        addConstraints()
    }
    
    //MARK: userData
    
    func userData() {
        
        sessionManager.getData(uuid: uuid, endpoint: .usersUuid){ (statusCode, error, user: User?) in
            
            guard let user = user else {
                print(user?.message as Any)
                print(statusCode as Any)
                print(error?.localizedDescription as Any)
                return
            }
            
            DispatchQueue.main.async {
                self.subtitleLabel.text = user.email
                
                guard let userName = user.name else {return}
                let firstName = String(userName.split(separator: " ")[0])
                
                self.helloLabel.text = "Olá, \(firstName)!"
                
            }
        }
        
        sessionManager.getDataArray(uuid: uuid, endpoint: .usersPictures) { (statusCode, error, pictures: [Pictures]?) in
            
            guard let pictures = pictures else {
                print(statusCode as Any)
                return
            }
            
            if !pictures.isEmpty {
                
                guard let pictureUuid = pictures[0].picture else {
                    print(pictures[0].message as Any)
                    return
                }
                
                self.sessionManager.getData(uuid: self.uuid, picture: pictureUuid, endpoint: .usersPicture) { (statusCode, error, pictureURL: PictureURL?) in
                    
                    guard let pictureURL = pictureURL?.picture_url else {
                        print(pictureURL?.message as Any)
                        print(statusCode as Any)
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.profilePic.sd_setImage(with: URL(string: pictureURL), placeholderImage: UIImage(named: "photo"))
                    }
                    
                }
            }
            
        }
    }
    
    //MARK: Objc funcs
    
    @objc func changeWalletTap(){
        
        let popUp = PersonalProfilePopupView()
        popUp.modalPresentationStyle = .popover
        self.present(popUp,animated: true)
        
    }
    
    func setAccount(){
        myWallet.text = "Foursys"
        personalAccount.text = "Conta corporativa"
        
    }
    
    
    @objc func editProfileTap(){
        
        let editProfileTap = EditProfileView()
        editProfileTap.modalPresentationStyle = .fullScreen
        self.present(editProfileTap, animated: true)
        
    }
    
    @objc func helpTap(sender: UIButton){
        let vc = HelpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func policyPage(sender: UIButton){
        let vc = TermsAndConditionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func bookingHistory(sender: UIButton){
        let vc = BookingHistoryView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func goOutPage(sender: UIButton){
        let vc = HomeOpenView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    //MARK: setupConstraints
    
    func addConstraints(){
        
        NSLayoutConstraint.activate([
            wayImage.topAnchor.constraint(equalTo: view.topAnchor),
            wayImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            profilePic.topAnchor.constraint(equalTo: view.topAnchor,constant: 39),
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePic.widthAnchor.constraint(equalToConstant: 121),
            profilePic.heightAnchor.constraint(equalToConstant: 121),
            
            helloLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor,constant: 7),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor,constant: 13),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: subtitleLabel.topAnchor,constant: -22),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -43),
            logoutButton.widthAnchor.constraint(equalToConstant: 23),
            logoutButton.heightAnchor.constraint(equalToConstant: 17),
            
            logoutImage.centerXAnchor.constraint(equalTo: logoutButton.centerXAnchor),
            logoutImage.centerYAnchor.constraint(equalTo: logoutButton.centerYAnchor),
            logoutImage.widthAnchor.constraint(equalToConstant: 23),
            logoutImage.heightAnchor.constraint(equalToConstant: 17),
            
            createMyUiView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,constant: 37),
            createMyUiView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            createMyUiView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            createMyUiView.heightAnchor.constraint(equalToConstant: 82),
            
            
            myWallet.topAnchor.constraint(equalTo: createMyUiView.topAnchor,constant: 21),
            myWallet.leadingAnchor.constraint(equalTo: createMyUiView.leadingAnchor,constant: 22),
            
            personalAccount.leadingAnchor.constraint(equalTo: myWallet.leadingAnchor),
            personalAccount.topAnchor.constraint(equalTo: myWallet.bottomAnchor,constant: 9),
            
            changeWalletButton.topAnchor.constraint(equalTo: createMyUiView.topAnchor,constant: 33),
            changeWalletButton.trailingAnchor.constraint(equalTo: createMyUiView.trailingAnchor,constant: -32),
            
            
            userEditIconPic.topAnchor.constraint(equalTo: createMyUiView.bottomAnchor,constant: 37),
            userEditIconPic.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 33),
            userEditIconPic.widthAnchor.constraint(equalToConstant: 15),
            userEditIconPic.heightAnchor.constraint(equalToConstant: 15),
            
            editProfile.centerYAnchor.constraint(equalTo: userEditIconPic.centerYAnchor),
            editProfile.leadingAnchor.constraint(equalTo: userEditIconPic.trailingAnchor,constant: 13),
            
            
            nextPageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -37),
            nextPageButton.topAnchor.constraint(equalTo: createMyUiView.bottomAnchor,constant: 35),
            nextPageButton.widthAnchor.constraint(equalToConstant: 20),
            nextPageButton.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView.topAnchor.constraint(equalTo: editProfile.bottomAnchor,constant: 16),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            infoCircleIcon.topAnchor.constraint(equalTo: separatorView.bottomAnchor,constant: 25),
            infoCircleIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 33),
            infoCircleIcon.widthAnchor.constraint(equalToConstant: 15),
            infoCircleIcon.heightAnchor.constraint(equalToConstant: 15),
            
            helpLabel.leadingAnchor.constraint(equalTo: infoCircleIcon.trailingAnchor,constant: 13),
            helpLabel.centerYAnchor.constraint(equalTo: infoCircleIcon.centerYAnchor),
            
            nextPageButton2.centerXAnchor.constraint(equalTo: nextPageButton.centerXAnchor),
            nextPageButton2.topAnchor.constraint(equalTo: separatorView.bottomAnchor,constant: 22),
            nextPageButton2.widthAnchor.constraint(equalToConstant: 20),
            nextPageButton2.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView2.topAnchor.constraint(equalTo: helpLabel.bottomAnchor,constant: 21),
            separatorView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            separatorView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            separatorView2.heightAnchor.constraint(equalToConstant: 1),
            
            bookIcon.topAnchor.constraint(equalTo: separatorView2.bottomAnchor,constant: 16),
            bookIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 33),
            bookIcon.widthAnchor.constraint(equalToConstant: 14),
            bookIcon.heightAnchor.constraint(equalToConstant: 16),
            
            policyLabel.leadingAnchor.constraint(equalTo: bookIcon.trailingAnchor,constant: 13),
            policyLabel.centerYAnchor.constraint(equalTo: bookIcon.centerYAnchor),
            
            nextPageButton3.centerXAnchor.constraint(equalTo: nextPageButton.centerXAnchor),
            nextPageButton3.topAnchor.constraint(equalTo: separatorView2.bottomAnchor,constant: 22),
            nextPageButton3.widthAnchor.constraint(equalToConstant: 20),
            nextPageButton3.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView3.topAnchor.constraint(equalTo: policyLabel.bottomAnchor,constant: 21),
            separatorView3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            separatorView3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            separatorView3.heightAnchor.constraint(equalToConstant: 1),
            
            historyIcon.topAnchor.constraint(equalTo: separatorView3.bottomAnchor,constant: 22),
            historyIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 33),
            historyIcon.widthAnchor.constraint(equalToConstant: 14),
            historyIcon.heightAnchor.constraint(equalToConstant: 16),
            
            bookHistoryLabel.leadingAnchor.constraint(equalTo: historyIcon.trailingAnchor,constant: 13),
            bookHistoryLabel.centerYAnchor.constraint(equalTo: historyIcon.centerYAnchor),
            
            nextPageButton4.centerXAnchor.constraint(equalTo: nextPageButton.centerXAnchor),
            nextPageButton4.topAnchor.constraint(equalTo: separatorView3.bottomAnchor,constant: 22),
            nextPageButton4.widthAnchor.constraint(equalToConstant: 20),
            nextPageButton4.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView4.topAnchor.constraint(equalTo: bookHistoryLabel.bottomAnchor,constant: 21),
            separatorView4.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            separatorView4.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            separatorView4.heightAnchor.constraint(equalToConstant: 1),
            
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //MARK: popUpChangeWallet
    
    class PersonalProfilePopupView: UIViewController, UIGestureRecognizerDelegate{
        
        //MARK: viewElements
        
        //MARK: ExpansionView
        
        private lazy var createMyExpansionUiView: UIView = {
            let view = UIView()
            view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
            view.layer.borderWidth = 0.3
            view.layer.cornerRadius = 12
            view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private lazy var myAccounts: UILabel = {
            let label = UILabel()
            label.text = "Minhas contas"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.medium.rawValue, size: 18)
            label.textColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            return label
        }()
        
        private lazy var walletIcon: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: IconsBravve.wallet.rawValue)
            image.contentMode = .scaleToFill
            image.clipsToBounds = true
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        private lazy var myWalletPopup: UILabel = {
            let label = UILabel()
            label.text = "Minha carteira"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(14).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            return label
        }()
        
        private lazy var personalAccountPopup: UILabel = {
            let label = UILabel()
            label.text = "Conta pessoal"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.label.rawValue)
            return label
        }()
        
        
        private lazy var infoWalletLabel: UILabel = {
            let label = UILabel()
            label.text = "Foursys"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
            return label
        }()
        
        private lazy var subInfoWalletLabel: UILabel = {
            let label = UILabel()
            label.text = "Conta corporativa"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
            return label
        }()
        
        private lazy var bravveInfoLabel: UILabel = {
            let label = UILabel()
            label.text = "Bravve"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.medium.rawValue, size: CGFloat(13).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
            return label
        }()
        
        private lazy var subBravveInfoLabel: UILabel = {
            let label = UILabel()
            label.text = "Conta corporativa"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
            label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
            return label
        }()
        
        private lazy var numberCreditsLabel: UILabel = {
            let label = UILabel()
            let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.pink_cyan.rawValue)]
            let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
            
            let atritutedString1 = NSMutableAttributedString(string: "112 ", attributes: attrs1 as [NSAttributedString.Key : Any])
            let atritutedString2 = NSMutableAttributedString(string: " Créditos", attributes: attrs2 as [NSAttributedString.Key : Any])
            
            atritutedString1.append(atritutedString2)
            
            label.attributedText = atritutedString1
            label.layer.borderWidth = 0.3
            label.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private lazy var numberCreditsLabel2: UILabel = {
            let label = UILabel()
            let attrs1 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.medium.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.pink_cyan.rawValue)]
            let attrs2 = [NSAttributedString.Key.font : UIFont(name: FontsBravve.regular.rawValue, size: 12), NSAttributedString.Key.foregroundColor : UIColor(named: ColorsBravve.label.rawValue)]
            
            let atritutedString1 = NSMutableAttributedString(string: "312 ", attributes: attrs1 as [NSAttributedString.Key : Any])
            let atritutedString2 = NSMutableAttributedString(string: " Créditos", attributes: attrs2 as [NSAttributedString.Key : Any])
            
            atritutedString1.append(atritutedString2)
            
            label.attributedText = atritutedString1
            label.layer.borderWidth = 0.3
            label.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private lazy var lineView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
            view.layer.borderWidth = 1
            return view
        }()
        
        private lazy var lineView2: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderColor = UIColor(named: ColorsBravve.gray_gray.rawValue)?.cgColor
            view.layer.borderWidth = 1
            return view
        }()
        
        private lazy var buttonSelectWallet: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(dismissPopUpAndSelectWallet), for: .touchUpInside)
            return button
        }()
        
        private lazy var buttonSelectWallet2: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(dismissPopUpAndSelectWallet2), for: .touchUpInside)
            return button
        }()
        
        //MARK: popUpViewDidLoad
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
                   viewTapGesture.delegate = self
                   view.addGestureRecognizer(viewTapGesture)
            
            view.backgroundColor = .clear
            view.addSubviews([createMyExpansionUiView,walletIcon,myAccounts,myWalletPopup,personalAccountPopup,infoWalletLabel,subInfoWalletLabel,bravveInfoLabel,subBravveInfoLabel,numberCreditsLabel,numberCreditsLabel2,lineView,lineView2,buttonSelectWallet,buttonSelectWallet2])
            setupConstraints()
            
            
            
        }
        
        //MARK: Objc Funcs PopUp
        
        @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
            dismiss(animated: true)
            }
        
        @objc func dismissPopUpAndSelectWallet(){
            
            setValor1()
//            self.dismiss(animated: true)
            
        }
        
        func setValor1(){
            
            let enterProfileElements = PersonalProfileView()
            enterProfileElements.myWallet.text! = "Foursys"
            enterProfileElements.personalAccount.text! = "Conta corporativa"
            myWalletPopup.text = "Foursys"
            personalAccountPopup.text = "Conta corporativa"
            
        }
        
        func setValor2(){
            
            let enterProfileElements = PersonalProfileView()
            enterProfileElements.myWallet.text! = "Bravve"
            enterProfileElements.personalAccount.text! = "Conta corporativa"
            myWalletPopup.text = "Bravve"
            personalAccountPopup.text = "Conta corporativa"
            
        }
        
        @objc func dismissPopUpAndSelectWallet2(){
            
            setValor2()
//            self.dismiss(animated: true)
            
        }
        
        //MARK: setupConstraints PopUp
        
        private func setupConstraints(){
            NSLayoutConstraint.activate([
                
                createMyExpansionUiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                createMyExpansionUiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                createMyExpansionUiView.widthAnchor.constraint(equalToConstant: 334),
                createMyExpansionUiView.heightAnchor.constraint(equalToConstant: 330),
                
                walletIcon.leadingAnchor.constraint(equalTo: createMyExpansionUiView.leadingAnchor,constant: 22.03),
                walletIcon.topAnchor.constraint(equalTo: createMyExpansionUiView.topAnchor,constant: 22),
                walletIcon.widthAnchor.constraint(equalToConstant: 19),
                walletIcon.heightAnchor.constraint(equalToConstant: 19),
                
                myAccounts.leadingAnchor.constraint(equalTo: walletIcon.leadingAnchor),
                myAccounts.topAnchor.constraint(equalTo: walletIcon.bottomAnchor,constant: 14),
                
                myWalletPopup.centerXAnchor.constraint(equalTo: createMyExpansionUiView.centerXAnchor),
                myWalletPopup.topAnchor.constraint(equalTo: myAccounts.bottomAnchor,constant: 21),
                
                personalAccountPopup.centerXAnchor.constraint(equalTo: myWalletPopup.centerXAnchor),
                personalAccountPopup.topAnchor.constraint(equalTo: myWalletPopup.bottomAnchor,constant: 9),
                
                lineView.topAnchor.constraint(equalTo: personalAccountPopup.bottomAnchor,constant: 22),
                lineView.leadingAnchor.constraint(equalTo: createMyExpansionUiView.leadingAnchor,constant: 17),
                lineView.trailingAnchor.constraint(equalTo: createMyExpansionUiView.trailingAnchor,constant: -17),
                lineView.heightAnchor.constraint(equalToConstant: 1),
                
                infoWalletLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 22),
                infoWalletLabel.leadingAnchor.constraint(equalTo: walletIcon.leadingAnchor),
                
                numberCreditsLabel.trailingAnchor.constraint(equalTo: createMyExpansionUiView.trailingAnchor,constant: -31),
                numberCreditsLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 36),
                
                subInfoWalletLabel.leadingAnchor.constraint(equalTo: walletIcon.leadingAnchor),
                subInfoWalletLabel.topAnchor.constraint(equalTo: infoWalletLabel.bottomAnchor,constant: 9),
                
                lineView2.topAnchor.constraint(equalTo: subInfoWalletLabel.bottomAnchor,constant: 22),
                lineView2.leadingAnchor.constraint(equalTo: createMyExpansionUiView.leadingAnchor,constant: 17),
                lineView2.trailingAnchor.constraint(equalTo: createMyExpansionUiView.trailingAnchor,constant: -17),
                lineView2.heightAnchor.constraint(equalToConstant: 1),
                
                bravveInfoLabel.leadingAnchor.constraint(equalTo: walletIcon.leadingAnchor),
                bravveInfoLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 22),
                
                subBravveInfoLabel.leadingAnchor.constraint(equalTo: walletIcon.leadingAnchor),
                subBravveInfoLabel.topAnchor.constraint(equalTo: bravveInfoLabel.bottomAnchor,constant: 9),
                
                numberCreditsLabel2.topAnchor.constraint(equalTo: lineView2.bottomAnchor,constant: 30),
                numberCreditsLabel2.centerXAnchor.constraint(equalTo: numberCreditsLabel.centerXAnchor),
                
                buttonSelectWallet.topAnchor.constraint(equalTo: lineView.bottomAnchor),
                buttonSelectWallet.leadingAnchor.constraint(equalTo: createMyExpansionUiView.leadingAnchor),
                buttonSelectWallet.trailingAnchor.constraint(equalTo: createMyExpansionUiView.trailingAnchor),
                buttonSelectWallet.bottomAnchor.constraint(equalTo: lineView2.topAnchor),
                
                buttonSelectWallet2.topAnchor.constraint(equalTo: lineView2.bottomAnchor),
                buttonSelectWallet2.leadingAnchor.constraint(equalTo: createMyExpansionUiView.leadingAnchor),
                buttonSelectWallet2.trailingAnchor.constraint(equalTo: createMyExpansionUiView.trailingAnchor),
                buttonSelectWallet2.bottomAnchor.constraint(equalTo: subBravveInfoLabel.bottomAnchor),
                
                
                
                
            ])
        }
    }
    
    
}







