//
//  HeaderView.swift
//  СarApp
//
//  Created by Denis Kravets on 05.07.2021.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView, Identifiable {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var founderNameLabel: UILabel!
    @IBOutlet weak var foundationDateLabel: UILabel!
    
    // MARK: Methods
    
    func configure(viewModel: SectionViewModelType?) {
        brandNameLabel.text = viewModel?.brandName
        founderNameLabel.text = viewModel?.founderName.first
        foundationDateLabel.text = viewModel?.foundationDate
    }
}
