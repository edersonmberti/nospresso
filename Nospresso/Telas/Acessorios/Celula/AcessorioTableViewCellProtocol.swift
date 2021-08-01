//
//  AcessorioTableViewCellProtocol.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol AcessorioTableViewCellProtocol {
    func atualizarDados(com acessorio: Acessorio)
    func atualizarFavorito(valor: Bool)
}
