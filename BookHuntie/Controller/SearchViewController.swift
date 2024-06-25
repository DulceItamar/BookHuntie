//
//  SearchViewController.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/06/24.
//

import UIKit
import Foundation

final class SearchViewController: UIViewController {
    
    
   var mainView: SearchView { self.view as! SearchView}
    
    override func loadView() {
       
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupActions()
       
    }
    
    
    private func setupActions(){
        mainView.searchBookByAuthorNameButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        mainView.searchBookByTitleButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func searchBookByAuthorName(){
    
    
        let viewControllerToPresent = SheetViewController()
        viewControllerToPresent.searchLabelText = "Search book by author name"
        viewControllerToPresent.placeholder = "Enter author's name"
        
        present(viewControllerToPresent, animated: true)
        
        print("Searching book by author name ")
    }

    @objc private func searchBookByTitle(){
        
    
        let viewControllerToPresent = SheetViewController()
        viewControllerToPresent.searchLabelText = "Search book by title"
        viewControllerToPresent.placeholder = "Enter title"
        present(viewControllerToPresent, animated: true)
        
        print("Search book by title")
    }
    
    @objc func animateButton(_ sender: UIButton){
        
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
    
    @objc private func buttonTapped(_ sender: UIButton){
        animateButton(sender)
        
        if sender == mainView.searchBookByAuthorNameButton {
            searchBookByAuthorName()
        } else if sender == mainView.searchBookByTitleButton {
            searchBookByTitle()
        }
    }
    
    
}
