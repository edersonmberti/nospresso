//
//  CafeTableViewCellProtocol.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import Foundation

protocol CafeTableViewCellProtocol {
    func atualizarDados(com cafe: Cafe)
    func atualizarFavorito(valor: Bool)
}
