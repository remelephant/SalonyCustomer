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
    @IBOutlet weak var salonImage: UIImageView!
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var workingHoursText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWorkingHours(workingHours: [String: ModelWorkingHours]?) {
        if let workingHours = workingHours {
            workingHoursText.text = orderdWorkingDays(weekdays: workingHours)
        } else {
            workingHoursText.text = ""
        }
        
        adjustUITextViewHeight(arg: workingHoursText)
    }
    
    private func orderdWorkingDays(weekdays: [String: ModelWorkingHours]) -> String {
        
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
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
}
