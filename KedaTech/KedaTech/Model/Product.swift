//
//  Product.swift
//  KedaTech
//
//  Created by irna fitriani on 08/11/23.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let price: Double
    var isFavorite: Bool
    let imageUrl: String
}
