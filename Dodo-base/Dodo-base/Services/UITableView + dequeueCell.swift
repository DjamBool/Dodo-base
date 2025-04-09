//
//  UITableView + dequeueCell.swift
//  Dodo-base
//
//  Created by Игорь Мунгалов on 09.04.2025.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeuCell<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell
        else { fatalError("Fatal error for cell at \(indexPath)") }
        
        return cell
    }
}
