//
//  DataOfCars.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

struct DataOfCars: Codable {
    
    let brandID: String
    let modelName: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case brandID = "brand_id"
        case modelName
        case releaseDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.brandID = try container.decode(String.self, forKey: .brandID)
        self.modelName = try container.decode(String.self, forKey: .modelName)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
    
}
