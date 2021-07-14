//
//  ContadorIntesidadeStackView.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 19/06/21.
//

import UIKit

class ContadorIntesidadeStackView: UIStackView {
    
    private let intesidadeMaxima = 13
    // CoreGraphics
    private let tamanhoBolinha: CGFloat = 7
    
    // Quando iniciado pelo storyboard ou xip precisa ser através deste init
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        spacing = 1.5
        axis = .horizontal
        distribution = .fill
    }
    
    func configurar(com cafe: Cafe) {
        if let intesidade = cafe.intensidade {
            adicionarBolinha(para: intesidade)
        }
    }
    
    private func adicionarBolinha(para quantidade: Int) {
        let quantidadeDeBolasVazias = intesidadeMaxima - quantidade
        
        for _ in 0..<quantidade {
            let bolinha = gerarBolinha(preechido: true)
            
            addArrangedSubview(bolinha)
        }
        
        for _ in 0..<quantidadeDeBolasVazias {
            let bolinha = gerarBolinha(preechido: false)
            
            addArrangedSubview(bolinha)
        }
        
        addArrangedSubview(.init())
    }
    
    private func gerarBolinha(preechido: Bool) -> UIView {
        let bolinha = UIView()
        
        //        bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha).isActive = true
        
        NSLayoutConstraint.activate([
            bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha),
            bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha)
        ])
        
        bolinha.layer.cornerRadius = tamanhoBolinha / 2
        bolinha.layer.borderWidth = 0.4
        bolinha.layer.borderColor = preechido ? UIColor.black.cgColor : UIColor.bordaIntensidadeVazia?.cgColor
        bolinha.backgroundColor = preechido ? .intensidadePreenchida : .intensidadeVazia
        
        return bolinha
    }
}
