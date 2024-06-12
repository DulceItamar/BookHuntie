//
//  ViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 08/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let menu = ["Serch Books", "Search History"]

    
    //MARK: - UI Elements
    lazy var segmentControlMenu: UISegmentedControl = {
        let view = UISegmentedControl(items: menu)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0


        return view
    }()
    
    private lazy var searchBookByAuthorNameButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Search a book by author name"
        config.titleAlignment = .center
        config.baseBackgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        
        
        let button = UIButton(configuration: config, primaryAction: UIAction(handler: { _ in
            self.showSearchBookOption()
        }))
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var searchBookByTitleButton : UIButton = {
       
        var config = UIButton.Configuration.bordered()
        config.title = "Search a book by title"
        config.baseBackgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        
        
        let button = UIButton(configuration: config, primaryAction: UIAction(handler: { _ in
            self.showSearchHistory()
        }))
        
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
        
    }()
    

    private let stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
   
    

    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        
        
        [segmentControlMenu, stackView].forEach { element in
            view.addSubview(element)
        }
     
        
        [searchBookByTitleButton, searchBookByAuthorNameButton].forEach { button in
            stackView.addArrangedSubview(button)
        }
        
        
       
            
        NSLayoutConstraint.activate([
        
            segmentControlMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentControlMenu.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentControlMenu.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            
            
            stackView.topAnchor.constraint(equalTo: segmentControlMenu.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            
         
            
            
        ])
        
 
    }
    
    
    func showSearchBookOption(){
        print("Searching book")
    }

    func showSearchHistory(){
        print("Search history")
    }
    
    
    @objc func buttonTapped(_ sender: UIButton){

        sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.2, delay: 0,
                       usingSpringWithDamping: CGFloat(1.0),
                       initialSpringVelocity: CGFloat(0.7),
                       options: [.allowAnimatedContent]) {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) // Enlarge the button slightly
                    } completion: { _ in
                        UIView.animate(withDuration: 0.2) {
                            sender.transform = CGAffineTransform.identity // Return to original size
                        }
        }


    }

        
        
    }



