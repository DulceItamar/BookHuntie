//
//  BookListCellView.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 17/06/24.
//

import Foundation
import UIKit
import SDWebImage

class BookListCellView: UITableViewCell {
    
    let bookImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let bookName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorName: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    func setupViews(){
        [bookImageView, bookName, authorName].forEach { view in
            addSubview(view)
        }
        
        
        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            bookImageView.heightAnchor.constraint(equalToConstant: 80),
            bookImageView.widthAnchor.constraint(equalToConstant: 80),
            
            bookName.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20),
            bookName.topAnchor.constraint(equalTo: bookImageView.topAnchor),
            
            authorName.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor),
            authorName.topAnchor.constraint(equalTo: bookName.bottomAnchor)
        ])
    }
    
    func configure(with book: BookModel) {
       
        
        bookName.text = book.title
        
        guard let image = book.format.image else { return }
        loadImage(url: image)
        
        guard let author = book.author.first else { return }
        authorName.text = author.name
    
    }
    
    func loadImage(url image: URL) {
        bookImageView.sd_setImage(with: image, placeholderImage: UIImage(named: "placeholder"))
  
    }
}




extension UIImageView {
    func loadImage(from url: URL) {
        // Set a placeholder image if needed
        self.image = UIImage(named: "placeholder")

        // Perform the download task on a background thread
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
