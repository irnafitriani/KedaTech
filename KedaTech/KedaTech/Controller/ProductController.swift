//
//  ProductController.swift
//  KedaTech
//
//  Created by irna fitriani on 08/11/23.
//

import Foundation

class ProductController: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    @Published var showFavoritesOnly: Bool = false
    @Published var searchHistory: [String] = []

    init() {
        loadProducts()
    }

    func loadProducts() {
        products = [
            Product(id: UUID(), name: "iPhone 14", description: "iPhone 14. Dengan sistem kamera ganda paling hebat di iPhone. Ambil foto yang memukau dalam pencahayaan rendah maupun terang. Deteksi Tabrakan,1 sebuah fitur keselamatan baru, memanggil bantuan saat Anda tak bisa.", price: 13499000, isFavorite: false, imageUrl: "https://cdn.eraspace.com/media/catalog/product/i/p/iphone_14_blue_2_3_1_1.jpg"),
            Product(id: UUID(), name: "iPad Pro", description: "iPad Pro. Dengan performa yang menakjubkan, konektivitas nirkabel super cepat, dan pengalaman Apple Pencil generasi berikutnya. Ditambah, fitur produktivitas dan kolaborasi baru yang andal di iPadOS 16. iPad Pro adalah pengalaman iPad terbaik.", price: 14999000, isFavorite: false, imageUrl: "https://cdn.eraspace.com/media/catalog/product/a/p/apple_ipad_pro_2021_12.9-inci_wi-fi_silver_1_2_2.jpg"),
            Product(id: UUID(), name: "MacBook Air", description: "MacBook Air 15 inci luar biasa tipis dan dilengkapi layar Liquid Retina yang memukau. Bertenaga super berkat chip M2 — dan dengan kekuatan baterai hingga 18 jam (1) — MacBook Air ini menghadirkan performa luar biasa dalam desain yang ultra portabel.", price: 19999000, isFavorite: false, imageUrl: "https://cdn.eraspace.com/media/catalog/product/m/a/macbook_air_15_3_inci_m2_2023_starlight_1_4.jpg"),
        ]
    }

    func toggleProductFavorite(product: Product) {
        let productIndex = products.firstIndex { $0.id == product.id }!
        products[productIndex].isFavorite.toggle()
    }
}
