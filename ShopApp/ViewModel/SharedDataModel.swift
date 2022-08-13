//
//  SharedDataModel.swift
//  ShopApp
//
//  Created by Evgeny on 11.12.21.
//

import SwiftUI

class SharedDataModel: ObservableObject {
   
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    //Matched Geometry effect from search page
    @Published var fromSearchPage: Bool = false
    
    @Published var likedProducts: [Product] = []
    
    @Published var cartProducts: [Product] = []
    
    //Calculating Total Prict
    func getTotalPrice() -> String {
        var total: Int = 0
        
        cartProducts.forEach { product in
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        return "\(total)$"
    }
    
}
