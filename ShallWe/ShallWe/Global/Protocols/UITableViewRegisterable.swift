//
//  UITableViewRegisterable.swift
//  ShallWe
//
//  Created by 고아라 on 2023/12/02.
//

import UIKit

public protocol UITableViewRegisterable where Self: UITableViewCell {
    static func register(tableView: UITableView)
    static func dequeueReusableCell(tableView: UITableView) -> Self
    static var reuseIdentifier: String { get }
}

extension UITableViewRegisterable {
    public static func register(tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    public static func dequeueReusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as? Self else { fatalError("Error! \(self.reuseIdentifier)") }
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

