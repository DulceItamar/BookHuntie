//
//  SearchView.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 21/06/24.
//

import Foundation
import UIKit

class SearchView: UIView {
    
     lazy var searchBookByAuthorNameButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Search a book by author name"
        config.titleAlignment = .center
        config.baseBackgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        
        
        let button = UIButton(configuration: config)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true

        return button
    }()
    
     lazy var searchBookByTitleButton : UIButton = {
       
        var config = UIButton.Configuration.bordered()
        config.title = "Search a book by title"
        config.baseBackgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
         config.buttonSize = .medium
        
        let button = UIButton(configuration: config)
        
         
        button.titleLabel?.textAlignment = .center
         
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true

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
    


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupView(){
        backgroundColor = .systemBackground
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews(){
        [searchBookByTitleButton, searchBookByAuthorNameButton].forEach { button in
            stackView.addArrangedSubview(button)
        }
         
        addSubview(stackView)
        addSubview(mainImage)
      
    }
    
    private func configureConstraints(){
        
        
        NSLayoutConstraint.activate([
            
     
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
           
            
            
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainImage.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            mainImage.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
            
        ])
    }
    
}
