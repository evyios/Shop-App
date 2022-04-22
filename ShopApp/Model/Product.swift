//
//  Product.swift
//  ShopApp
//
//  Created by Evgeny on 4.12.21.
//

import SwiftUI

struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

enum ProductType: String, CaseIterable {
    case Italy = "Italy"
    case Spain = "Spain"
    case Portugal = "Portugal"
    case French = "French"
}
