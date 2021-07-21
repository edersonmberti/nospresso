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
    
    private var acessorio: Acessorio?
    private var favoritos: FavoritosProtocol?
    
    func configurar(com acessorio: Acessorio, favoritos: FavoritosProtocol = Favoritos.instancia) {
        self.acessorio = acessorio
        self.favoritos = favoritos
        
        tituloLabel.text = acessorio.nome
        precoLabel.text = acessorio.preco.comoDinheiro
        imagemImageView.carregarImagem(da: acessorio.imagem)

        let estaFavoritado = favoritos.estaFavoritado(favorito: acessorio)
        alterarIconeBotaoFavorito(estaFavoritado: estaFavoritado)
    }
    
    @IBAction func tocouEmFavoritar(_ sender: Any) {
        if let acessorio = acessorio {
            if let favoritos = favoritos {
                let estaFavoritado = favoritos.estaFavoritado(favorito: acessorio)
                
                estaFavoritado
                    ? favoritos.remover(favorito: acessorio)
                    : favoritos.adicionar(favorito: acessorio)
                
                alterarIconeBotaoFavorito(estaFavoritado: !estaFavoritado)
            }
        }
    }
    
    private func alterarIconeBotaoFavorito(estaFavoritado: Bool) {
        let nomeDoIcone = estaFavoritado ? "heart.fill" : "heart"
        let icone = UIImage(systemName: nomeDoIcone)
        
        botaoFavorito.setImage(icone, for: .normal)
    }
}
