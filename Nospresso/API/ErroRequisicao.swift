//
//  ErroRequisicao.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 10/06/21.
//

import Foundation

enum ErroRequisicao: Error {
    case urlInvalida(mensagem: String)
    case falhou(mensagem: String)
    case semDados
    case falhaNaDecodificacao(mensagem: String, dadosRecebidos: String?)
}
