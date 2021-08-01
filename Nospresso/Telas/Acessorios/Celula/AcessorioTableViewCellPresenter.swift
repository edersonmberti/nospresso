//
//  AcessorioTableViewCellPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol AcessorioTableViewCellPresenterProtocol {
    func carregouCelula()
    func tocouEmFavoritar()
    func tocouEmAdicionarASacola()
}

class AcessorioTableViewCellPresenter {
    private let acessorio: Acessorio
    private let tela: AcessorioTableViewCellProtocol
    private let favoritos: FavoritosProtocol
    private let sacola: SacolaProtocol
    
    init(
        acessorio: Acessorio,
        tela: AcessorioTableViewCellProtocol,
        favoritos: Favoritos = Favoritos.instancia,
        sacola: Sacola = Sacola.instancia)
    {
        self.acessorio = acessorio
        self.tela = tela
        self.favoritos = favoritos
        self.sacola = sacola
    }
}

extension AcessorioTableViewCellPresenter: AcessorioTableViewCellPresenterProtocol {
    
    func carregouCelula() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: acessorio)
        
        tela.atualizarDados(com: acessorio)
        tela.atualizarFavorito(valor: estaFavoritado)
    }
    
    func tocouEmFavoritar() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: acessorio)
        
        estaFavoritado
            ? favoritos.remover(favorito: acessorio)
            : favoritos.adicionar(favorito: acessorio)
        
        tela.atualizarFavorito(valor: !estaFavoritado)
    }
    
    func tocouEmAdicionarASacola() {
        sacola.adicionar(item: acessorio)
    }
}
