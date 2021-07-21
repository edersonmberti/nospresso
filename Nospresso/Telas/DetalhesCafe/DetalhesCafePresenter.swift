//
//  DetalhesCafePresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import Foundation

protocol DetalhesCafePresenterProtocol {
    func telaCarregou()
    func adicionouASacola()
    func favoritou()
}

class DetalhesCafePresenter {
    let api: APIProtocol
    let cafe: Cafe
    let favoritos: FavoritosProtocol
    weak var tela: DetalhesCafeViewProtocol?
    
    init(api: API,
         cafe: Cafe,
         favoritos: FavoritosProtocol = Favoritos.instancia,
         tela: DetalhesCafeViewProtocol) {
        self.api = api
        self.cafe = cafe
        self.favoritos = favoritos
        self.tela = tela
    }
}

extension DetalhesCafePresenter: DetalhesCafePresenterProtocol {
    func telaCarregou() {
        tela?.atualizarFavorito(valor: Favoritos.instancia.estaFavoritado(favorito: cafe))
        
        api.requisitar(endpoint: .cafes(id: cafe.id)) { [weak self] (cafe: Cafe) in
            self?.tela?.recebeu(cafe: cafe)
        } falha: { erro in
            // TODO
            print(erro)
        }
    }
    
    func adicionouASacola() {}
    
    func favoritou() {
        if Favoritos.instancia.estaFavoritado(favorito: cafe) {
            Favoritos.instancia.remover(favorito: cafe)
            tela?.atualizarFavorito(valor: false)
        } else {
            Favoritos.instancia.adicionar(favorito: cafe)
            tela?.atualizarFavorito(valor: true)
        }
    }
}
