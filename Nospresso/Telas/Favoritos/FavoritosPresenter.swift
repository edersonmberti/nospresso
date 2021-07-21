//
//  FavoritosPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 21/07/21.
//

import Foundation

protocol FavoritosPresenterProtocol {
    func numeroDeFavoritos() -> Int
    func buscarFavoritos() -> [ItemFavorito]
    func buscarFavorito(no indíce: Int) -> ItemFavorito
    func removerFavorito(favorito: ItemFavorito)
    func removerFavorito(no indíce: Int)
}

class FavoritosPresenter {
    
    private let favoritos: FavoritosProtocol
    private let tela: FavoritosViewProtocol
    
    init(favoritos: FavoritosProtocol = Favoritos.instancia, tela: FavoritosViewProtocol) {
        self.favoritos = favoritos
        self.tela = tela
        
        self.tela.recarregarTabela()
    }
}

extension FavoritosPresenter: FavoritosPresenterProtocol {
    
    func removerFavorito(no indíce: Int) {
        favoritos.remover(favorito: buscarFavorito(no: indíce))
    }
    
    func buscarFavorito(no indíce: Int) -> ItemFavorito {
        favoritos.listar()[indíce]
    }
    
    func removerFavorito(favorito: ItemFavorito) {
        favoritos.remover(favorito: favorito)
    }
    
    func buscarFavoritos() -> [ItemFavorito] {
        favoritos.listar()
    }
    
    func numeroDeFavoritos() -> Int {
        favoritos.listar().count
    }
}
