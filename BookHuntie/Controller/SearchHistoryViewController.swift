//
//  SearchHistoryViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/06/24.
//

import UIKit

class SearchHistoryViewController: UIViewController {
    
    
    private let home: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()

      
    }
    
    
    private func addSubviews(){
        view.backgroundColor = .systemBackground
        view.addSubview(home)
                NSLayoutConstraint.activate([
                    home.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    home.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    home.heightAnchor.constraint(equalToConstant: 200),
                    home.widthAnchor.constraint(equalToConstant: 200)
                ])
                

    }
    


}
