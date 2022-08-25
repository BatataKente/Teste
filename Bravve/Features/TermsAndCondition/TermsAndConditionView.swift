
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
        return tabBar
    }()
    
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
            myTableView.layer.cornerRadius = CGFloat(16).generateSizeForScreen
            tabBar.selectedItem = tabBar.items?[2]
            view.addSubviews([shadowView,wayImage1,wayImage2, customBar, myTableView,tabBar])
            customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Termos de privacidade") { _ in
                self.dismiss(animated: true)
            }
            
            setConstraints()
            
        }
        
        private func setConstraints() {
            
            myTableView.constraintOutsideTo(.top, customBar, CGFloat(26).generateSizeForScreen)
            myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(35).generateSizeForScreen)
            myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-35).generateSizeForScreen)
            myTableView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide, CGFloat(-59).generateSizeForScreen)
            myTableView.heightAnchor.constraint(equalToConstant: CGFloat(1092).generateSizeForScreen).isActive = true
            myTableView.widthAnchor.constraint(equalToConstant: CGFloat(324).generateSizeForScreen).isActive = true
            
            shadowView.constraintOutsideTo(.top, customBar, CGFloat(26).generateSizeForScreen)
            shadowView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(35).generateSizeForScreen)
            shadowView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-35).generateSizeForScreen)
            shadowView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide, CGFloat(-59).generateSizeForScreen)

            
            wayImage1.constraintInsideTo(.top, view.safeAreaLayoutGuide)
            wayImage1.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
          
            wayImage2.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
            wayImage2.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
           
            tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
            tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
            tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
            
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
        
        
    }
