//
//  FavoritoTableViewCellPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol FavoritoTableViewCellPresenterProtocol {
    func carregouCelula()
    func tocouEmFavoritar()
    func tocouEmAdicionarASacola()
}

class FavoritoTableViewCellPresenter {
    private let favorito: ItemFavorito
    private let tela: FavoritoTableViewCellProtocol
    private let favoritos: FavoritosProtocol
    private let sacola: SacolaProtocol
    
    init(
        favorito: ItemFavorito,
        tela: FavoritoTableViewCellProtocol,
        favoritos: Favoritos = Favoritos.instancia,
        sacola: Sacola = Sacola.instancia)
    {
        self.favorito = favorito
        self.tela = tela
        self.favoritos = favoritos
        self.sacola = sacola
    }
}

extension FavoritoTableViewCellPresenter: FavoritoTableViewCellPresenterProtocol {
    
    func carregouCelula() {
        tela.atualizarDados(com: favorito)
    }
    
    func tocouEmFavoritar() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: favorito)
        
        estaFavoritado
            ? favoritos.remover(favorito: favorito)
            : favoritos.adicionar(favorito: favorito)
        
        tela.atualizarFavorito(valor: !estaFavoritado)
    }
    
    func tocouEmAdicionarASacola() {
        sacola.adicionar(item: favorito)
    }
}
