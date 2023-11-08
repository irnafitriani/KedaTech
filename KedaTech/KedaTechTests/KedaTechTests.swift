//
//  KedaTechTests.swift
//  KedaTechTests
//
//  Created by irna fitriani on 08/11/23.
//

import XCTest
@testable import KedaTech

final class KedaTechTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoadProducts() {
        let controller = ProductController()
        controller.loadProducts()
        
        XCTAssertEqual(controller.products.count, 3)
        XCTAssertEqual(controller.products[0].name, "iPhone 14")
        XCTAssertEqual(controller.products[1].name, "iPad Pro")
        XCTAssertEqual(controller.products[2].name, "MacBook Air")
        XCTAssertFalse(controller.products[0].isFavorite)
        XCTAssertFalse(controller.products[1].isFavorite)
        XCTAssertFalse(controller.products[2].isFavorite)
    }
    
    func testToggleProductFavorite() {
        let controller = ProductController()
        controller.loadProducts()
        
        controller.toggleProductFavorite(product: controller.products[0])
        XCTAssertTrue(controller.products[0].isFavorite)
        
        controller.toggleProductFavorite(product: controller.products[0])
        XCTAssertFalse(controller.products[0].isFavorite)
    }
    
}
