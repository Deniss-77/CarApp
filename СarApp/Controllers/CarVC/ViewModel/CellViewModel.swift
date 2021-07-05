//
//  CellViewModel.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

class CellViewModel: CellViewModelType {
    
    // MARK: Properties
    
    private var model: DataOfCars
    
    var modelName: String {
        return model.modelName
    }
    
    var releaseDate: String {
        return model.releaseDate
    }
    
    // MARK: Initializer
    
    init(cellViewModel: DataOfCars) {
        self.model = cellViewModel
    }
    
}
