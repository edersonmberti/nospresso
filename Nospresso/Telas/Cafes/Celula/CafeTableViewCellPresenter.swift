//
//  CafeTableViewCellPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol CafeTableViewCellPresenterProtocol {
    func carregouCelula()
    func tocouEmFavoritar()
    func tocouEmAdicionarASacola()
}

class CafeTableViewCellPresenter {
    private let cafe: Cafe
    private let tela: CafeTableViewCellProtocol
    private let favoritos: FavoritosProtocol
    private let sacola: SacolaProtocol
    
    init(
        cafe: Cafe,
        tela: CafeTableViewCellProtocol,
        favoritos: Favoritos = Favoritos.instancia,
        sacola: Sacola = Sacola.instancia)
    {
        self.cafe = cafe
        self.tela = tela
        self.favoritos = favoritos
        self.sacola = sacola
    }
}

extension CafeTableViewCellPresenter: CafeTableViewCellPresenterProtocol {
    
    func carregouCelula() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: cafe)
        
        tela.atualizarDados(com: cafe)
        tela.atualizarFavorito(valor: estaFavoritado)
    }
    
    func tocouEmFavoritar() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: cafe)
        
        estaFavoritado
            ? favoritos.remover(favorito: cafe)
            : favoritos.adicionar(favorito: cafe)
        
        tela.atualizarFavorito(valor: !estaFavoritado)
    }
    
    func tocouEmAdicionarASacola() {
        sacola.adicionar(item: cafe)
    }
}
