//
//  MinhasReservas.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class MinhasReservas: UIViewController {
    
    private let customBar = UIView()
    
    private let topRightWay = UIImageView()
    
    private let bottomLeftWay = UIImageView()
    
    private let myTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        
        myTableView.register(ReservaCell.self, forCellReuseIdentifier: "Cell")
        
        myTableView.rowHeight = CGFloat(520).generateSizeForScreen
        
        myTableView.separatorStyle = .none
        
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        
        view.addSubviews([topRightWay, bottomLeftWay, customBar, myTableView])
        
        
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") { _ in
            
            return
        }
        
        setConstraints()
        setDefaults()
    }
    
    private func setDefaults() {
        topRightWay.setWayToDefault(.wayReserv_2)
        bottomLeftWay.setWayToDefault(.wayReserv_1)
    }
    
    private func setConstraints() {
        myTableView.constraintOutsideTo(.top, customBar, CGFloat(13).generateSizeForScreen)
        myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(20).generateSizeForScreen)
        myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-20).generateSizeForScreen)
        myTableView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension MinhasReservas: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ReservaCell
        
        return cell ?? UITableViewCell()
    }
    
    
}
