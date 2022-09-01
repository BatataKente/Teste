//
//  MyReservations.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class MyBookingView: UIViewController {
    
    private let customBar = UIView()
    
    private let topRightWay = UIImageView()
    
    private let bottomLeftWay = UIImageView()
    
    private lazy var myTableView: UITableView = {
        
        let myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .clear
        myTableView.register(MyBookingCustomCell.self, forCellReuseIdentifier: "Cell")
        
        return myTableView
    }()
    
    private lazy var tabBar: TabBarClosed = {
        
        let tabBar = TabBarClosed(self)
        return tabBar
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }

    override func viewDidLoad() {
        
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
        
        myTableView.constraintOutsideTo(.top, customBar)
        myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        myTableView.constraintOutsideTo(.bottom, tabBar)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension MyBookingView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath) as? MyBookingCustomCell
        
        cell?.backgroundColor = .clear
        cell?.delegate = self
        
        if cell?.textLabel?.text != "" {
//            flagReservation = 1
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
