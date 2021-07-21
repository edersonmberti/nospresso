//
//  DetalhesAcessorioView.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 14/07/21.
//

import Foundation

protocol DetalhesAcessorioViewProtocol: AnyObject {
    func configurar(acessorio: Acessorio)
    func atualizarFavorito(valor: Bool)
}
