//
//  PerfilPessoalView.swift
//  Bravve
//
//  Created by user218260 on 7/15/22.
//

import UIKit

class PersonalProfileView: UIViewController{
    
    let newView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let wayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wayName")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let profilePic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Ana!"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(30).generateSizeForScreen)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ana.maria@teste.com.br"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(red: 1, green: 0.125, blue: 0.475, alpha: 0.1).cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        return view
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Foursys"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        return label
    }()
    
    let subInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = .gray
        return label
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        view.layer.borderColor = UIColor(red: 1, green: 0.125, blue: 0.475, alpha: 0.1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let bravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Bravve"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(13).generateSizeForScreen)
        return label
    }()
    
    let subBravveInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta corporativa"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(10).generateSizeForScreen)
        label.textColor = .gray
        return label
    }()
    
    let infoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "info-circle")
        return image
    }()
    
    let reservationLabel: UILabel = {
        let label = UILabel()
        label.text = "Histórico de reservas"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()
    
    let nextPageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backBlue2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let helpImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "info-circle")
        image.tintColor = UIColor(named: "NewBlue")
        return image
    }()
    
    let helpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ajuda"
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(16).generateSizeForScreen)
        return label
    }()
    
    let nextPageButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backBlue2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var separatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Background")
        view.layer.borderColor = UIColor(red: 0.612, green: 0.643, blue: 0.671, alpha: 0.3).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let policyLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "text.book.closed")
        image.tintColor = UIColor(named: "NewBlue")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([scrollView, wayImage, profilePic, helloLabel, subtitleLabel, backView, infoLabel, subInfoLabel, separatorView, bravveInfoLabel, subBravveInfoLabel, infoImage, reservationLabel, nextPageButton, separatorView2, helpImage, helpLabel, nextPageButton2, separatorView3])
        scrollView.addSubviews([newView])
        
        addConstraints()
    }
    
    func addConstraints(){
        scrollView.constraintInsideTo(.centerX, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.width, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.top, view.safeAreaLayoutGuide)
        scrollView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
                
        newView.constraintInsideTo(.centerX, scrollView)
        newView.heightAnchor.constraint(equalToConstant: CGFloat(700).generateSizeForScreen).isActive = true
        newView.constraintInsideTo(.width, scrollView)
        newView.constraintInsideTo(.top, scrollView)
        newView.constraintInsideTo(.bottom, scrollView)
        
        wayImage.setWayToDefault(.wayName)
        
        profilePic.widthAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        profilePic.heightAnchor.constraint(equalToConstant: CGFloat(50).generateSizeForScreen).isActive = true
        profilePic.constraintInsideTo(.centerX, newView.safeAreaLayoutGuide)
        profilePic.constraintInsideTo(.top, newView.safeAreaLayoutGuide)
        
        helloLabel.constraintInsideTo(.centerX, newView.safeAreaLayoutGuide)
        helloLabel.constraintOutsideTo(.top, profilePic, CGFloat(15).generateSizeForScreen)
        helloLabel.heightAnchor.constraint(equalToConstant: CGFloat(60).generateSizeForScreen).isActive = true
        
        subtitleLabel.constraintInsideTo(.centerX, newView.safeAreaLayoutGuide)
        subtitleLabel.constraintOutsideTo(.top, helloLabel, CGFloat(10).generateSizeForScreen)
        subtitleLabel.heightAnchor.constraint(equalToConstant: CGFloat(18.13).generateSizeForScreen).isActive = true
        
        backView.constraintOutsideTo(.top, subtitleLabel, CGFloat(40).generateSizeForScreen)
        backView.constraintInsideTo(.left, newView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        backView.constraintInsideTo(.right, newView.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        backView.heightAnchor.constraint(equalToConstant: CGFloat(150).generateSizeForScreen).isActive = true
        
        infoLabel.constraintInsideTo(.top, backView, CGFloat(20).generateSizeForScreen)
        infoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        infoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subInfoLabel.constraintOutsideTo(.top, infoLabel, CGFloat(10).generateSizeForScreen)
        subInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        subInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView.constraintInsideTo(.right, backView, CGFloat(-20).generateSizeForScreen)
        separatorView.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        separatorView.constraintInsideTo(.top, backView, CGFloat(75).generateSizeForScreen)
        
        bravveInfoLabel.constraintOutsideTo(.top, separatorView, CGFloat(15).generateSizeForScreen)
        bravveInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        bravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        subBravveInfoLabel.constraintOutsideTo(.top, bravveInfoLabel, CGFloat(10).generateSizeForScreen)
        subBravveInfoLabel.constraintInsideTo(.left, backView, CGFloat(20).generateSizeForScreen)
        subBravveInfoLabel.heightAnchor.constraint(equalToConstant: CGFloat(15).generateSizeForScreen).isActive = true
        
        infoImage.constraintOutsideTo(.top, backView, CGFloat(38).generateSizeForScreen)
        infoImage.constraintInsideTo(.left, newView.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        infoImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        reservationLabel.constraintOutsideTo(.top, backView, CGFloat(38).generateSizeForScreen)
        reservationLabel.constraintOutsideTo(.left, infoImage, CGFloat(27).generateSizeForScreen)
        reservationLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton.constraintInsideTo(.right, newView.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton.constraintOutsideTo(.top, backView, CGFloat(35).generateSizeForScreen)
        nextPageButton.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView2.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView2.constraintInsideTo(.right, newView.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView2.constraintInsideTo(.left, newView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView2.constraintOutsideTo(.top, reservationLabel, CGFloat(20).generateSizeForScreen)

        helpImage.constraintOutsideTo(.top, separatorView2, CGFloat(25).generateSizeForScreen)
        helpImage.constraintInsideTo(.left, newView.safeAreaLayoutGuide, CGFloat(33).generateSizeForScreen)
        helpImage.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        helpImage.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        helpLabel.constraintOutsideTo(.top, separatorView2, CGFloat(25).generateSizeForScreen)
        helpLabel.constraintOutsideTo(.left, helpImage, CGFloat(27).generateSizeForScreen)
        helpLabel.heightAnchor.constraint(equalToConstant: CGFloat(17).generateSizeForScreen).isActive = true
        
        nextPageButton2.constraintInsideTo(.right, newView.safeAreaLayoutGuide, CGFloat(-33).generateSizeForScreen)
        nextPageButton2.constraintOutsideTo(.top, separatorView2, CGFloat(22).generateSizeForScreen)
        nextPageButton2.heightAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        nextPageButton2.widthAnchor.constraint(equalToConstant: CGFloat(20).generateSizeForScreen).isActive = true
        
        separatorView3.heightAnchor.constraint(equalToConstant: CGFloat(2).generateSizeForScreen).isActive = true
        separatorView3.constraintInsideTo(.right, newView.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        separatorView3.constraintInsideTo(.left, newView.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        separatorView3.constraintOutsideTo(.top, helpLabel, CGFloat(20).generateSizeForScreen)
    }
}
