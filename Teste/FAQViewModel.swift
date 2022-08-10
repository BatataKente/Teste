//
//  FAQCollectionCellViewModel.swift
//  Teste
//
//  Created by user217584 on 04/08/22.
//

import Foundation
import UIKit

//struct FAQCollectionTableViewCellViewModel {
//    let viewModels: [FAQCollectionViewCellViewModel]
//}

struct FAQModel {
    
    let question: String
    let answer: String
}

class FAQViewModel{
    
    private let questionAnswer: [FAQModel] = [
        FAQModel(question: "Como eu faço para abrir o Box?", answer: "Após confirmar o pagamento ou inserir seu voucher, o app exibe as informações da sua contratação. No horário estabelecido, basta ir no menu "+"Minhas reservas"+", selecionar sua reserva e o app abrirá um card com o resumo da sua contratação. Clique na reserva e depois no. botão "+"Destravar porta"+" e pronto. Você já pode acessar o box."),
    FAQModel(question: "Como eu faço para abrir o Box?", answer: "Após confirmar o pagamento ou inserir seu voucher, o app exibe as informações da sua contratação. No horário estabelecido, basta ir no menu "+"Minhas reservas"+", selecionar sua reserva e o app abrirá um card com o resumo da sua contratação. Clique na reserva e depois no. botão "+"Destravar porta"+" e pronto. Você já pode acessar o box."),
    FAQModel(question: "Como faço para reportar um problema?", answer: "Você pode escrever para suporte@bravve.com.br ou enviar uma mensagem para o número de suporte disponível em nosso app."),
    FAQModel(question: "Como finalizo o uso?", answer: "Basta clicar no botão "+"Sair do Box."+" Certifique-se sempre de que a porta foi fechada corretamente."),
    FAQModel(question: "O que acontece se eu não sair ao final do meu horário?", answer: "Além de prejudicar o próximo cliente, será cobrada de você uma taxa adicional de R$ 500,00 a cada 30 minutos excedentes."),
    FAQModel(question: "E se eu encontrar o BOX sujo e desorganizado?", answer: "Contate nosso suporte através do app. Caso não seja possível a manutenção ou limpeza rapidamente, devolveremos seu dinheiro."),
    FAQModel(question: "Sou uma empresa. Posso reservar horários para meus colaboradores?", answer: "É claro que sim! Pensando nessa situação, nossa equipe de desenvolvimento criou um sistema de vouchers para Pessoas Jurídicas, onde a empresa contrata uma determinada quantia de horas e distribui para uso de seus colaboradores, da forma como quiser. *Clique aqui*"),
    FAQModel(question: "Onde eu encontro um BOX Office?", answer: "Neste momento estamos atuando somente na cidade de São Paulo.Em breve expandiremos nossas operações para outras cidades."),
    FAQModel(question: "Como saberei que meu tempo está acabando?", answer: "Nosso time desenvolveu um sistema de alerta que vai comunica-lo faltando 05 minutos para o término do seu período e assim que o tempo acabar. Assim terá tempo para se organizar."),
    FAQModel(question: "Como faço para ter um BOX Office numa área do meu estabelecimento comercial?", answer: "É só *clicar aqui*"),
    FAQModel(question: "Sujei o Box sem querer. O que faço agora?", answer: "Contate nosso suporte através do app."),
    FAQModel(question: "Posso cancelar ou desistir da minha reserva?", answer: "Você poderá desistir ou cancelar sua contratação com até 24 horas de antecedência da utilização, enviando um e-mail com sua solicitação para: contato@bravve.com.br. Será devolvido o valor pago, descontadas todas as taxas e encargos financeiros cobrados na transação financeira, ou seja, as taxas da iugu, da administradora do cartão de crédito e quaisquer outros encargos financeiros outros encargos financeiros e/ou impostos atribuidos na transação.\nNão haverá reembolso no caso de cancelamento após o prazo informado acima (dentro de 24 horas de antecedência) uma vez que a agenda do Box ficará reservada, comprometendo quaisquer outros agendamentos e reservas naquele período/local. \nNos casos de não comparecimento no período agendado, não haverá reembolso dos valores contratados uma vez que esse valor será utilizado para compensar a janela de atendimento do BOX que ficará reservada, comprometendo quaisquer outros agendamentos e reservas naquele período/local.")
    ]
    
    var count: Int {
        return questionAnswer.count
    }
    
    func getQuestionAnswer(indexPath: IndexPath) -> FAQModel{
        return self.questionAnswer[indexPath.row]
    }
    
}

