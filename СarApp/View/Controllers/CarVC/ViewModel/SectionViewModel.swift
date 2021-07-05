//
//  SectionViewModel.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

class SectionViewModel: SectionViewModelType {
    
    // MARK: Properties
    
    private let model: DataOfManufacturer
    
    var brandName: String {
        return model.brandName
    }
    
    var founderName: [String] {
        return model.founderNames
    }
    
    var foundationDate: String {
        return model.foundationDate
    }
    
    // MARK: Initializer
    
    init(sectionViewModel: DataOfManufacturer) {
        self.model = sectionViewModel
    }
    
}
