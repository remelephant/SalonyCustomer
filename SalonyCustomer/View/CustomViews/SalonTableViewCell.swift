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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("selected")
        // Configure the view for the selected state
    }
    
    func configureTextViews(salon: ModelSalonExtended?) {
        var textViews: [UITextView] = []
        expandedView.subviews.forEach { $0.removeFromSuperview() }
        
        let text = configureWorkingHoursTextView(weekdays: salon?.hours)
        let weekdaysTextView = createTextView(origin: expandedView.bounds.origin, text: text)
        textViews.append(weekdaysTextView)
        
        if let text = configureServiceTextView(services: salon?.services).text {
            let servicesTextView = createTextView(origin: CGPoint(x: weekdaysTextView.bounds.minX, y: weekdaysTextView.bounds.maxY), text: text)
            textViews.append(servicesTextView)
            if let stylists = configureServiceTextView(services: salon?.services).stylists {
                if let text = configureStylistsTextView(stylists: stylists) {
                    let stylistsTextView = createTextView(origin: CGPoint(x: servicesTextView.bounds.minX, y: servicesTextView.bounds.maxY), text: text)
                    textViews.append(stylistsTextView)
                }
            }
        }
    }
    
    private func createTextView(origin: CGPoint, text: String) -> UITextView {
        let textView = UITextView()
        expandedView.addSubview(textView)
        textView.frame.origin = origin
        textView.frame.size.width = expandedView.bounds.width
        textView.text = text
        textView.isScrollEnabled = false
        textView.sizeToFit()
        return textView
    }
    
    func configureWorkingHoursTextView(weekdays: [String: ModelWorkingHours]?) -> String {

        guard let weekdays = weekdays, weekdays.keys.count > 0 else { return "Information about working hours is missing" }
        
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
    
    func configureStylistsTextView(stylists: [ModelStylist]?) -> String? {
        var text = "Stylists -"
        guard let stylists = stylists, !stylists.isEmpty else { return nil }
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
        return text
    }
    
    func configureServiceTextView(services: [ModelService]?) -> (text: String?, stylists: [ModelStylist]?) {
        var text = ""
        guard let services = services  else {
            return (nil, nil)
        }

        var stylists = [ModelStylist]()
        for service in services {
            if let stylistArray = service.stylists {
                stylistArray.forEach { stylists.append($0) }
            }
            if let name = service.name, let duration = service.duration, let price = service.price {
                text.append("Service \(name): duration - \(duration) min., price - \(price)$. ")
            }
        }
        return (text, stylists)
    }
}
