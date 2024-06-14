//
//  SearchViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/06/24.
//

import UIKit
import Foundation

final class SearchViewController: UIViewController {
    
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
    
    private let mainImage: UIImageView = {
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "books")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 120
        imageView.layer.masksToBounds = true
       
       
        return imageView
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
        setup()
    }

    
    private func setup() {
        view.backgroundColor = .systemBackground
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews(){
        [searchBookByTitleButton, searchBookByAuthorNameButton].forEach { button in
            stackView.addArrangedSubview(button)
        }
        view.addSubview(stackView)
        view.addSubview(mainImage)
        
    }
    
    private func configureConstraints(){
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
            
        ])
    }
    

    func showSearchBookOption(){
        print("Searching book")
        
        let viewControllerToPresent = SheetViewController()
        present(viewControllerToPresent, animated: true)
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
