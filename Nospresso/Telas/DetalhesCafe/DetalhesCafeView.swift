//
//  DetalhesCafeView.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import Foundation

protocol DetalhesCafeViewProtocol: AnyObject {
    func recebeu(cafe: Cafe)
    func atualizarFavorito(valor: Bool)
}
