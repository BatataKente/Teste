//
//  FrequentlyAskedQuestionsView.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

class FrequentlyAskedQuestionsView: UIViewController {
    
    static let identifier = "FAQHeaderViewController"
    
    let customBar = UIView()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(FAQCollectionTableViewCell.self, forCellReuseIdentifier: FAQCollectionTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = UIColor(named: ColorsBravve.capsuleButton.rawValue)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.reloadData()
        return table
    }()
    
    private lazy var viewModels: [FAQCollectionTableViewCellViewModel] = [
        FAQCollectionTableViewCellViewModel(viewModels: [FAQCollectionViewCellViewModel(question: "Como eu faço para abrir o Box?", answer: "Após confirmar o pagamento ou inserir seu voucher, o app exibe as informações da sua contratação. No horário estabelecido, basta ir no menu “Minhas reservas”, selecionar sua reserva e o app abrirá um card com o resumo da sua contratação. Clique na reserva e depois no botão “Destravar porta” e pronto. Você já pode acessar o box."),
            FAQCollectionViewCellViewModel(question: "Como faço para reportar um problema?", answer: ""),]
        )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(customBar)
        setupDefaults()
        configConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupDefaults() {
        customBar.setToDefaultCustomBarWithBackButton(viewTitle: "Dúvidas frequentes") {_ in
            let navBar = FrequentlyAskedQuestionsView()
            navBar.modalPresentationStyle = .fullScreen
            self.present(navBar, animated: false)
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.customBar.bottomAnchor, constant: CGFloat(-37).generateSizeForScreen),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
    }
}

extension FrequentlyAskedQuestionsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FAQCollectionTableViewCell.identifier, for: indexPath) as? FAQCollectionTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}
