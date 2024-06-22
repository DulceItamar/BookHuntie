//
//  SearchBookByTitleOrAuthorName.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/24.
//

import Foundation


enum BookConsultingMethod: CaseIterable {
    case authorName
    case title
}


class SearchBookByTitleOrAuthorName {
    
    func selectingBoolConsultingMethod( method: BookConsultingMethod) -> String {
        switch method {
            case .authorName:
               return "Serch book by author name"
            case .title:
                return "Search book by title"
        }
    }
}
