//
//  MinhasReservas.swift
//  Teste
//
//  Created by user208023 on 7/28/22.
//

import UIKit

class MinhasReservas: UIViewController {
    
    let customBar = UIView()
    
    let topRightWayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wayReservation2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomLeftWayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wayReservation1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let myTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 0.721, green: 0.721, blue: 0.721, alpha: 1)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(red: 0.721, green: 0.721, blue: 0.721, alpha: 1)
        
        myTableView.register(ReservaCell.self, forCellReuseIdentifier: "Cell")
        
        myTableView.rowHeight = 538
        
        myTableView.separatorStyle = .none
        
        myTableView.layer.cornerRadius = 12
        
        
        view.addSubview(topRightWayImage)
        view.addSubview(bottomLeftWayImage)
        view.addSubview(customBar)
        view.addSubview(myTableView)
        
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Minhas Reservas") { _ in
            
            return
        }
        NSLayoutConstraint.activate([
            
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: 13),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            topRightWayImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -155),
            topRightWayImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            topRightWayImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.54),
            topRightWayImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.38),
            
            bottomLeftWayImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 120),
            bottomLeftWayImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomLeftWayImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3064),
            bottomLeftWayImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.426)
        ])
    
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
