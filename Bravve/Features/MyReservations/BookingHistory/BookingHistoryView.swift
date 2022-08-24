//
//  BookingHistoryView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 24/08/22.
//

import UIKit

class BookingHistoryView: UIViewController {
    
    let customBar = UIView()
    
    let topRightWay = UIImageView()
    
    let bottomLeftWay = UIImageView()
    
    let myTableView = UITableView()
    
    private lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(named: "background")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: "background")
        
        myTableView.register(BookingHistoryCustomCell.self, forCellReuseIdentifier: "Cell")
        
        myTableView.rowHeight = 538
        
        myTableView.separatorStyle = .none
        
        myTableView.layer.cornerRadius = 12
        
        view.addSubviews([topRightWay, bottomLeftWay, customBar, myTableView, tabBar])
        
        tabBar.selectedItem = tabBar.items?[1]
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Histórico de Reservas") { _ in
            
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
        myTableView.constraintOutsideTo(.top, customBar, 13)
        myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, 20)
        myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, -20)
        myTableView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
        
        tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
        tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension BookingHistoryView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BookingHistoryCustomCell
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

extension BookingHistoryView: BookingHistoryCustomCellDelegate {
    
    func presentViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}
