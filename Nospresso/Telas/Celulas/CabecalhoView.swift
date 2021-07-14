//
//  CabecalhoView.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import UIKit

class CabecalhoView: UIView {
    
    @IBOutlet weak var cabecaloLabel: UILabel!
    
    func configurar(texto: String) {
        cabecaloLabel.text = texto
    }
}
