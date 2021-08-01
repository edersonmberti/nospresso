//
//  FavoritoTableViewCellProtocol.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol FavoritoTableViewCellProtocol {
    func atualizarDados(com favorito: ItemFavorito)
    func atualizarFavorito(valor: Bool)
}
