//
//  Sacola.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 18/07/21.
//

import Foundation

protocol SacolaProtocol {
    func adicionar(item: Armazenável)
    func remover(item: Armazenável)
    func listar() -> [ItemSacola]
    func limpar()
    func total() -> Double
}

class Sacola: Armazenamento<ItemSacola> {
    
    static let instancia = Sacola(chave: chave)

    private static let chave = "@chave-sacola"

    private override init(chave: String) {
        super.init(chave: chave)
    }
}

extension Sacola: SacolaProtocol {

    func adicionar(item: Armazenável) {
        if var item = super.itens.buscarIgual(item: item) {
            super.itens.remove(item)
            item.quantidade += 1
            super.itens.insert(item)
        } else {
            super.itens.insert(ItemSacola(armazenável: item))
        }
    }
    
    func remover(item: Armazenável) {
        if let item = super.itens.buscarIgual(item: item) {
            super.itens.remove(ItemSacola(armazenável: item))
        }
    }
    
    func listar() -> [ItemSacola] {
        Array(super.itens)
    }
    
    func limpar() {
        super.itens.removeAll()
    }
    
    func total() -> Double {
        super.itens.reduce(0) { (result, item) in
            result + (Double(item.quantidade) * item.preco)
        }
    }
}

struct ItemSacola:Armazenável, Hashable, Codable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String?
    let tipo: Tipo
    
    var quantidade: Int = 1
    
    init(armazenável: Armazenável) {
        self.id = armazenável.id
        self.nome = armazenável.nome
        self.preco = armazenável.preco
        self.imagem = armazenável.imagem
        self.descricao = armazenável.descricao
        self.tipo = armazenável.tipo
    }
}

extension Set where Element == ItemSacola {
    func buscarIgual(item: Armazenável) -> ItemSacola? {
        filter {
            $0.id == item.id && $0.tipo == item.tipo
        }.first
    }
}
