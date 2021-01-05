//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDeveReceberUmLance() {
        let leilao = Leilao(descricao: "Macbook Pro 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let steveTrabalhos = Usuario(nome: "Steve Trabalhos")
        leilao.propoe(lance: Lance(steveTrabalhos, 2000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveReceberVariosLances() {
        let leilao = Leilao(descricao: "Macbook Pro 15")
        
        let steveTrabalhos = Usuario(nome: "Steve Trabalhos")
        leilao.propoe(lance: Lance(steveTrabalhos, 2000.0))
        
        let billPortoes = Usuario(nome: "Bill Portoes")
        leilao.propoe(lance: Lance(billPortoes, 1700.0))
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(1700.0, leilao.lances?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        
        let leilao = Leilao(descricao: "Macbook Pro")
        
        let steveTrabalhos = Usuario(nome: "Steve Trabalhos")
        leilao.propoe(lance: Lance(steveTrabalhos, 2000.0))
        leilao.propoe(lance: Lance(steveTrabalhos, 2300.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        
    }
    
    func testDeveIgnorarMaisDoQue5LancesDoMesmoUsuario() {
        let leilao = Leilao(descricao: "Macbook Pro")
        
        let steveTrabalhos = Usuario(nome: "Steve Trabalhos")
        let billPortoes = Usuario(nome: "Bill Portoes")
        
        leilao.propoe(lance: Lance(steveTrabalhos, 2000.0))
        leilao.propoe(lance: Lance(billPortoes, 3000.0))
        
        leilao.propoe(lance: Lance(steveTrabalhos, 4000.0))
        leilao.propoe(lance: Lance(billPortoes, 5000.0))
        
        leilao.propoe(lance: Lance(steveTrabalhos, 6000.0))
        leilao.propoe(lance: Lance(billPortoes, 7000.0))
        
        leilao.propoe(lance: Lance(steveTrabalhos, 8000.0))
        leilao.propoe(lance: Lance(billPortoes, 9000.0))
        
        leilao.propoe(lance: Lance(steveTrabalhos, 10000))
        leilao.propoe(lance: Lance(billPortoes, 11000))
        
        // deve ignorar
        
        leilao.propoe(lance: Lance(steveTrabalhos, 12000))
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(11000, leilao.lances?.last?.valor)

    }
    
}
