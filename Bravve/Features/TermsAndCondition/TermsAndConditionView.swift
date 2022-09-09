
import UIKit

class TermsAndConditionViewController: UIViewController {
    
    private let customBar = UIView()
    private let myTableView = UITableView()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowOpacity = 0.2
        view.clipsToBounds = false
        view.layer.cornerRadius = 20
        view.frame = view.frame
        return view
    }()
    
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
        
        view.backgroundColor = UIColor(named: ColorsBravve.white_black.rawValue)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableFooterView = UIView()
        myTableView.frame = view.bounds
        myTableView.rowHeight = 1092
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        myTableView.register(TermsAndConditionCell.self, forCellReuseIdentifier: "Cell")
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.layer.cornerRadius = CGFloat(16).generateSizeForScreen
        tabBar.selectedItem = tabBar.items?[2]
        view.addSubviews([shadowView,wayImage1,wayImage2, customBar, myTableView,tabBar])
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Termos de privacidade") { _ in
            self.dismiss(animated: true)
        }
        
        setConstraints()
        
    }
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: CGFloat(26).generateSizeForScreen),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(26).generateSizeForScreen),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            shadowView.topAnchor.constraint(equalTo: customBar.bottomAnchor, constant: CGFloat(26).generateSizeForScreen),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(35).generateSizeForScreen),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-35).generateSizeForScreen),
            shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(-59).generateSizeForScreen),
            
            wayImage1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wayImage1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            wayImage2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            wayImage2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

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
