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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurar(com cafe: Cafe) {
        imagemImageView.carregarImagem(da: cafe.imagem)
        nomeLabel.text = cafe.nome
        tipoLabel.text = "Café".uppercased()
        precoLabel.text = cafe.preco.comoDinheiro
    }
}
