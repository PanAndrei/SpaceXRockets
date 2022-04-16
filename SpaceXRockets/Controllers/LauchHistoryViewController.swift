//
//  LauchHistoryViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class LauchHistoryViewController: UITableViewController {
    
    // MARK: - Properties
    
    var viewModel = LaunchPackViewModel()
    var rocket = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        getLaunches()
    }
    
    // MARK: - Helpers
    
    func setupView() {
        view.backgroundColor = .black
        
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: Keys.cellIdentifier.rawValue)
        tableView.estimatedRowHeight = 300
    }
    
    func getLaunches() {
        viewModel.getLaunch(rocket) { (_) in
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.launchPack.count > 0 ? viewModel.launchPack.count : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier.rawValue, for: indexPath) as! LaunchTableViewCell
        
        if viewModel.launchPack.count == 0 {
            let launches = Launch.init(rocket: Pictures.success.rawValue, success: true, name: "На сегодняшний день еще ожидаем", date_utc: "")
            cell.launches = LaunchViewModel.init(launches: launches)
            return cell ?? UITableViewCell()
        } else {
            let launches = viewModel.launchPack[indexPath.row]
            cell.launches = launches
            return cell ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8
        let horizontalPadding: CGFloat = 16
        
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width,
                                 height: cell.bounds.height).insetBy(dx: horizontalPadding, dy: verticalPadding)
        cell.layer.mask = maskLayer
    }
}
