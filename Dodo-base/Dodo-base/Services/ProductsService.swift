
//  Created by Игорь Мунгалов on 09.04.2025.
//

import Foundation

class ProductsService {
    private let products: [Product] = [
        Product(name: "Гавайская", detail: "Тесто, Cыр, Буженина", price: 590, image: "hawaii"),
        Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "margarita"),
        Product(name: "Пепперони", detail: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pepperoni")
    ]
    
    func fetchProducts() -> [Product] {
        return products
    }
}
