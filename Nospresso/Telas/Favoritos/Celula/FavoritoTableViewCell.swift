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
    
    func configurar(com favorito: ItemFavorito) {
        imagemImageView.carregarImagem(da: favorito.imagem)
        nomeLabel.text = favorito.nome
        tipoLabel.text = favorito.tipo.rawValue.uppercased()
        precoLabel.text = favorito.preco.comoDinheiro
    }
}
