//
//  ViewModel.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import Foundation

class ViewModel: ViewModelType {
    
    // MARK: Properties
    
    private var networkManager = NetworkManager()
    private var arrayOfManufacturer: [DataOfManufacturer] = []
    private var arrayOfCars: [DataOfCars] = []
    var generalObject: Boxing<GeneralModel?> = Boxing(nil)
    
    // MARK: Methods
    
    func numberOfSections() -> Int {
        return arrayOfManufacturer.count
    }
    
    func numberOfRows(section: Int) -> Int {
        let currentData = arrayOfCars.filter({ $0.brandID == arrayOfManufacturer[section].id })
        return currentData.count
    }
    
    func sectionViewModel(for section: Int) -> SectionViewModelType? {
        let currentData = arrayOfManufacturer[section]
        return SectionViewModel(sectionViewModel: currentData)
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelType? {
        let filterArray = arrayOfCars.filter({ $0.brandID == arrayOfManufacturer[indexPath.section].id })
        let currentData = filterArray[indexPath.row]
        return CellViewModel(cellViewModel: currentData)
    }
    
    func updateData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        networkManager.fetchDataOfManufacturer { [weak self] result in
            switch result {
            case .success(let manufacturer):
                self?.arrayOfManufacturer = manufacturer
            case .failure:
                break
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchDataOfCars { [weak self] result in
            switch result {
            case .success(let cars):
                self?.arrayOfCars = cars
            case .failure:
                break
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.generalObject.value?.manufacturer = self.arrayOfManufacturer
            self.generalObject.value?.cars = self.arrayOfCars
        }
    }
    
}
