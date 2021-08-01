//
//  SacolaViewController.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 31/07/21.
//

import UIKit

class SacolaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarTabela()
    }
    
    private func configurarTabela() {
        tableView.delegate = self
    }
}

extension SacolaViewController: UITableViewDelegate {}
