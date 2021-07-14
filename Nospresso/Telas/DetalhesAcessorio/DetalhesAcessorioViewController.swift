//
//  DetalhesAcessorioViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 14/07/21.
//

import UIKit

class DetalhesAcessorioViewController: UIViewController {
    
    @IBOutlet weak var imagemImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var acessorio: Acessorio?
    
    func configurar() {
        if let acessorio = self.acessorio  {
            imagemImageView.carregarImagem(da: acessorio.imagem)
            tituloLabel.text = acessorio.nome
            precoLabel.text = acessorio.preco.comoDinheiro
            descricaoLabel.text = acessorio.descricao
        }
    }
}

extension DetalhesAcessorioViewController {
    
    static var identificador: String {
        String(describing: DetalhesAcessorioViewController.self)
    }
}
