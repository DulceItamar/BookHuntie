//
//  MainViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 18/06/24.
//

import UIKit

class BookListViewController: UIViewController {
    
    var mainView : BooksListView { self.view as! BooksListView }
    
    
    
    override func loadView() {
        view = BooksListView()
    }
    
}
//
//class MainViewController: UIViewController {
//
//    
//    
//    var mainView: BooksListView { self.view as! BooksListView }
//    
//    private var apiManager: APIClient?
//    
//    private var books: [BookModel] = []
//    
//    init(apiManager: APIClient = APIClient()) {
//        super.init(nibName: nil, bundle: nil)
//        self.apiManager = apiManager
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func loadView() {
//        view = BooksListView()
//    }
//    
//    
//    func fetchBook(book: String) async -> [BookModel] {
//           do {
//               if let results = try await apiManager?.apiClient(parameter: book) {
//                   return results
//               } else {
//                   return []
//               }
//           } catch {
//               print("Error fetching books: \(error)")
//               return []
//           }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        mainView.booksTableView.dataSource = self
//        mainView.booksTableView.delegate = self
//
//    }
//    
//    private func updateView(with books: [BookModel]){
//        self.books = books
//        mainView.booksTableView.reloadData()
//    }
//
//}
//
//extension MainViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return books.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCellView", for: indexPath) as! BookListCellView
//        let book = books[indexPath.row]
//        cell.configure(with: book)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
