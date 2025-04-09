
//  Created by Игорь Мунгалов on 07.04.2025.

import UIKit

final class MenuScreenVC: UIViewController {
    let productService = ProductsService()
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .orange
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
    private func fetchProducts() {
        products = productService.fetchProducts()
    }
}
    
extension MenuScreenVC {
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}



extension MenuScreenVC:  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.update(product)
        return cell
    }
    
    
}

extension MenuScreenVC: UITableViewDelegate {
    
}
