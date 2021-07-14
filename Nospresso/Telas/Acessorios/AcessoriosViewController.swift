//
//  AcessoriosViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 09/07/21.
//

import UIKit

class AcessoriosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var carregandoActivityIndicator: UIActivityIndicatorView!
    
    private var categoriasAcessorios: [CategoriaAcessorio] = []
    
    var presenter: AcessoriosPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
        configurarTabela()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configurarBarraDeNavegação()
    }
    
    private func configurarTabela() {
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configurarBarraDeNavegação() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .cafes
        navigationController?.navigationBar.tintColor = .label
    }
}

extension AcessoriosViewController: AcessoriosViewProtocol {
    func recebeu(categoriasAcessorios: [CategoriaAcessorio]) {
        DispatchQueue.main.async {
            self.categoriasAcessorios = categoriasAcessorios
            self.carregandoActivityIndicator.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
}

extension AcessoriosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let secao = categoriasAcessorios[section]
        let cabecalho = UINib(nibName: "CabecalhoView", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as? CabecalhoView
        
        cabecalho?.configurar(texto: secao.categoria)
        
        return cabecalho
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quadroDeEstoria = UIStoryboard(name: "DetalhesAcessorio", bundle: .main)
        
        guard let controlador = quadroDeEstoria.instantiateViewController(withIdentifier: DetalhesAcessorioViewController.identificador) as? DetalhesAcessorioViewController else { return }
        
        let acessorio = categoriasAcessorios[indexPath.section].itens[indexPath.row]
    
        controlador.acessorio = acessorio
        
        navigationController?.present(controlador, animated: true)
    }
}

extension AcessoriosViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { categoriasAcessorios.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { categoriasAcessorios[section].itens.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "acessorio-celula", for: indexPath)

        if let celulaDeAcessorio = celula as? AcessorioTableViewCell {
            let item = categoriasAcessorios[indexPath.section].itens[indexPath.row]

            celulaDeAcessorio.configurar(com: item)
        }
        
        return celula
    }
}

extension AcessoriosViewController {
    
    static var identificador: String {
        String(describing: AcessoriosViewController.self)
    }
}
