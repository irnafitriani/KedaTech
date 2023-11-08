//
//  KedaTechApp.swift
//  KedaTech
//
//  Created by irna fitriani on 08/11/23.
//

import SwiftUI

let productController = ProductController()

@main
struct KedaTechApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(controller: productController)
        }
    }
}
