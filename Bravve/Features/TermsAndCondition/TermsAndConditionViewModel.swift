//
//  TermosECondicoesViewModel.swift
//  Bravve
//
//  Created by Evandro Rodrigo Minamoto on 29/07/22.
//

import UIKit

class TermsAndConditionCell: UITableViewCell{

    let termsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColorsBravve.textField.rawValue)
        label.font = UIFont(name: FontsBravve.regular.rawValue, size: CGFloat(15).generateSizeForScreen)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.60
        label.attributedText = NSMutableAttributedString(string: "Esses Termos de Uso da BoxOffice são celebrados entre você, o usuário (“Você”), e a BoxOffice Soluções em Mobilidade Ltda. (“BoxOffice”), uma empresa brasileira inscrita no CNPJ/MF sob no 31.333.999/0001-14, com sede na Rua Tenente Gomes Ribeiro 182, em São Paulo, Estado de São Paulo. Os Termos de Uso da BoxOffice, conjuntamente com a Política de Privacidade da Box Office, formam o acordo integral entre Você e a BoxOffice (“Contrato do Usuário”) para a utilização dos equipamentos da BoxOffice, conforme disposto a seguir.A BoxOffice é uma empresa que fornece espaços compactos autônomos para realizar negócios, entrevistas, reuniões, estudos e outras atividades em geral, com conforto acústico, privacidade e climatizados, e de equipamentos colocados à disposição para locação temporária (“BOX” ou “BOXES” OU “Equipamentos”), por meio de um aplicativo para dispositivos móveis (o “App da BoxOffice”), em diversos locais nas cidades brasileiras (as “Cidades”), que podem ser consultados no App da BoxOffice. Os BOXES oferecidos poderão incluir, sem limitação, espaço com conforto acústico, wifi, TV, sofás e mesas de apoio, além de climatização interior e abertura da porta pelo aplicativo, ou seja, de uso livre, e disponibilizados dentro áreas de pré-definidas pela BoxOffice. Os Boxes, conjuntamente com outros equipamentos que a BoxOffice venha a oferecer, formam conjuntamente os “Equipamentos”. Os Equipamentos disponíveis para locação em cada uma das cidades ou regiões podem ser consultados no App da BoxOffice.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(termsLabel)
        contentView.backgroundColor = UIColor(named: ColorsBravve.backgroundTerms.rawValue)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints(){
        termsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        termsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        termsLabel.heightAnchor.constraint(equalToConstant: CGFloat(1053).generateSizeForScreen).isActive = true
        termsLabel.widthAnchor.constraint(equalToConstant: CGFloat(302).generateSizeForScreen).isActive = true
        termsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(20).generateSizeForScreen).isActive = true
        termsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-25).generateSizeForScreen).isActive = true
        
    }
}
