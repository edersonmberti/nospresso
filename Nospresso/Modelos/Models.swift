//
//  Models.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 12/06/21.
//

import Foundation

struct Capsulas: Decodable {
    let categoria: String
    let cafes: [Cafe]
}

struct Cafe: Armazenável, Codable {
    var tipo = Tipo.cafe
    
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String?
    let imagem: String
    let intensidade: Int?
    let medidas: [MedidaCafe]
    let origem: String?
    let torrefacao: String?
    let perfilAromatico: String?
    
    enum MedidaCafe: String, Codable {
        case ristretto
        case espresso
        case lungo
    }
    
    enum CodingKeys: String, CodingKey {
        case id, nome, descricao, imagem, medidas, origem, torrefacao, perfilAromatico, intensidade
        case preco = "precoUnitario"
    }
}

struct CategoriaAcessorio: Codable {
    let categoria: String
    let itens: [Acessorio]
}

struct Acessorio: Armazenável, Codable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String?
    
    var tipo = Tipo.acessorio
    
    enum CodingKeys: String, CodingKey {
        case id, nome, descricao, imagem, preco
    }
}

struct Maquina: Armazenável, Codable {
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String?
    let imagem: String
    
    var tipo = Tipo.maquina
    
    enum CodingKeys: String, CodingKey {
        case id, nome, descricao, imagem, preco
    }
}
