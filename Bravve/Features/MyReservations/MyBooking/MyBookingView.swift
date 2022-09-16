//
//  MyReservations.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class MyBookingView: UIViewController {
    
    private let sessionManager = APIService()
    
    private let customBar = UIView()
    
    private let topRightWay = UIImageView()
    
    private let bottomLeftWay = UIImageView()
    
    private lazy var myTableView: UITableView = {
        
        let myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .clear
        myTableView.register(MyBookingCustomCell.self, forCellReuseIdentifier: "Cell")
        
        return myTableView
    }()
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()

    
//    private func getReservations() {
//        
//        sessionManager.getDataArray(endpoint: .reservationsOpen){ (statusCode, error, openReservations: [Reservations]?) in
//
//            guard let openReservations = openReservations else {
//                print(statusCode as Any)
//                print(error?.localizedDescription as Any)
//                return
//            }
//            
//                self.reservations = openReservations
//            
//        }
//        print("kaue3 \(reservations)")
//    }
    
    override var prefersStatusBarHidden: Bool {true}

    override func viewDidLoad() {
        print("kaue2 \(UserReservations.reservations)")
        super.viewDidLoad()
        
        view.setToDefaultBackgroundColor()
        
        view.addSubviews([topRightWay, bottomLeftWay, myTableView, customBar, tabBar])
        
        tabBar.selectedItem = tabBar.items?[1]
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") {_ in
            
            self.dismiss(animated: true)
        }
        
        setConstraints()
        setDefaults()
    }

    
    func setDefaults() {
        
        topRightWay.setWayToDefault(.wayReserv_2)
        bottomLeftWay.setWayToDefault(.wayReserv_1)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MyBookingView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return UserReservations.reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath) as? MyBookingCustomCell
        
        cell?.backgroundColor = .clear
        cell?.delegate = self
        
        cell?.setupCell(reservation: UserReservations.reservations[indexPath.row])
    
        
        if cell?.textLabel?.text != "" {
            
            Flags.shared.flagReservation = 1
        }
    
        return cell ?? UITableViewCell()
    }
}

extension MyBookingView: MyBookingCustomCellDelegate {
    
    func presentViewController(_ viewController: UIViewController) {
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}

extension MyBookingView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        for subview in scrollView.subviews {
            
            if subview.frame.origin.x != 0 {
                
                subview.subviews[0].backgroundColor = UIColor(named: ColorsBravve.buttonPink.rawValue)
            }
        }
    }
}
