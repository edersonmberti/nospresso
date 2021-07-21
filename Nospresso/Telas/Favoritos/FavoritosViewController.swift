//
//  FavoritosViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 16/07/21.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    lazy var presenter: FavoritosPresenterProtocol = FavoritosPresenter(tela: self)
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellReuseIdentifier = "favorito-celula"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurarTabela()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    private func configurarTabela() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension FavoritosViewController: FavoritosViewProtocol {
    func recarregarTabela() {
        tableView.reloadData()
    }
}

extension FavoritosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        96
    }
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numeroDeFavoritos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        if let celulaDeFavorito = celula as? FavoritoTableViewCell {
            let favorito = presenter.buscarFavorito(no: indexPath.row)
            
            celulaDeFavorito.configurar(com: favorito)
        }
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Comprar") { (action, view, completionHandler) in
            // TODO : - Adicionar à sacola!
            completionHandler(true)
        }
        action.backgroundColor = .verdãoVerde
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Remover") { [weak self] (action, view, completionHandler) in
            self?.presenter.removerFavorito(no: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
}
