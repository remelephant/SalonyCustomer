//
//  OpenedSalonTableViewController.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/13/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

class OpenedSalonTableViewController: UITableViewController,UIActivityPresenter {
    
    /// ActivityIndicatorPresenter protocol properties
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var whiteView: UIView = UIView()
    
    let server = SalonAPI()
    var salon: ModelSalon?
    var salonExtended: ModelSalonExtended?
    
    // we need multiple types of cells
    var dataSource: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = salon?.id {
            server.obtainExtendedSalon(id: id, completion: { [weak self] (salon) in
                if let salon = salon {
                    self?.salonExtended = salon
                    self?.sortWorkingHours(weekdays: self?.salonExtended?.hours)
                    self?.salonExtended?.services?.forEach { self?.dataSource.append($0) }
                    if let services = self?.salonExtended?.services {
                        var stylists = [ModelStylist]()
                        for service in services {
                            service.stylists?.forEach { stylists.append($0) }
                        }
                        stylists.forEach { self?.dataSource.append($0) }
                    }
                    self?.tableView.reloadData()
                }
            })
        }
        
    }
}

// MARK: - Supporting functions
extension OpenedSalonTableViewController {
    private func sortWorkingHours(weekdays: [String: ModelWorkingHours]?) {
        guard let weekdays = weekdays, weekdays.keys.count > 0 else { return }
        
        for day in Weekdays.allValues {
            if weekdays.keys.contains(day.rawValue) {
                dataSource.append([day.rawValue: weekdays[day.rawValue]])
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension OpenedSalonTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let service = dataSource[indexPath.row] as? ModelService {
            if let name = service.name, let duration = service.duration, let price = service.price {
                cell.textLabel?.text = "\(name), \(duration) min., \(price)$."
            }
            cell.backgroundColor = UIColor(red:0.75, green:0.87, blue:0.85, alpha:1.0)
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        
        if let stylist = dataSource[indexPath.row] as? ModelStylist {
            if let name = stylist.name {
                cell.textLabel?.text = name
            }
            
            cell.backgroundColor = UIColor(red:0.49, green:0.27, blue:0.15, alpha:1.0)
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        
        if let weekday = dataSource[indexPath.row] as? [String: ModelWorkingHours] {
            if let day = weekday.first, let from = day.value.from, let to = day.value.to {
                cell.textLabel?.text = "\((day.key).capitalized) from: \(from), to: \(to)"
            }
            cell.backgroundColor = UIColor(red:0.98, green:0.90, blue:0.59, alpha:1.0)
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        cell.backgroundColor = UIColor.white
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }
}

// MARK: - UITableViewDelegate
extension OpenedSalonTableViewController {
    
}
