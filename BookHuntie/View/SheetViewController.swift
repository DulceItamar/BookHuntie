//
//  SheetViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/06/24.
//

import UIKit

class SheetViewController: UIViewController {

    private let searchLabel : UILabel = {
       let label = UILabel()
        label.text = "Serch book by author name"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var textField: UITextField?
    
    private lazy var searchButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Search"
        config.buttonSize = .medium
        config.titlePadding = 10.0
        let button = UIButton()
        button.backgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        button.configuration = config
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        button.layer.masksToBounds = true
        
        let attributes = NSAttributedString(string: config.title ?? " ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributes, for: .normal)
        
        return button
    }()
    
    
    private lazy var stackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
    
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
        
    }()
    
    private var bottomLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        
        return line
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        textField = UITextField.init(frame: CGRect.init(x: 0, y: 500, width: view.frame.size.width, height: 20))
        textField?.translatesAutoresizingMaskIntoConstraints = false
        textField?.placeholder = "Enter author's name"
        textField?.textColor = .black
        textField?.backgroundColor = .systemBackground
        textField?.borderStyle = .none
        
       
      
        
                
        textField?.addSubview(bottomLine)

        [searchLabel, textField!, searchButton].forEach { element in
            stackView.addArrangedSubview(element)
        }
    
        view.addSubview(stackView)
        
        
        view.backgroundColor = .systemBackground
        setup()
        sheetForSearchBooks()
    }
    
    private func setup() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
           
            
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomLine.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                       bottomLine.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                       bottomLine.bottomAnchor.constraint(equalTo: textField!.bottomAnchor, constant: 8),
                       bottomLine.heightAnchor.constraint(equalToConstant: 1)

        ])
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

}
