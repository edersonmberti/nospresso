//
//  AcessorioTableViewCell.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 13/07/21.
//

import UIKit

class AcessorioTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!

    func configurar(com acessorio: Acessorio) {
       tituloLabel.text = acessorio.nome
       precoLabel.text = acessorio.preco.comoDinheiro
       imagemImageView.carregarImagem(da: acessorio.imagem)
    }
}
