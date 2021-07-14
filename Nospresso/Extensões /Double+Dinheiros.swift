//
//  Double+Dinheiros.swift
//  Nospresso
//
//  Created by Ederson Machado Berti on 12/06/21.
//

import Foundation

extension Double {
    
    var comoDinheiro: String {
            let formatter = NumberFormatter()
            formatter.locale = Locale.init(identifier: "pt-BR")
            formatter.numberStyle = .currency
            
            return formatter.string(from: NSNumber(value: self)) ?? ""
        }
}
