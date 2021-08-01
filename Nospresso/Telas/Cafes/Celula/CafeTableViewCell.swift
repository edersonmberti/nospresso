//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 12/06/21.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var capsulaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var botaoFavorito: UIButton!
    
    var presenter: CafeTableViewCellPresenterProtocol?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        intensidadeLabel.isHidden = false
    }
    
    func configurar() {
        presenter?.carregouCelula()
    }
    
    @IBAction func tocouEmFavoritar(_ sender: Any) {
        presenter?.tocouEmFavoritar()
    }
}

extension CafeTableViewCell: CafeTableViewCellProtocol {
    func atualizarDados(com cafe: Cafe) {
        capsulaImageView.carregarImagem(da: cafe.imagem)
        tituloLabel.text = cafe.nome
        descricaoLabel.text = cafe.descricao?.capitalized
        precoLabel.text = cafe.preco.comoDinheiro
        
        if let intesidade = cafe.intensidade {
            intensidadeLabel.text = "Intensidade: \(intesidade)"
        } else {
            intensidadeLabel.isHidden = true
        }
    }
    
    func atualizarFavorito(valor: Bool) {
        let nomeDoIcone = valor ? "heart.fill" : "heart"
        let icone = UIImage(systemName: nomeDoIcone)
        
        botaoFavorito.setImage(icone, for: .normal)
    }
}
