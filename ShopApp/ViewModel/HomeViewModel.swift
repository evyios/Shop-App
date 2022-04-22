//
//  HomeViewModel.swift
//  ShopApp
//
//  Created by Evgeny on 4.12.21.
//

import SwiftUI

//using Combine to monitor search field and if user leaves for 5 sec than starts searching
//to avoid memory issue
import Combine

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .Italy
    
    //Sample product
    @Published var products: [Product] = [
        Product(type: .Italy, title: "Chianti Classico", subtitle: "Red", price: "359$", productImage: "chianti"),
        Product(type: .Italy, title: "Fiano di Avellino", subtitle: "Red", price: "180$", productImage:  "fiano"),
        Product(type: .Italy, title: "Franciacorta", subtitle: "White", price: "250$", productImage: "franciacorta"),
        Product(type: .Portugal, title: "Quinta do Noval", subtitle: "Red", price: "199$", productImage: "p1"),
        Product(type: .Portugal, title: "Quinta do Vesuvio", subtitle: "Red", price: "249$", productImage: "p2"),
        Product(type: .Portugal, title: "Taylor’s Port", subtitle: "Red", price: "187$", productImage: "p3"),
        Product(type: .Portugal, title: "Lagoalva", subtitle: "Red", price: "220$", productImage: "p4"),
        Product(type: .Spain, title: "Jumilla", subtitle: "Red", price: "225$", productImage: "Jumilla"),
        Product(type: .Spain, title: "Rioja Gran Reserva", subtitle: "Red", price: "299$", productImage: "Rioja"),
        Product(type: .French, title: "Chateau Pierre de Montignac", subtitle: "Red", price: "340$", productImage: "f1"),
        Product(type: .French, title: "La Combe Saint-Paul", subtitle: "Red", price: "150$", productImage: "f2"),
        Product(type: .Spain, title: "Vinos de Pago", subtitle: "Red", price: "500$", productImage: "Vinos"),
    ]
    
    //Filtered products
    @Published var filteredProduct: [Product] = []
    
    //More products on the type
    @Published var showMoreProductsOnType: Bool = false
    
    //Search data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterProductBySearch()
                } else {
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            //Since it will require more memory so were using lazy to perform more
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            // Limiting results
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProduct = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            //Since it will require more memory so were using lazy to perform more
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}

