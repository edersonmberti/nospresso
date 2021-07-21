//
//  DetalhesAcessorioPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 14/07/21.
//

import Foundation

protocol DetalhesAcessorioPresenterProtocol {
    func telaCarregou()
    func tocouEmFavoritar()
    func tocouEmAdicionarASacola()
}

class DetalhesAcessorioPresenter {
    
    let acessorio: Acessorio
    let favoritos: FavoritosProtocol
    weak var tela: DetalhesAcessorioViewProtocol?
    
    init(acessorio: Acessorio,
         favoritos: FavoritosProtocol = Favoritos.instancia,
         tela: DetalhesAcessorioViewProtocol
    ) {
        self.acessorio = acessorio
        self.favoritos = favoritos
        self.tela = tela
    }
}

extension DetalhesAcessorioPresenter: DetalhesAcessorioPresenterProtocol {
    
    func telaCarregou() {
        tela?.configurar(acessorio: acessorio)
        tela?.atualizarFavorito(valor: favoritos.estaFavoritado(favorito: acessorio))
    }
    
    func tocouEmFavoritar() {
        let estaFavoritado = favoritos.estaFavoritado(favorito: acessorio)
        
        estaFavoritado
            ? favoritos.remover(favorito: acessorio)
            : favoritos.adicionar(favorito: acessorio)
        
        tela?.atualizarFavorito(valor: !estaFavoritado)
    }
    
    func tocouEmAdicionarASacola() {
        // TODO
    }
}
