//
//  ViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 10/06/21.
//

import UIKit

class MenuProdutoViewController: UIViewController {

    private lazy var api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func navegarParaAcessorios(_ sender: Any) {
        let quadroDeEstoria = UIStoryboard(name: "Acessorios", bundle: .main)
        
        guard let controlador = quadroDeEstoria.instantiateViewController(withIdentifier: AcessoriosViewController.identificador) as? AcessoriosViewController else { return }
        
        
        let presenter = AcessoriosPresenter(
            api: api,
            tela: controlador
        )
        
        controlador.presenter = presenter
        
        navigationController?.pushViewController(controlador, animated: true)
    }
}
