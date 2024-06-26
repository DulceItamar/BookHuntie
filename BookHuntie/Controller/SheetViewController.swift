//
//  SheetViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/06/24.
//

import UIKit


class SheetViewController: UIViewController {
    
//    let mainViewController  = MainViewController()
    
    var mainView: SheetView { self.view as! SheetView}
//    private let sheetView = SheetView()
    
    override func loadView() {
        view = SheetView()
    }
    
    private let apiClient = APIClient()

    var searchLabelText: String?
    var placeholder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupSearchLabel()
        sheetForSearchBooks()
        setupActions()
    }
    
    
    func sheetForSearchBooks() {
        guard let presentationController = presentationController as? UISheetPresentationController else { return }

        presentationController.detents = [.custom(resolver: { _ in
            return 250
        })]
     
        presentationController.selectedDetentIdentifier = .medium
        presentationController.prefersGrabberVisible = true
        presentationController.preferredCornerRadius = 20
    }
    
    private func setupTextField() {

        mainView.searchTextField.placeholder = placeholder
        mainView.searchTextField.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
    }
    
    private func setupSearchLabel(){
        mainView.searchLabel.text =  searchLabelText
    }
    
    private func setupActions(){
        print("setupActions")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func searchButtonTapped(){
        
      
        Task{
            await fetchData()
        }
    }
    
    @objc private func textFieldDidChange(){
        
        mainView.searchButton.isEnabled = !(mainView.searchTextField.text?.isEmpty ?? true)
      
    }

    private func fetchData() async {
        var bookResponse: BookResponse? = nil
        if let text = mainView.searchTextField.text {
            
            do {
               bookResponse = try await apiClient.apiClient(parameter: text)
                
                print(bookResponse?.results ?? " Not found books")
                    print("Prueba con apiClient")
                
                
            } catch {
                print("Error fetching books: \(error.localizedDescription)")
            }
            guard let allBooks = bookResponse else { return }
            
            navigateToBookList(with: allBooks.results)
          

        }
       
    }
    
    
    private func navigateToBookList(with books: [BookModel]) {
        let bookListViewController = BooksListViewController()
        bookListViewController.bookResponse?.results = books
        self.navigationController?.pushViewController(bookListViewController, animated: true)
    }

    

}
