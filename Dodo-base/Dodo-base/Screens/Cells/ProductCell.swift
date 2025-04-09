
//  Created by Игорь Мунгалов on 09.04.2025.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    private var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.applyShadow(cornerRadius: 10)
        return $0
    }(UIView())
    
    var verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        
        //Внутренние отступы
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Гавайская"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var detailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Тесто, Цыпленок, моцарелла, томатный соус"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    var priceButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("от 469 руб", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.1) // сделать более прозрачно
        button.layer.cornerRadius = 20
        button.setTitleColor(.brown, for: .normal)
        //button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        print("!!!!! contentEdgeInsets' was deprecated in iOS 15.0: This property is ignored when using UIButtonConfiguration")
        return button
    }()
    
    var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("\(product.price) p", for: .normal)
        productImageView.image = UIImage(named: product.image)
        
    }
}

extension ProductCell {
    
    //    struct Layout {
    //        static let offset = 10
    //    }
    
    func setupViews() {
        [nameLabel, detailLabel, priceButton].forEach({ verticalStackView.addArrangedSubview($0) })
        [containerView].forEach({ contentView.addSubview($0) })
        [productImageView, verticalStackView].forEach { containerView.addSubview($0) }
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            productImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            verticalStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            verticalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            verticalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
    }
    
}


