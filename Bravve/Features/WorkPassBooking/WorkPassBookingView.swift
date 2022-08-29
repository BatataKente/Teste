//
//  ReservaWorkPassView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 29/07/22.
//

import Foundation
import UIKit

class WorkPassBookingView: UIViewController {
    
    var arrayFirstLabel = ["Cartão de Crédito","Foursys","Bravve"]
    var arraySecoundLabel = ["Conta pessoal","Workpass","Workpass"]
    var arrayStackView = ["","490","490"]
    private let space: SpaceDetail?
    
    private let spaceId: Int
    
    init(_ space: SpaceDetail? = nil, spaceId: Int) {
        
        self.space = space
        
        self.spaceId = spaceId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: progressBarButtons
    private lazy var  buttons: [UIButton] = {
        
        let buttons = createProgressBarButtonsWithoutActions([IconsBravve.walletBlue.rawValue, IconsBravve.calendarGray.rawValue, IconsBravve.pencilGray.rawValue, IconsBravve.creditGray.rawValue])
        
        return buttons
    }()
    
    //MARK: TableView
    private let tableView : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        tableView.register(WorkPassCell.self, forCellReuseIdentifier: WorkPassCell.reuseId)
        tableView.separatorStyle = .none
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 68
        tableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        return tableView
    }()
    //MARK: Views
    private let locationStackViewSeparator: UIView = {
        
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.882, green: 0.898, blue: 0.922, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: tabBar
    private lazy var tabBar = TabBarClosed(self, itemImagesNames: [
        ButtonsBravve.locationGray.rawValue,
        ButtonsBravve.calendarButtonPink.rawValue,
        ButtonsBravve.userLoginGray.rawValue
    ])
    
    private let addressLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Qual forma de pagamento deseja realizar?"
        label.font = UIFont(name: FontsBravve.light.rawValue, size: CGFloat(12).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Forma de pagamento"
        label.font = UIFont(name: FontsBravve.bold.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textColor = UIColor(named: ColorsBravve.label.rawValue)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: Buttons
    lazy var pinkButton : UIButton = {
        let button = UIButton()
        button.setTitle("Proxima Etapa", for: .normal)
        button.backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        button.titleLabel?.font = UIFont(name: FontsBravve.bold.rawValue,size: CGFloat(16).generateSizeForScreen)
        button.addTarget(self, action: #selector(nextStageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: ImageView
    private let locationIcon: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: IconsBravve.questionCircleBlue_2.rawValue)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //MARK: StackView
    private lazy var locationStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [locationIcon, addressLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = CGFloat(8).generateSizeForScreen
        return stackView
    }()
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        view.addSubviews([tableView, tabBar, locationDetailLabel, locationStackView, locationStackViewSeparator, pinkButton])
        tableView.delegate = self
        tableView.dataSource = self
        tabBar.selectedItem = tabBar.items?[0]
        
        view.createReservationCustomBarAPI(spaceName: space?.space_name, localName: space?.local_name, imageURL: space?.pictures?[0].url, progressBarButtons: buttons) { _ in
            self.dismiss(animated: true)
        }
        
        setupConstraints()
    }
    //MARK: Funcs
    @objc func nextStageButtonTapped(){
        
        guard let space = space else {
            return
        }

        let reserveViewController = SingleBookingView(space, spaceId: spaceId)
        reserveViewController.modalPresentationStyle = .fullScreen
        present(reserveViewController, animated: true)
    }
    
    //MARK: Constraints
    private func setupConstraints() {
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        
        pinkButton.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        pinkButton.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        pinkButton.constraintOutsideTo(.bottom, tabBar)
        pinkButton.heightAnchorInSuperview(CGFloat(52).generateSizeForScreen)
        
        NSLayoutConstraint.activate([
            
            
            tableView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: CGFloat(22).generateSizeForScreen),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: pinkButton.topAnchor),
            
            locationIcon.widthAnchor.constraint(equalToConstant: CGFloat(10.49).generateSizeForScreen),
            locationIcon.heightAnchor.constraint(equalToConstant: CGFloat(14).generateSizeForScreen),
            
            locationStackView.topAnchor.constraint(equalTo: locationDetailLabel.bottomAnchor, constant: CGFloat(11)),
            locationStackView.leadingAnchor.constraint(equalTo: locationDetailLabel.leadingAnchor),
            locationStackView.widthAnchor.constraint(equalToConstant: CGFloat(334).generateSizeForScreen),
            locationStackView.heightAnchor.constraint(equalToConstant: CGFloat(28).generateSizeForScreen),
            
            locationDetailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(220).generateSizeForScreen),
            locationDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(17).generateSizeForScreen)
        ])
    }
    
}
//MARK: Extension
extension WorkPassBookingView: UITableViewDelegate, UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayFirstLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkPassCell", for: indexPath) as? WorkPassCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.firstLabel.text = arrayFirstLabel[indexPath.row]
        cell.secondLabel.text = arraySecoundLabel[indexPath.row]
        if arrayStackView[indexPath.row] != ""{
        cell.creditsStackView.isLayoutMarginsRelativeArrangement = true
        cell.pinkCreditsLabel.text = arrayStackView[indexPath.row]
        cell.creditsLabel.text = "créditos"
        }
        

        return cell
    }
}
extension WorkPassBookingView:WorkPassCellProtocol{
    func setButtonTapped(sender:UIButton) {
        let tableView = self.tableView
        for cell in tableView.visibleCells{
         if  let cell = cell as? WorkPassCell{
             if cell.circleButton != sender {
                 cell.circleButton.setImage(UIImage(named: ButtonsBravve.circle.rawValue), for: .normal)
             }
            }
        }
        sender.setImage(UIImage(named: ButtonsBravve.circleSelected.rawValue), for: .normal)
        
    }
    
    
}
