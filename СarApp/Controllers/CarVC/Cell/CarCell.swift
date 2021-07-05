//
//  CarCell.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import UIKit

class CarCell: UITableViewCell, Identifiable {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: CellViewModelType?) {
        modelNameLabel.text = viewModel?.modelName
        releaseDateLabel.text = viewModel?.releaseDate
    }
    
}
