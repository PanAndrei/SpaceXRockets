//
//  LauchHistoryViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

// enum
let ident = "cell"
//

// show 0 launch message

class LauchHistoryViewController: UITableViewController {
    
    // MARK: - Properties
    
    var viewModel = LaunchPackViewModel()
    
    //
    var rocket = "5e9d0d95eda69973a809d1ec"
    //

        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: ident)
        tableView.estimatedRowHeight = 300
        
//        setupView()
        
        getLaunches()
    }
    
    // MARK: - Helpers
    
    func getLaunches() {
        viewModel.getLaunch(rocket) { (_) in
            self.tableView.reloadData()
        }
    }
    
//    func getLaunches() {
//        viewModel.getLaunch { (_) in
//            self.tableView.reloadData()
//        }
//    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.launchPack.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath) as! LaunchTableViewCell
        let launches = viewModel.launchPack[indexPath.row]
        
        cell.launches = launches
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 16
        let horizontalPadding: CGFloat = 16

            let maskLayer = CALayer()
            maskLayer.cornerRadius = 10    
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: horizontalPadding, dy: verticalPadding)
            cell.layer.mask = maskLayer
    }
}
