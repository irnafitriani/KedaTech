//
//  ContentView.swift
//  KedaTech
//
//  Created by irna fitriani on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var controller: ProductController
    
    var filteredProducts: [Product] {
        if controller.searchText.isEmpty {
            return controller.products
        }
        
        return controller.products.filter {
            $0.name.lowercased().contains(controller.searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                if controller.showFavoritesOnly {
                    ForEach(filteredProducts.filter { $0.isFavorite }) { product in
                        NavigationLink(destination: ProductDetailsView(product: product, controller: controller)) {
                            ProductRowView(product: product, controller: controller)
                        }
                    }
                } else {
                    ForEach(filteredProducts) { product in
                        NavigationLink(destination: ProductDetailsView(product: product, controller: controller)) {
                            ProductRowView(product: product, controller: controller)
                        }
                    }
                }
            }
            .navigationTitle(controller.showFavoritesOnly ? "Favorites" : "Products")
            .searchable(text: $controller.searchText) {
                ForEach(controller.searchHistory, id: \.self) { suggestion in
                    Text(suggestion)
                        .onTapGesture {
                            controller.searchText = suggestion
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Favorites") {
                        controller.showFavoritesOnly.toggle()
                    }
                }
            }
        }
    }
}

struct ProductRowView: View {
    let product: Product
    let controller: ProductController
    
    var body: some View {
        HStack {
            Image(systemName: product.isFavorite ? "heart.fill" : "heart")
            Text(product.name)
            Spacer()
            if let imageURL = URL(string: product.imageUrl) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50) // Set your desired size
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundColor(.gray)
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundColor(.gray)
            }
        }
        .onTapGesture {
            controller.toggleProductFavorite(product: product)
        }
    }
}

struct ProductDetailsView: View {
    let product: Product
    @ObservedObject var controller: ProductController
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.imageUrl)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
            }
            Text(product.name)
                .font(.title)
            
            Spacer().frame(height: 30)
            
            Text("Price: Rp. \(product.price, specifier: "%.2f")")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
            
            Spacer().frame(height: 30)
            
            Text(product.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
            
            
            Spacer()
            
            Button(product.isFavorite ? "Remove from Favorite" : "Add to Favorite") {
                controller.toggleProductFavorite(product: product)
            }
        }
        .navigationTitle(product.name)
    }
}

#Preview {
    ContentView(controller: ProductController())
}
