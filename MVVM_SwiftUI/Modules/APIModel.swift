//
//  APIModel.swift
//  MVVM_SwiftUI
//
//  Created by MANOJ SOLANKI on 12/09/21.
//

import Foundation

struct APIList: Decodable {
    enum CodingKeys: String, CodingKey {
        case apiModels = "entries"
    }
    let apiModels : [APIModel]
}

struct APIModel: Decodable, Identifiable  {
    
    enum CodingKeys: String, CodingKey {
        case API, Category
             // Map the JSON key "url" to the Swift property name "htmlLink"
        case htmlLink = "Link"
    }
    
    var id = UUID()
    let API : String
    let Category : String
    let htmlLink : String
}
