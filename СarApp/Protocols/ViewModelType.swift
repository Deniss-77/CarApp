//
//  ViewModelType.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import UIKit

protocol ViewModelType {
    var generalObject: Boxing<GeneralModel?> { get }
    func numberOfSections() -> Int
    func numberOfRows(section: Int) -> Int
    func sectionViewModel(for section: Int) -> SectionViewModelType?
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelType?
    func updateData()
}
