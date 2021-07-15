//
//  AcessoriosView.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 13/07/21.
//

import Foundation

protocol AcessoriosViewProtocol: AnyObject {
    func recebeuComSucesso(categoriasAcessorios: [CategoriaAcessorio])
    func recebeuComErro(mensagemDeError: String)
}
