
import UIKit

class TermsOfPrivacy: UIViewController {
   
        
        private let customBar = UIView()
        private let myTableView = UITableView()
        private let shadowView = UIView()
        
    
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
    
    private lazy var tabBar = BravveTabBar(self,
                                           itemImagesNames: [ButtonsBravve.locationGray.rawValue,
                                                             ButtonsBravve.calendarButtonGray.rawValue,
                                                             ButtonsBravve.userLoginGray.rawValue
                                                            ])
    
    

        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
            myTableView.delegate = self
            myTableView.dataSource = self
            myTableView.translatesAutoresizingMaskIntoConstraints = false
            myTableView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
           // myTableView.rowHeight = CGFloat(520).generateSizeForScreen
            myTableView.separatorStyle = .none
            myTableView.layer.cornerRadius = CGFloat(16).generateSizeForScreen
            shadowView.backgroundColor = .systemBackground
            shadowView.layer.shadowOpacity = 0.4
            tabBar.selectedItem = tabBar.items?[1]
            view.addSubviews([shadowView,wayImage1,wayImage2,customBar, myTableView,tabBar])
            customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Termos de privacidade") { _ in
            
                return
            }
            
            setConstraints()
            
        }
        
        private func setConstraints() {
            myTableView.constraintOutsideTo(.top, customBar, CGFloat(43).generateSizeForScreen)
            myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(43).generateSizeForScreen)
            myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-43).generateSizeForScreen)
            myTableView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide,CGFloat(-70).generateSizeForScreen)
            
            shadowView.constraintOutsideTo(.top, customBar, CGFloat(43).generateSizeForScreen)
            shadowView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(43).generateSizeForScreen)
            shadowView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-43).generateSizeForScreen)
            shadowView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
            shadowView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide,CGFloat(-69).generateSizeForScreen)
            
            wayImage1.constraintInsideTo(.top, view.safeAreaLayoutGuide)
            wayImage1.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
          
            wayImage2.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
            wayImage2.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
           
            tabBar.constraintInsideTo(.leading, view.safeAreaLayoutGuide)
            tabBar.constraintInsideTo(.trailing, view.safeAreaLayoutGuide)
            tabBar.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
            
        }
    }

    extension TermsOfPrivacy: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.textColor = UIColor(named: ColorsBravve.label.rawValue)
            cell.textLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
            cell.layer.cornerRadius =  CGFloat(20).generateSizeForScreen
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "  Esses Termos de Uso da BoxOffice são celebrados entre você, o usuário (“Você”), e a BoxOffice Soluções em Mobilidade Ltda. (“BoxOffice”), uma empresa brasileira inscrita no CNPJ/MF sob no 31.333.999/0001-14, com sede na Rua Tenente Gomes Ribeiro 182, em São Paulo, Estado de São Paulo. Os Termos de Uso da BoxOffice, conjuntamente com a Política de Privacidade da Box Office, formam o acordo integral entre Você e a BoxOffice (“Contrato do Usuário”) para a utilização dos equipamentos da BoxOffice, conforme disposto a seguir.A BoxOffice é uma empresa que fornece espaços compactos autônomos para realizar negócios, entrevistas, reuniões, estudos e outras atividades em geral, com conforto acústico, privacidade e climatizados, e de equipamentos colocados à disposição para locação temporária (“BOX” ou “BOXES” OU “Equipamentos”), por meio de um aplicativo para dispositivos móveis (o “App da BoxOffice”), em diversos locais nas cidades brasileiras (as “Cidades”), que podem ser consultados no App da BoxOffice. Os BOXES oferecidos poderão incluir, sem limitação, espaço com conforto acústico, wifi, TV, sofás e mesas de apoio, além de climatização interior e abertura da porta pelo aplicativo, ou seja, de uso livre, e disponibilizados dentro áreas de pré-definidas pela BoxOffice. Os Boxes, conjuntamente com outros equipamentos que a BoxOffice venha a oferecer, formam conjuntamente os “Equipamentos”. Os Equipamentos disponíveis para locação em cada uma das cidades ou regiões podem ser consultados no App da BoxOffice."
            
            return cell
        }
        
        
    }
