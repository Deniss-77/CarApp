//
//  DataOfManufacturer.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

struct DataOfManufacturer: Codable {
    
    let id: String
    let brandName: String
    let founderNames: [String]
    let foundationDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case brandName = "brand_name"
        case founderNames = "founder_names"
        case foundationDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.brandName = try container.decode(String.self, forKey: .brandName)
        self.founderNames = try container.decode([String].self, forKey: .founderNames)
        self.foundationDate = try container.decode(String.self, forKey: .foundationDate)
    }

}
