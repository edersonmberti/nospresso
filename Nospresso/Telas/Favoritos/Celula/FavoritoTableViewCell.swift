//
//  FavoritoTableViewCell.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 16/07/21.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    var presenter: FavoritoTableViewCellPresenterProtocol?
    
    func configurar() {
        presenter?.carregouCelula()
    }
}

extension FavoritoTableViewCell: FavoritoTableViewCellProtocol {
    func atualizarDados(com favorito: ItemFavorito) {
        imagemImageView.carregarImagem(da: favorito.imagem)
        nomeLabel.text = favorito.nome
        tipoLabel.text = favorito.tipo.rawValue.uppercased()
        precoLabel.text = favorito.preco.comoDinheiro
    }
    
    func atualizarFavorito(valor: Bool) {
        // TODO : Atualizar Favorito
    }
}
