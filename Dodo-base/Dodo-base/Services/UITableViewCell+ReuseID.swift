//
//  UITableViewCell+ReuseID.swift
//  Dodo-base
//
//  Created by Игорь Мунгалов on 09.04.2025.
//

import Foundation

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    
    static var reuseID: String {
        return String.init(describing: self)
    }
}
