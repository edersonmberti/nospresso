//
//  AcessoriosPresenter.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 13/07/21.
//

import Foundation

protocol AcessoriosPresenterProtocol {
    func buscarDados()
    func adicionouASacola()
    func favoritou()
}

class AcessoriosPresenter {
    let api: APIProtocol
    let favoritos: FavoritosProtocol
    weak var tela: AcessoriosViewProtocol?
    
    init(api: API,
         favoritos: FavoritosProtocol = Favoritos.instancia,
         tela: AcessoriosViewProtocol) {
        self.api = api
        self.favoritos = favoritos
        self.tela = tela
    }
}

extension AcessoriosPresenter: AcessoriosPresenterProtocol {
    func buscarDados() {
        api.requisitar(endpoint: .acessorios) { [weak self] (categoriasAcessorios: [CategoriaAcessorio]) in
            self?.tela?.recebeuComSucesso(categoriasAcessorios: categoriasAcessorios)
        } falha: { erro in
            self.tela?.recebeuComErro(mensagemDeError: erro.localizedDescription)
        }
    }
    
    func adicionouASacola() {
        // TODO : Add to bag
    }
    
    func favoritou() {
        // TODO : Add to favorite
    }
}
