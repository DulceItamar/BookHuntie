//
//  BooksListView.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 17/06/24.
//

import Foundation
import UIKit

class BooksListView: UIView {
    let booksTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookListCellView.self, forCellReuseIdentifier: "BookListCellView")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)  has not been implemented")
    }
    
    func setupView() {
        addSubview(booksTableView)
        
        NSLayoutConstraint.activate([
            booksTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            booksTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            booksTableView.topAnchor.constraint(equalTo: topAnchor),
            booksTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
