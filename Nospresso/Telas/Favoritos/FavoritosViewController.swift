//
//  FavoritosViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 16/07/21.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    private var cafes: [Cafe] = []
    
    private let cellReuseIdentifier = "favorito-celula"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cafes = Favoritos.instancia.listar()
        self.configurarTabela()
    }
    
    private func configurarTabela() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        self.cafes = Favoritos.instancia.listar()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
}

extension FavoritosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        96
    }
}

extension FavoritosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        if let celulaDeFavorito = celula as? FavoritoTableViewCell {
            let cafe = cafes[indexPath.row]
            
            celulaDeFavorito.configurar(com: cafe)
        }
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Adicionar à sacola") { (action, view, completionHandler) in
            // TODO : - Adicionar à sacola!
            completionHandler(true)
        }
        action.backgroundColor = .verdãoVerde
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Remover") { [weak self] (action, view, completionHandler) in
            if let cafe = self?.cafes[indexPath.row] {
                Favoritos.instancia.remover(cafe: cafe)
                self?.cafes = Favoritos.instancia.listar()
                self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            completionHandler(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
}
