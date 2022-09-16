
import UIKit

class TermsAndConditionViewController: UIViewController {
    
    private let customBar = UIView()
    
    //MARK: myTableView
    private lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.frame = view.bounds
      
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        myTableView.register(TermsAndConditionCell.self, forCellReuseIdentifier: "Cell")
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.layer.cornerRadius = CGFloat(16).generateSizeForScreen
        return myTableView
    }()
    
    //MARK: shadowView
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowOpacity = 0.2
        view.clipsToBounds = false
        view.layer.cornerRadius = 20
        view.frame = view.frame
        return view
    }()
    //MARK: WayImage1 e 2
    private lazy var wayImage1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wayTerms")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var wayImage2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wayTerms2")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    //MARK: tabBar
    private lazy var tabBar: TabBarClosed = {
        let tabBar = TabBarClosed(self)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    override var prefersStatusBarHidden: Bool {
        
        true
    }
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableFooterView = UIView()
        tabBar.selectedItem = tabBar.items?[2]
        view.addSubviews([shadowView,wayImage1,wayImage2, customBar, myTableView,tabBar])
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Termos de privacidade") { _ in
            self.dismiss(animated: true)
        }
        
        setConstraints()
        
    }
    //MARK: Constraints
    private func setConstraints() {
        
        for subview in view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: 26),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -59),
            myTableView.widthAnchor.constraint(equalToConstant: 324),
            myTableView.heightAnchor.constraint(equalToConstant: 1092),
            
            shadowView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: 26),
            shadowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            shadowView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            shadowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -59),
            
            wayImage1.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: 26),
            wayImage1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            wayImage2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            wayImage2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
//MARK: extensions
extension TermsAndConditionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TermsAndConditionCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
