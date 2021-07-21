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
    @IBOutlet weak var botaoFavoritar: UIButton!
    
    var presenter: DetalhesAcessorioPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.telaCarregou()
    }
    
    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true) {}
    }
    
    @IBAction func tocouEmFavoritar(_ sender: Any) {
        presenter?.tocouEmFavoritar()
    }
    
    
    @IBAction func tocouEmAdicionarASacola(_ sender: Any) {
        presenter?.tocouEmAdicionarASacola()
    }
}

extension DetalhesAcessorioViewController: DetalhesAcessorioViewProtocol {
    
    func configurar(acessorio: Acessorio) {
        imagemImageView.carregarImagem(da: acessorio.imagem)
        tituloLabel.text = acessorio.nome
        precoLabel.text = acessorio.preco.comoDinheiro
        descricaoLabel.text = acessorio.descricao
    }
    
    func atualizarFavorito(valor: Bool) {
        let nomeDoIcone = valor ? "heart.fill" : "heart"
        let corDoIcone = valor ? UIColor(named: "favorito-preenchido") : .black
        let icone = UIImage(systemName: nomeDoIcone)
        
        botaoFavoritar.setImage(icone, for: .normal)
        botaoFavoritar.tintColor = corDoIcone
    }
}

extension DetalhesAcessorioViewController {
    
    static var identificador: String {
        String(describing: DetalhesAcessorioViewController.self)
    }
}
