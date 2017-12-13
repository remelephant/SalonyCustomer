//
//  SalonListTableViewController.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit
import Kingfisher

class SalonListTableViewController: UITableViewController, UIActivityPresenter {
    
    /// handling all network operations, data fetching operations and data parsing operations
    let server = SalonAPI()
    
    /// cell reusable identifier
    let reusableIdentifier = "SalonCell"
    
    /// ActivityIndicatorPresenter protocol properties
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var whiteView: UIView = UIView()
    
    /// tableView datasource, reloading after setting
    var dataSource: [ModelSalon] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimating()
        tableView.tableFooterView = UIView()
        server.obtainSalonCollection() { [weak self] salons in
            if let salons = salons {
                self?.dataSource = salons
                self?.stopAnimating()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath {
            if let viewController = segue.destination as? OpenedSalonTableViewController {
                viewController.salon = dataSource[indexPath.row]
            }
        }
    }
}

// MARK: - Supporting functions
extension SalonListTableViewController {
    
}

// MARK: - UITableViewDataSource
extension SalonListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let salon = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! SalonTableViewCell
        
        cell.name.text = salon.name ?? ""
        cell.website.text = salon.website ?? ""
        
        if let link = salon.profileImages?.original, let url = URL(string: link) {
            
            let loader = UIActivityIndicatorView()
            loader.layer.zPosition = 2
            cell.salonImage.addSubview(loader)
            loader.frame = cell.salonImage.bounds
            loader.hidesWhenStopped = true
            loader.activityIndicatorViewStyle = .gray
            loader.startAnimating()
            
            cell.salonImage.kf.setImage(with: url, completionHandler: { (_, error, _, _) in
                loader.stopAnimating()
            })
        } else {
            cell.salonImage.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

// MARK: - UITableViewDelegate
extension SalonListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openSalon", sender: indexPath)
    }
}
