//
//  Shops.swift
//  MadridShops
//
//  Created by Marta Roldán Arellano on 7/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

public protocol ShopsProtocol {
    func count() -> Int
    func add(shop: Shop)
    func get(index: Int) -> Shop
}

public class Shops: ShopsProtocol {
    private var shopsList: [Shop]?
    
    public init(){
        self.shopsList = []
    }
    
    public func count() -> Int {
        return (shopsList?.count)!
    }
    
    public func add(shop: Shop) {
        shopsList?.append(shop)
    }
    
    public func get(index: Int) -> Shop{
        return (shopsList?[index])!
    }
}
