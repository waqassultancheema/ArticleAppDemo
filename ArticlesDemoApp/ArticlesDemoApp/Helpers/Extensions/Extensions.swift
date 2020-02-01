//
//  Extensions.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/14/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol AlertView   {
    func displayalert(title:String, message:String)
}

extension AlertView where Self: ArticlesViewController {
    
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: "\(message) \n\nPlease Press Retry", preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "Retry", style: .default, handler: { [unowned self] (action) -> Void in
            self.fetchArticles()
            alert.dismiss(animated: true, completion: nil)
            
        })))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func showTimePeriodFilters() {
        let alert = UIAlertController(title: "Select Time Period", message: nil, preferredStyle: .actionSheet)
        for timePeriod in TimePeriod.names {
            let timePeriodAction = UIAlertAction(title: getDisplayNameForTimePeriod(timePeriod: timePeriod),
                                                 style: .default, handler: { action in
                                                    self.selectedTimePeriod = timePeriod
                                                    self.fetchArticles()
            })
            alert.addAction(timePeriodAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func getDisplayNameForTimePeriod(timePeriod: TimePeriod) -> String {
        if self.selectedTimePeriod == timePeriod {
            return "✓" + timePeriod.name
        }
        return timePeriod.name
    }
}


extension UIView {
    
    
    func startActivityIndicator() {
        ActivityIndicator.sharedInstance.showProgressView(view: self)
    }
    
    func stopActivityIndicator() {
        ActivityIndicator.sharedInstance.hideProgressView()
    }
    
    
}

extension UIColor {
    
    class func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

