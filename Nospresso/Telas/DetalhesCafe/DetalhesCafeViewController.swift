//
//  DetalhesCafeViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import UIKit

class DetalhesCafeViewController: UIViewController {

    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var intensidadeStackView: ContadorIntesidadeStackView!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var origemLabel: UILabel!
    @IBOutlet weak var torrefacaoLabel: UILabel!
    @IBOutlet weak var perfilAromaticoLabel: UILabel!
    
    var presenter: DetalhesCafePresenterProtocol?
    
    @IBAction func adicionouASacola(_ sender: Any) {
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.telaCarregou()
//        configurarBotaoFavorito()
    }
    
//    private func configurarBotaoFavorito() {
//        let botaoFavorito = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(toqueBotaoFavorito))
//
//        navigationItem.rightBarButtonItem = botaoFavorito
//    }
    
    @objc
    private func toqueBotaoFavorito() {
        presenter?.favoritou()
    }
    
//    deinit {
//        print("faleceu!!!")
//    }
}

extension DetalhesCafeViewController: DetalhesCafeViewProtocol {
    
    func recebeu(cafe: Cafe) {
        DispatchQueue.main.async {
            self.cafeImageView.carregarImagem(da: cafe.imagem)
            self.intensidadeStackView.configurar(com: cafe)
            self.origemLabel.text = cafe.origem
            self.torrefacaoLabel.text = cafe.torrefacao
            self.perfilAromaticoLabel.text = cafe.perfilAromatico
        }
    }
    
    func atualizarFavorito(valor: Bool) {
        let imagem = valor ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        let botaoFavorito = UIBarButtonItem(image: imagem, style: .plain, target: self, action: #selector(toqueBotaoFavorito))
        
        navigationItem.rightBarButtonItem = botaoFavorito
    }
}

extension DetalhesCafeViewController {
    
    static var identificador: String {
        String(describing: DetalhesCafeViewController.self)
    }
}
