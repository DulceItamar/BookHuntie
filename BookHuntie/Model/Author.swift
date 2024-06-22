//
//  Author.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 20/06/24.
//

import Foundation
struct Author: Decodable {
    let name: String
    let birthYear: Int?
    let deathYear: Int?
    
    enum CodingKeys : String, CodingKey {
        case name
        case birthYear = "birth_year"
        case deathYear = "death_year"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthYear = try container.decodeIfPresent(Int.self, forKey: .birthYear)
        self.deathYear = try container.decodeIfPresent(Int.self, forKey: .deathYear)
    }
}
