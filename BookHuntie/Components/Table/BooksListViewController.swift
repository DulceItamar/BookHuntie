//
//  BooksListViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 24/06/24.
//

import UIKit

class BooksListViewController: UIViewController {
    
    var bookResponse: BookResponse? = nil

    var mainView: BooksListView { self.view as! BooksListView }
    
    private var tableViewDataSource: ListOfBooksTableViewDataSource?
    
    override func loadView() {
        view = BooksListView()
        
        tableViewDataSource = ListOfBooksTableViewDataSource(tableView: mainView.booksTableView)
        
        mainView.booksTableView.dataSource = tableViewDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let response = bookResponse else { return }
        tableViewDataSource?.set(books: response.results)

        // Do any additional setup after loading the view.
    }
    
    
}
