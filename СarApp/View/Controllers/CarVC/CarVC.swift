//
//  CarVC.swift
//  СarApp
//
//  Created by Denis Kravets on 01.07.2021.
//

import UIKit

class CarVC: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CarCell.nibName, bundle: nil), forCellReuseIdentifier: CarCell.identifier)
            tableView.register(UINib(nibName: HeaderView.nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    // MARK: Properties

    var viewModel: ViewModelType?
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: LifeCycleViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        activityIndicator.startAnimating()
        bindObserver()
        viewModel?.updateData()
    }
    
     // MARK: Methods
    
    func bindObserver() {
        viewModel?.generalObject.bind({ _ in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: Layout
    
    func setupLayout() {
        self.view.addSubview(activityIndicator)
        activityIndicator.style = .large
        activityIndicator.center = self.view.center
    }

}

// MARK: TableViewDataSourse and TableViewDelegate

extension CarVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.identifier, for: indexPath) as! CarCell
        let cellViewModel = viewModel?.cellViewModel(for: indexPath)
        cell.configure(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as! HeaderView
        let sectionViewModel = viewModel?.sectionViewModel(for: section)
        headerView.configure(viewModel: sectionViewModel)
        return headerView
 
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
