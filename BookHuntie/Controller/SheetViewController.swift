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
    }
    
//    private func setup() {
//        
//    
//            searchLabel.text = searchLabelText
//
//        view.addSubview(stackView)
//        view.backgroundColor = .systemBackground
//        [searchLabel, textField!, searchButton].forEach { element in
//            stackView.addArrangedSubview(element)
//        }
//        
//        NSLayoutConstraint.activate([
//            
//            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
//           
//            
//            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            bottomLine.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//                       bottomLine.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//                       bottomLine.bottomAnchor.constraint(equalTo: textField!.bottomAnchor, constant: 8),
//                       bottomLine.heightAnchor.constraint(equalToConstant: 1)
//
//        ])
//        
//    }
    
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
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func searchButtonTapped(){
        Task{
            await fetchData()
        }
    }
    
    @objc private func textFieldDidChange(){
        
        mainView.searchButton.isEnabled = !(mainView.searchTextField.state.isEmpty)
        //searchButton.isEnabled = !(textField?.text?.isEmpty ?? true)
    }

    private func fetchData() async {
        if let text = mainView.searchTextField.text {
            
            do {
                 let allBooks2 = try await apiClient.apiClient(parameter: text)
                    print(allBooks2)
                    print("Prueba con apiClient")
                
                
            } catch {
                print("Error fetching books: \(error.localizedDescription)")
            }
          
          //  let allBooks = await mainViewController.fetchBook(book:text)

        }
        //navigateToSearchResults(with: allBooks)
    }
    
//    private func navigateToSearchResults(with books: [BookModel]){
//        let searchResultsVC = SearchResultsViewController()
//        searchResultsVC.books = books
//        
//        self.navigationController?.pushViewController(searchResultsVC, animated: true)
//    }
    

}
