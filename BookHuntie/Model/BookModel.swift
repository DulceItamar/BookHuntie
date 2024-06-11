//
//  BookModel.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 09/06/24.
//

import Foundation


struct BookModel: Decodable {
    let title: String
    let author: [Author]
    let image: String
    let downloadCount: Int
    let language: [String]
    
    
    
    
    enum CodingKeys:String, CodingKey {
        case title
        case author = "authors"
        case formats
        case image = "image/jpeg"
        case downloadCount = "download_count"
        case language = "languages"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.author = try container.decode([Author].self, forKey: .author)
        self.downloadCount = try container.decode(Int.self, forKey: .downloadCount)
        self.language = try container.decode([String].self, forKey: .language)
        
        let format = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .formats)
        self.image = try format.decode(String.self, forKey: .image)
    }
    
    
}


struct Author: Decodable {
    let name: String
    let birthYear: Int
    let deathYear: Int
    
    enum CodingKeys : String, CodingKey {
        case name
        case birthYear = "birth_year"
        case deathYear = "death_year"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthYear = try container.decode(Int.self, forKey: .birthYear)
        self.deathYear = try container.decode(Int.self, forKey: .deathYear)
    }
}


struct Books: Decodable {
    let ok: Bool
    let books: [BookModel]
}
