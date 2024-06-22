//
//  BookModel.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 09/06/24.
//

import Foundation
import UniformTypeIdentifiers

struct BookModel: Decodable {
    let title: String
    let author: [Author]
    let format: Formats
    let downloadCount: Int
    let language: [String]
    
    
    enum CodingKeys:String, CodingKey {
        case title
        case author = "authors"
        case formats
        case downloadCount = "download_count"
        case language = "languages"
    }
    

    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.author = try container.decode([Author].self, forKey: .author)
        self.downloadCount = try container.decode(Int.self, forKey: .downloadCount)
        self.language = try container.decode([String].self, forKey: .language)
        self.format = try container.decode(Formats.self, forKey: .formats)
   
    }
    
    // Inicializador por defecto
    init(
        title: String = "",
        author: [Author] = [],
        format: Formats,
        downloadCount: Int ,
        language: [String] = []
    ) {
         self.title = title
         self.author = author
        self.format = format
         self.downloadCount = downloadCount
         self.language = language
     }
    
    
}


struct Formats: Decodable {
    
     let image: URL?
   
    enum CodingKeys: String, CodingKey {
        case image = "image/jpeg"
    }
    
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeIfPresent(URL.self, forKey: .image)
        
    }
}



