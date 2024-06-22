//
//  SheetView.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 21/06/24.
//

import Foundation
import UIKit

class SheetView: UIView {
    
    private let searchLabel : UILabel = {
       let label = UILabel()
     
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var searchButton: UIButton = {
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
//        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        
        return button
    }()
    
    var textField: UITextField?
    
    
    private lazy var stackView : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 30
        return stack
        
    }()
    
    private var bottomLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(red: 237/255, green: 203/255, blue: 228/255, alpha: 1.0)
        
        return line
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
        addSubview(stackView)
        [searchLabel, searchButton].forEach { element in
            stackView.addArrangedSubview(element)
        }
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
           
            
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bottomLine.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                       bottomLine.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                       bottomLine.bottomAnchor.constraint(equalTo: textField!.bottomAnchor, constant: 8),
                       bottomLine.heightAnchor.constraint(equalToConstant: 1)

        ])
    }
    
    
    private func setupTextField() {
        textField = UITextField.init(frame: CGRect.init(x: 0, y: 500, width: frame.size.width, height: 20))
        textField?.translatesAutoresizingMaskIntoConstraints = false
        
        
        textField?.textColor = .black
        textField?.backgroundColor = .systemBackground
        textField?.borderStyle = .none
        textField?.addSubview(bottomLine)
        
    }
}
