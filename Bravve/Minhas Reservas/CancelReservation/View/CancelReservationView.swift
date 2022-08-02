//
//  CancelReservationView.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class CancelReservationView: UIViewController {
    
    let customBar = UIView()
    
    let topRightWay = UIImageView()
    
    let bottomLeftWay = UIImageView()
    
    let myTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(named: "background")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: "background")
        
        myTableView.register(CancelReservationCell.self, forCellReuseIdentifier: "Cell")
        
        myTableView.rowHeight = 538
        
        myTableView.separatorStyle = .none
        
        myTableView.layer.cornerRadius = 12
        
        view.addSubviews([topRightWay, bottomLeftWay, customBar, myTableView])
        
        
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") { _ in
            
            return
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
    }
}

extension CancelReservationView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CancelReservationCell
        
        return cell ?? UITableViewCell()
    }
    
    
}
