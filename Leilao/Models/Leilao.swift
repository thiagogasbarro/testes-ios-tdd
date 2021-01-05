//
//  Leilao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance:Lance) {
        guard let listaDeLances = lances else { return }
        if listaDeLances.count == 0 || podeDarLande(lance.usuario, listaDeLances) {
            lances?.append(lance)
        }
    }
    
    private func ultimnoLance(_ lances:[Lance])-> Lance {
        return lances[lances.count-1]
    }
    
    private func podeDarLande(_ usuario:Usuario, _ listaDeLances:[Lance]) -> Bool {
        return ultimnoLance(listaDeLances).usuario != usuario && quantidadeLancesDoUsuario(usuario) < 5
    }
    
    private func quantidadeLancesDoUsuario(_ usuario:Usuario) -> Int {
        
        guard let listaDeLances = lances else { return 0 }
        var total = 0
        for lanceAtual in listaDeLances {
            if lanceAtual.usuario == usuario {
                total+=1
            }
        }
        
        return total
    }
    
}
