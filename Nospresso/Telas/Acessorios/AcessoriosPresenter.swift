//
//  AcessoriosPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 13/07/21.
//

import Foundation

protocol AcessoriosPresenterProtocol {
    func telaCarregou()
    func adicionouASacola()
    func favoritou()
}

class AcessoriosPresenter {
    let api: APIProtocol
    let favoritos: FavoritosProtocolo
    weak var tela: AcessoriosViewProtocol?
    
    init(api: API,
         favoritos: FavoritosProtocolo = Favoritos.instancia,
         tela: AcessoriosViewProtocol) {
        self.api = api
        self.favoritos = favoritos
        self.tela = tela
    }
}

extension AcessoriosPresenter: AcessoriosPresenterProtocol {
    func telaCarregou() {
        api.requisitar(endpoint: .acessorios) { [weak self] (categoriasAcessorios: [CategoriaAcessorio]) in
            self?.tela?.recebeu(categoriasAcessorios: categoriasAcessorios)
        } falha: { erro in
            // TODO
            print(erro)
        }
    }
    
    func adicionouASacola() {
        // TODO : Add to bag
    }
    
    func favoritou() {
        // TODO : Add to favorite
    }
}
