
//
//  CheckOutScreen.swift
//  Teste
//
//  Created by user217685 on 8/3/22.
//

import UIKit

class CheckOutView: UIViewController{
 
    //MARK: - Labels
    
    let customBar = UIView()
    private let myTableView = UITableView()
    private lazy var tabBar = BravveTabBar(self, itemImagesNames: [ButtonsBravve.locationPink.rawValue,
                                                                   ButtonsBravve.exitGray.rawValue])
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "BOXOFFICE"
        lb.font = UIFont(name: "Ubuntu-Medium", size: 15)
        lb.backgroundColor = UIColor(named: "boxOffice")
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Numa esquina\ncharmosa, um hotel"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 20)
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var reserveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageReservs3")

        return image
    }()
    lazy var reserveImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageReservs4")

        return image
    }()
    lazy var infoLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Home by Kamy"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 20)
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var nameLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "UM Coffe Co."
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 12)
        lb.textColor = UIColor(named: "label")
        lb.textAlignment = .left
        return lb
    }()
    lazy var detailLocalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Detalhes da sua reserva"
        lb.numberOfLines = 0
        lb.font = UIFont(name: "Ubuntu-Medium", size: 16)
        lb.textColor = UIColor(named: "blueNav")
        lb.textAlignment = .left
        return lb
    }()
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "calendarBlue")

        return image
    }()

    lazy var buttonMainDoor: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta principal", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 14)
        button.backgroundColor = UIColor(named: "buttonPink")
        button.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(buttonMaindoorTap), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonMaindoorTap(){
        
    }
    lazy var buttonOpenSpace: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Abrir porta do espaço", for: .normal)
        button.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 14)
        button.backgroundColor = UIColor(named: "buttonPink")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        button.addTarget(self, action: #selector(buttonOpenSpaceTap), for: .touchUpInside)
        return button
    }()
    
    
    @objc func buttonOpenSpaceTap(){
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.separatorStyle = .none
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        setupViews()
        setupDefaults()
        setupContraints()
        
       
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        tabBar.selectedItem = tabBar.items?[0]
    }
    func setupViews(){
        view.addSubview(buttonMainDoor)
        view.addSubview(buttonOpenSpace)
        myTableView.addSubviews([titleLabel,descriptLabel,reserveImage,reserveImage2,infoLocalLabel,nameLocalLabel,detailLocalLabel,imageDetail])
        view.addSubview(myTableView)
        view.addSubview(customBar)
        view.addSubview(tabBar)
        
    

    }
    private func setupDefaults(){
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Check out"){
            _ in
            
        }
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            buttonMainDoor.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonMainDoor.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            buttonMainDoor.widthAnchor.constraint(equalToConstant: 188),
            buttonMainDoor.heightAnchor.constraint(equalToConstant: 52),
            buttonOpenSpace.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonOpenSpace.leadingAnchor.constraint(equalTo: buttonMainDoor.trailingAnchor),
            buttonOpenSpace.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonOpenSpace.widthAnchor.constraint(equalToConstant: 188),
            buttonOpenSpace.heightAnchor.constraint(equalToConstant: 52),
            titleLabel.topAnchor.constraint(equalTo: myTableView.bottomAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 24),
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            descriptLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            reserveImage.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            reserveImage.widthAnchor.constraint(equalToConstant: 300),
            reserveImage.heightAnchor.constraint(equalToConstant: 300),
            reserveImage2.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor,constant: 16),
            reserveImage2.leadingAnchor.constraint(equalTo: reserveImage.trailingAnchor,constant: 9),
            reserveImage.widthAnchor.constraint(equalToConstant: 300),
            reserveImage.heightAnchor.constraint(equalToConstant: 300),
            infoLocalLabel.topAnchor.constraint(equalTo: reserveImage.bottomAnchor,constant: 52.5),
            infoLocalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            nameLocalLabel.topAnchor.constraint(equalTo: infoLocalLabel.bottomAnchor,constant: 7),
            nameLocalLabel.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 20),
            detailLocalLabel.topAnchor.constraint(equalTo: nameLocalLabel.bottomAnchor,constant: 32),
            detailLocalLabel.leadingAnchor.constraint(equalTo: imageDetail.trailingAnchor,constant: 9),
            imageDetail.leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 25),
            imageDetail.centerYAnchor.constraint(equalTo: detailLocalLabel.centerYAnchor),
         
            
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: buttonMainDoor.topAnchor),

            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
         
            
        ])
    }
    


   
}
extension CheckOutView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        1613
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    
}

