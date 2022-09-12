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
    
    let myTableView: UITableView = {
        
        let myTableView = UITableView()
        
        return myTableView
    }()
    
    private lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(named: "background")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: "background")
        
        myTableView.register(BookingHistoryCustomCell.self, forCellReuseIdentifier: "Cell")
        
        myTableView.rowHeight = CGFloat(538).generateSizeForScreen
        
        myTableView.separatorStyle = .none
        
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        
        view.addSubviews([topRightWay, bottomLeftWay, customBar, myTableView, tabBar])
        
        tabBar.selectedItem = tabBar.items?[1]
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Histórico de Reservas") { _ in
            if Flags.shared.flagReservation == 2 {
                let vc = HomeClosedView()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
            self.dismiss(animated: true)
            }
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
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: CGFloat(13).generateSizeForScreen),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  CGFloat(20).generateSizeForScreen),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(-20).generateSizeForScreen),
            myTableView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension BookingHistoryView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BookingHistoryCustomCell
        cell?.delegate = self
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}

extension BookingHistoryView: BookingHistoryCustomCellDelegate {
    
    func presentViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}
