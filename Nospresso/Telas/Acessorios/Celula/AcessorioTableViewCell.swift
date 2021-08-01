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
    @IBOutlet weak var botaoSacola: UIButton!
    @IBOutlet weak var botaoFavorito: UIButton!
    
    var presenter: AcessorioTableViewCellPresenterProtocol?
    
    func configurar() {
        presenter?.carregouCelula()
    }
    
    @IBAction func tocouEmFavoritar(_ sender: Any) {
        presenter?.tocouEmFavoritar()
    }
    
    @IBAction func tocouEmAdicionarASacola(_ sender: Any) {
        presenter?.tocouEmAdicionarASacola()
    }
}

extension AcessorioTableViewCell: AcessorioTableViewCellProtocol {

    func atualizarDados(com acessorio: Acessorio) {
        tituloLabel.text = acessorio.nome
        precoLabel.text = acessorio.preco.comoDinheiro
        imagemImageView.carregarImagem(da: acessorio.imagem)
    }

    func atualizarFavorito(valor: Bool) {
        let nomeDoIcone = valor ? "heart.fill" : "heart"
        let icone = UIImage(systemName: nomeDoIcone)
        
        botaoFavorito.setImage(icone, for: .normal)
    }
}
