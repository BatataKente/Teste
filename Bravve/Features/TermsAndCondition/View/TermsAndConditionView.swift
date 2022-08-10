//
//  TermosECodicoesView.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 29/07/22.
//

import UIKit

class TermsAndConditionView: UIViewController {
    
    private let customBar = UIView()
    private let myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.backgroundColor = UIColor(named: ColorsBravve.background.rawValue)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // myTableView.rowHeight = CGFloat(520).generateSizeForScreen
        myTableView.separatorStyle = .none
        myTableView.layer.cornerRadius = CGFloat(12).generateSizeForScreen
        view.addSubviews([customBar, myTableView])
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Termos de privacidade") { _ in
            
            return
        }
        
        setConstraints()
        
    }
    
    private func setConstraints() {
        myTableView.constraintOutsideTo(.top, customBar, CGFloat(43).generateSizeForScreen)
        myTableView.constraintInsideTo(.leading, view.safeAreaLayoutGuide, CGFloat(43).generateSizeForScreen)
        myTableView.constraintInsideTo(.trailing, view.safeAreaLayoutGuide, CGFloat(-43).generateSizeForScreen)
        myTableView.constraintInsideTo(.bottom, view.safeAreaLayoutGuide)
    }
}

extension TermsAndConditionView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.textColor = UIColor(named: ColorsBravve.label.rawValue)
        cell.textLabel?.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "   Esses Termos de Uso da BoxOffice são celebrados entre você, o usuário (“Você”), e a BoxOffice Soluções em Mobilidade Ltda. (“BoxOffice”), uma empresa brasileira inscrita no CNPJ/MF sob no 31.333.999/0001-14, com sede na Rua Tenente Gomes Ribeiro 182, em São Paulo, Estado de São Paulo. Os Termos de Uso da BoxOffice, conjuntamente com a Política de Privacidade da Box Office, formam o acordo integral entre Você e a BoxOffice (“Contrato do Usuário”) para a utilização dos equipamentos da BoxOffice, conforme disposto a seguir.A BoxOffice é uma empresa que fornece espaços compactos autônomos para realizar negócios, entrevistas, reuniões, estudos e outras atividades em geral, com conforto acústico, privacidade e climatizados, e de equipamentos colocados à disposição para locação temporária (“BOX” ou “BOXES” OU “Equipamentos”), por meio de um aplicativo para dispositivos móveis (o “App da BoxOffice”), em diversos locais nas cidades brasileiras (as “Cidades”), que podem ser consultados no App da BoxOffice. Os BOXES oferecidos poderão incluir, sem limitação, espaço com conforto acústico, wifi, TV, sofás e mesas de apoio, além de climatização interior e abertura da porta pelo aplicativo, ou seja, de uso livre, e disponibilizados dentro áreas de pré-definidas pela BoxOffice. Os Boxes, conjuntamente com outros equipamentos que a BoxOffice venha a oferecer, formam conjuntamente os “Equipamentos”. Os Equipamentos disponíveis para locação em cada uma das cidades ou regiões podem ser consultados no App da BoxOffice."
        
        return cell
    }

}
