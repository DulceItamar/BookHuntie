//
//  ListOfBooksDataSource.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 24/06/24.
//

import Foundation
import UIKit

final class ListOfBooksTableViewDataSource: NSObject, UITableViewDataSource {

    

    
    private let tableView: UITableView
    
    private(set) var books: [BookModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, books: [BookModel] = []) {
        self.tableView = tableView
        self.books = books
    }
    
    //Cuantas celdas se van a mostrar en la tableView, dependera de los elementos que hay en books
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        books.count
    }
    
    
    //Representación visual de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       //Proporciona una celda para una fila específica de la tabla
        /**
         dequeueReusableCell - reutiliza una celda que ya no está en pantalla (para mejorar el rendimiento y la eficiencia de la memoria). Si no hay ninguna celda reutilizable disponible, se crea una nueva.
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCellView", for: indexPath) as! BookListCellView
        
        let book = books[indexPath.row]
       
        cell.configure(with: book)
       
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func set(books: [BookModel]) {
        
        self.books = books
    }

    
}
