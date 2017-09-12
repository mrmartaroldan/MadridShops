//
//  MadridShopsTests.swift
//  MadridShopsTests
//
//  Created by Marta Roldán Arellano on 12/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest
import MadridShops

class MadridShopsTests: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero() {
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopsWithOneElementNumberShopsIsOne() {
        let sut = Shops()
        sut.add(shop: Shop(name: "Shop"))
        XCTAssertEqual(1, sut.count())
    }
}
