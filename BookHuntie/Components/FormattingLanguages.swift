//
//  FormattingLanguages.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/06/24.
//

import Foundation


enum Language: String, CodingKey, Decodable {
    case ENGLISH = "en"
    case GERMAN = "de"
    case SPANISH = "es"
    case PORTUGUESE = "pt"
    case ITALIAN = "it"
    case RUSSIAN = "ru"
    case CHINESE = "zh"
    case FRECH = "fr"
    
}

class FormattingLanguages {
    
    func showLanguage( _ language: Language) -> String {
        switch language {
            case .ENGLISH:
                return "English"
            case .GERMAN:
                return "german"
            case .SPANISH:
               return "spanish"
            case .PORTUGUESE:
                return "Portuguese"
            case .ITALIAN:
                return "Italian"
            case .RUSSIAN:
                return "Russian"
            case .CHINESE:
                return "Chinese"
            case .FRECH:
                return "French"
        }
    }
    
}
