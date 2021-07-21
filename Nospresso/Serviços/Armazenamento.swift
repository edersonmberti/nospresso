//
//  Armazenamento.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/07/21.
//

import Foundation

class Armazenamento<T: Hashable & Codable>  {
    private let padroesDeUsuario = UserDefaults.standard
    private let chave: String
    
    init(chave: String) {
        self.chave = chave
        
        buscarDoArmazenamentoLocal()
    }
    
    internal var itens: Set<T> = [] {
        didSet {
            atualizarBanco()
        }
    }

    private func atualizarBanco() {
        guard let dadosJson = try? JSONEncoder().encode(itens) else { return }

        padroesDeUsuario.setValue(dadosJson, forKey: chave)
    }

    private func buscarDoArmazenamentoLocal() {
        guard let dados = padroesDeUsuario.data(forKey: chave),
              let itens = try? JSONDecoder().decode([T].self, from: dados) else { return }

        self.itens = Set(itens)
    }
}

protocol Armazenável {
    var id: Int { get }
    var nome: String { get }
    var preco: Double { get }
    var imagem: String { get }
    var descricao: String? { get }
    var tipo: Tipo { get }
}

enum Tipo: String, Codable {
    case acessorio
    case cafe
    case maquina
}
