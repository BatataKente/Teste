//
//  HomeMapKitView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 08/09/22.
//

import UIKit
import MapKit

class HomeMapKitView: UIViewController {
    
    //MARK: - var and let
    private var viewModel = HomeMapKitViewModel()
    
    var latitude: Double?
    var longitude: Double?
    
    //MARK: - mapView
        private lazy var mapView: MKMapView = {
            
        let map = MKMapView()
        map.tintColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
        map.showsUserLocation = true
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    //MARK: - roundedButton
    private lazy var roundedButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: ColorsBravve.blue.rawValue)
        button.setImage(UIImage(named: IconsBravve.activitiesBlue.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: - tabBar
    
        private lazy var tabBar: BravveTabBar = {
            
            let tabBar = BravveTabBar(self)
            
            tabBar.translatesAutoresizingMaskIntoConstraints = false
            
            return tabBar
        }()
    
    //MARK: - alertDenied
    func alertDenied() {
         let alert: UIAlertController = UIAlertController(title: "Atenção", message: "Este app necessita da localização para que seus recuros sejam utilizados, verifique em ajustes e tente novamente.", preferredStyle: .alert)
         let action: UIAlertAction = UIAlertAction(title: "Voltar", style: .default) {
             (action) in
         }
         alert.addAction(action)
         self.present(alert, animated: true)
    }
    
    //MARK: - alertRestricted
    func alertRestricted() {
         let alert: UIAlertController = UIAlertController(title: "Atenção", message: "Sua localização está restrita, por favor, verifique e tente novamente", preferredStyle: .alert)
         let action: UIAlertAction = UIAlertAction(title: "Voltar", style: .default) {
             (action) in
         }
         alert.addAction(action)
         self.present(alert, animated: true)
    }
  
    //MARK: - setupView
    func setupView(){
        
        view.addSubview(mapView)
        view.addSubview(roundedButton)
        view.addSubview(tabBar)
        
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        tabBar.selectedItem = tabBar.items?[0]
        viewModel.checkIfLocationIsEnabled()
        setAlerts()
        viewModel.setupUserRegion(latitude: latitude, longitude: longitude)
        mapView.setRegion(viewModel.userRegion, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - func setAlerts
    //This func just set the alerts on the view
    ///
    func setAlerts(){
        
        viewModel.alertAccessDenied = { [weak self] in
              self?.alertDenied()
          }
        
        viewModel.alertRestricted = { [weak self] in
              self?.alertDenied()
          }
        
    }
    
    //MARK: - setupConstraints
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
     
            
            //MARK: - mapView Constraints
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor),
            
            //MARK: - roundedButton Constraints
            roundedButton.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: -50),
            roundedButton.heightAnchor.constraint(equalToConstant: 40),
            roundedButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -35),
            roundedButton.widthAnchor.constraint(equalToConstant: 40),
            
            //MARK: - tabBar Constraints
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        
        ])
    }
 
}

