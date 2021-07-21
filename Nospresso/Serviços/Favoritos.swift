//
//  Favoritos.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import Foundation

protocol FavoritosProtocol {
    func estaFavoritado(favorito: Armazenável) -> Bool
    func adicionar(favorito: Armazenável)
    func remover(favorito: Armazenável)
    func limpar()
    func listar() -> [ItemFavorito]
}

class Favoritos: Armazenamento<ItemFavorito> {

    static let instancia = Favoritos(chave: chave)
    
    private static let chave = "@chave-favoritos"
    
    private override init(chave: String) {
        super.init(chave: chave)
    }
}

extension Favoritos: FavoritosProtocol {
    func estaFavoritado(favorito: Armazenável) -> Bool {
        super.itens.contains(ItemFavorito(armazenável: favorito))
    }
    
    func adicionar(favorito: Armazenável) {
        super.itens.insert(ItemFavorito(armazenável: favorito))
    }
    
    func remover(favorito: Armazenável) {
        super.itens.remove(ItemFavorito(armazenável: favorito))
    }
    
    func limpar() {
        super.itens.removeAll()
    }
    
    func listar() -> [ItemFavorito] {
        Array(super.itens)
    }
}

struct ItemFavorito: Armazenável, Hashable, Codable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String?
    let tipo: Tipo
    
    init(armazenável: Armazenável) {
        self.id = armazenável.id
        self.nome = armazenável.nome
        self.preco = armazenável.preco
        self.imagem = armazenável.imagem
        self.descricao = armazenável.descricao
        self.tipo = armazenável.tipo
    }
}
