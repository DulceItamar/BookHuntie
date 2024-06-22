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
    private let sheetView = SheetView()
    
    override func loadView() {
        view = sheetView
    }
    
    let apiClient = APIClient()

    var searchLabelText: String?
   
    var placeholder: String?
    
//    private let searchLabel : UILabel = {
//       let label = UILabel()
//     
//        label.font = .systemFont(ofSize: 24, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
  //  var textField: UITextField?
    
//    private lazy var searchButton: UIButton = {
//        var config = UIButton.Configuration.bordered()
//        config.title = "Search"
//        config.buttonSize = .medium
//        config.titlePadding = 10.0
//        let button = UIButton()
//        button.backgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
//        button.configuration = config
//        button.tintColor = .white
//        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
//        button.layer.masksToBounds = true
//        
//        let attributes = NSAttributedString(string: config.title ?? " ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
//        button.setAttributedTitle(attributes, for: .normal)
//        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
//        button.isEnabled = false
//        
//        return button
//    }()
//    
//    private lazy var stackView : UIStackView = {
//       let stack = UIStackView()
//        stack.axis = .vertical
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.spacing = 30
//        return stack
//        
//    }()
//    
//    private var bottomLine: UIView = {
//        let line = UIView()
//        line.translatesAutoresizingMaskIntoConstraints = false
//        line.backgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
//        
//        return line
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupActions()
       // setup()
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

        sheetView.textField?.placeholder = placeholder
        
        sheetView.textField?.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
    }
    
    private func setupActions(){
        sheetView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func searchButtonTapped(){
        Task{
            await fetchData()
        }
    }
    
    @objc private func textFieldDidChange(){
        
        sheetView.searchButton.isEnabled = !(sheetView.textField?.state.isEmpty ?? true)
        //searchButton.isEnabled = !(textField?.text?.isEmpty ?? true)
    }

    private func fetchData() async {
        if let text = sheetView.textField?.text {
            
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
