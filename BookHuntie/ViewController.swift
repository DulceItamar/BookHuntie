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
        
        
        view.addTarget(self , action: #selector(selectAnOption(_:)), for: .valueChanged)
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var searchBookViewController = {
        let vc = SearchViewController()
        self.add(childViewController: vc)
        return vc
    }()
    
    private lazy var searchHistoryViewController = {
       let vc = SearchHistoryViewController()
        self.add(childViewController: vc)
        return vc
    }()

    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        searchBookViewController.view.isHidden = false
    }
    
    
    func setupViews(){
   
      
        
       // segmentControlMenu.insertSegment(withTitle: menu[0], at: 0, animated: false)
        //segmentControlMenu.insertSegment(withTitle: menu[1], at: 1, animated: false)
        //segmentControlMenu.selectedSegmentIndex = 0
        
        view.addSubview(containerView)
        view.addSubview(segmentControlMenu)
        
        NSLayoutConstraint.activate([
        
            
            segmentControlMenu.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            segmentControlMenu.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            segmentControlMenu.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            
        
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor),
           
        
        ])
        
    }
    
    
    func add(childViewController: UIViewController){
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.frame
        childViewController.didMove(toParent: self)
        
        
    }
    
    func remove(childViewController: UIViewController){
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
    
    
    @objc private func selectAnOption(_ sender: UISegmentedControl) {

        searchBookViewController.view.isHidden = sender.selectedSegmentIndex == 1
        searchHistoryViewController.view.isHidden = sender.selectedSegmentIndex == 0
    }

    }



