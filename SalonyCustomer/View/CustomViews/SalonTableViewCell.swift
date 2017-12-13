//
//  SalonTableViewCell.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

class SalonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var salonImage: UIImageView!
    @IBOutlet weak var stylistsTextView: UITextView!
    @IBOutlet weak var servicesTextView: UITextView!
    @IBOutlet weak var workingHoursTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureWorkingHoursTextView(workingHours: [String: ModelWorkingHours]?) {
        if let workingHours = workingHours {
            workingHoursTextView.text = workingDays(weekdays: workingHours)
        } else {
            workingHoursTextView.text = ""
        }
        
        textViewHeight(textView: workingHoursTextView)
    }
    
    private func workingDays(weekdays: [String: ModelWorkingHours]) -> String {
        
        guard weekdays.keys.count > 0 else { return "Information about working hours is missing" }
        
        var mutableWeekdays = weekdays
        
        var days = "Working hours - "
        for day in Weekdays.allValues {
            if mutableWeekdays.keys.contains(day.rawValue) {
                if let weekday = weekdays[day.rawValue], let from = weekday.from, let to = weekday.to {
                    days.append("\(day): from \(from) to \(to)")
                }
                mutableWeekdays.removeValue(forKey: day.rawValue)
                if mutableWeekdays.isEmpty {
                    days.append(".")
                } else {
                    days.append(", ")
                }
            }
        }
        return days
    }
    
    func configureStylistsTextView(stylists: [ModelStylist]?) {
        var text = "Stylists -"
        
        guard let stylists = stylists else { return }
        
        for stylist in stylists {
            if let name = stylist.name {
                text.append(" \(name)")
                if stylist === stylists.last {
                    text.append(", ")
                } else {
                    text.append(".")
                }
            }
        }
        stylistsTextView.text = text
        textViewHeight(textView: stylistsTextView)
    }
    
    func configureServiceTextView(services: [ModelService]?) {
        var text = ""
        guard let services = services  else {
            return
        }
        
        var stylists = [ModelStylist]()
        for service in services {
            if let stylistArray = service.stylists {
                stylistArray.forEach { stylists.append($0) }
            }
            if let name = service.name, let duration = service.duration, let price = service.price {
                text.append("Service \(name): duration - \(duration), price - \(price)")
            }
            
            configureStylistsTextView(stylists: stylists)
        }
        
        textViewHeight(textView: servicesTextView)
    }
    
    private func textViewHeight(textView : UITextView) {
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.sizeToFit()
        textView.isScrollEnabled = false
    }
}
