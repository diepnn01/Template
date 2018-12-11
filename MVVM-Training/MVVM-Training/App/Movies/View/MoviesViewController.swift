//
//  MoviesViewController.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit
import CoreProject

final class MoviesViewController: BaseViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    private let viewModel = MoviesViewModel()
    
    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        viewModel.getListMovies(type: .Popular)
        viewModel.getListMovies(type: .TopRate)
        viewModel.getListMovies(type: .Upcoming)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        
        tableView.registerNib(CustomCell.className)
    }
    
    private func setupViewModel() {
        
        viewModel.loadMoviewSuccess?.subcribe(hdl: { [weak self](type: ListType) in
            guard let `self` = self else { return }
            self.tableView.reloadRows(at: [IndexPath(row: self.viewModel.getNumberRows() - 1, section: 0)], with: .fade)
        })
    }
    
    private func reloadTable(row: Int) {
        DispatchQueue.main.sync {
            self.tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .fade)
        }
    }
}

// MARK: - UITableView Datasources
extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        guard let collection = viewModel.getObjectList(index: indexPath.row) else {
            return cell
        }
        
        cell.configure(withViewModel: collection)
        return cell
    }
}

// MARK: - UITableView Delegate
extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270.0
    }
}
