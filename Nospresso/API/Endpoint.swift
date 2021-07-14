//
//  Endpoint.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 10/06/21.
//

import Foundation

enum Endpoint {
    case sacola
    case cafes(id: Int)
    case capsulas
    case acessorios
    case maquinas
    
    var url: String {
        switch self {
        case .cafes(let id):
            return "cafes/\(id)"
        default:
            return "\(self)"
        }
    }
}
